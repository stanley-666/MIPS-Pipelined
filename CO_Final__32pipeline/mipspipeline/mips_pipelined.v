

module mips_pipelined( clk, rst );
	input clk, rst;
	
	// instruction bus
	wire[31:0] instr, instr_out;
	
	// DIV
	wire [5:0] SignaltoDIV ;
	wire [1:0] MUXsignal ;
	
	// break out important fields from instruction
	wire [5:0] opcode, funct, funct_out;;
    wire [4:0] rs, rt, rt_out, rd, rd_out, shamt, shamt_out; // shamt SLL‰ΩçÁßª???
    wire [15:0] immed;
    wire [31:0] extend_immed, extend_out, b_offset;
    wire [25:0] jumpoffset;
	wire [63:0] DivAns;
	
	// datapath signals
    wire [4:0] rfile_wn, wn_1, wn_2;
    wire [31:0] rfile_rd1, rd1_out, rfile_rd2, rd2_out, rfile_wd, rd2ToWD, alu_b, alu_out, b_tgt, mux41, mux_out, 
				ADDR_out, pc_next, HiOut, LoOut, pc, pc_incr, pc_add, dmem_rdata, dmem_rdata_out, jump_addr, branch_addr;

	// control signals
    wire RegWrite, Branch, PCSrc, RegDst, MemtoReg, MemRead, MemWrite, ALUSrc, Zero, Jump, Sign;
    wire [1:0] ALUOp, ALU_Out_Sel;
    wire [2:0] Operation;
	
	wire [1:0] WB_reg, WB_reg_1, WB_reg_2, WB_reg_3;
	wire [1:0] MEM_reg, MEM_reg_1, MEM_reg_2;
	wire [3:0] EX_reg, EX_reg_1 ;
	
    assign opcode = instr_out[31:26];
    assign rs = instr_out[25:21];
    assign rt = instr_out[20:16];
    assign rd = instr_out[15:11];
    assign shamt = instr_out[10:6];
    assign funct = instr_out[5:0];
    assign immed = instr_out[15:0];
    assign jumpoffset = instr_out[25:0];
	
	// branch offset shifter
    assign b_offset = extend_immed << 2;
	
	// jump offset shifter & concatenation
	assign jump_addr = { pc_incr[31:28], jumpoffset << 2 };

    assign WB_reg = { MemtoReg, RegWrite };   
	assign MEM_reg = { MemWrite, MemRead };  
	assign EX_reg = { ALUSrc, RegDst, ALUOp };   // [1:0]?òØALUOP

	// module instantiations
	
	reg32 PC( .clk(clk), .rst(rst), .en_reg(1'b1), .d_in(pc_next), .d_out(pc) );
	
    add32 PCADD( .a(pc), .b(32'd4), .result(pc_incr) ); // pc + 4
	
    and BR_AND(PCSrc, Branch, Zero); 
	
    mux2 #(32) PCMUX( .sel(PCSrc), .a(pc_incr), .b(b_tgt), .y(branch_addr) ); // branch
	
	mux2 #(32) JMUX( .sel(Jump), .a(branch_addr), .b(jump_addr), .y(pc_next) ); // jump
	
	memory InstrMem( .clk(clk), .MemRead(1'b1), .MemWrite(1'b0), .wd(32'd0), .addr(pc), .rd(instr) );

    // ==================== IF_ID =====================
    IF_ID IF_ID_Reg( .clk(clk), .rst(rst), .en_reg(1'b1), .pc_out(pc_add), .ins_out(instr_out), .pc_in(pc_incr), .ins_in(instr) );
    // ==================== IF_ID =====================

    control_pipelined CTL(.opcode(opcode), .RegDst(RegDst), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg), 
                       .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .Branch(Branch), 
                       .Jump(Jump), .ALUOp(ALUOp), .beqORben(beqORben), .Sign(Sign));
					   
    add32 BRADD( .a(pc_add), .b(b_offset), .result(b_tgt) ); // pc + 4 + s_extamd(offset<<2)

    branch_equ equ( .opcode(opcode), .zero(Zero), .a(rfile_rd1), .b(rfile_rd2) );

    reg_file RegFile( .clk(clk), .RegWrite(WB_reg_3[0]), .RN1(rs), .RN2(rt), .WN(wn_2), 
					  .WD(rfile_wd), .RD1(rfile_rd1), .RD2(rfile_rd2) );

	extend Extend( .immed_in(immed), .ext_immed_out(extend_immed), .Sign(Sign) ); // Extend
	
    // ==================== ID_EX =====================
	ID_EX ID_EX_Reg( .clk(clk), .rst(rst), .en_reg(1'b1), .WB_out(WB_reg_1), .MEM_out(MEM_reg_1), .EX_out(EX_reg_1), .shamt_out(shamt_out), .funct_out(funct_out),
					 .RD1_out(rd1_out), .RD2_out(rd2_out), .immed_out(extend_out), .rt_out(rt_out), .rd_out(rd_out),
					 .WB_in(WB_reg), .MEM_in(MEM_reg), .EX_in(EX_reg), .shamt_in(shamt), .funct_in(funct), .RD1_in(rfile_rd1), .RD2_in(rfile_rd2), 
					 .immed_in(extend_immed), .rt_in(rt), .rd_in(rd) );
					 
	// ==================== ID_EX =====================

	divider Divider( .clk(clk), .dataA(rd1_out), .dataB(rd2_out), .Signal(SignaltoDIV), .dataOut(DivAns), .reset(reset) );

	HiLo HiLo( .clk(clk), .Divans(DivAns), .HiOut(HiOut), .LoOut(LoOut), .reset(reset) );
	
	mux2 #(32) ALUMUX( .sel(EX_reg_1[3]), .a(rd2_out), .b(extend_out), .y(alu_b) );
	
    ALU alu( .ctl(Operation), .A(rd1_out), .B(alu_b), .DATAOUT(alu_out), .shamt(shamt_out) );

    alu_ctl ALUCTL( .clk(clk), .ALUOp(EX_reg_1[1:0]), .Funct(funct_out), .ALUOperation(Operation), .DIVSignal(SignaltoDIV), .MUXsignal(MUXsignal) );

	mux4 MUX41( .sel(MUXsignal), .a(HiOut), .b(LoOut), .c(alu_out), .y(mux41) ) ;

    mux2 #(5) RFMUX( .sel(EX_reg_1[2]), .a(rt_out), .b(rd_out), .y(rfile_wn) );

    // ==================== EX_MEM =====================
    EX_MEM EX_MEM_Reg( .clk(clk), .rst(rst), .en_reg(1'b1), .WB_out(WB_reg_2), .MEM_out(MEM_reg_2), .mux_out(mux_out), .RD2_out(rd2ToWD), .WN_out(wn_1),
					   .WB_in(WB_reg_1), .MEM_in(MEM_reg_1), .mux_in(mux41), .RD2_in(rd2_out), .WN_in(rfile_wn) ); 
    // ==================== EX_MEM =====================


    memory DatMem( .clk(clk), .MemRead(MEM_reg_2[0]), .MemWrite(MEM_reg_2[1]), .wd(rd2ToWD), 
				   .addr(mux_out), .rd(dmem_rdata) );

    // ==================== MEM_WB =====================
    MEM_WB MEM_WB_Reg( .clk(clk), .rst(rst), .en_reg(1'b1), .WB_out(WB_reg_3), .RD_out(dmem_rdata_out), .ADDR_out(ADDR_out), .WN_out(wn_2),
								.WB_in(WB_reg_2), .RD_in(dmem_rdata), .ADDR_in(mux_out), .WN_in(wn_1) );
    // ==================== MEM_WB =====================

    mux2 #(32) WRMUX( .sel(WB_reg_3[1]), .a(ADDR_out), .b(dmem_rdata_out), .y(rfile_wd) );
	   
endmodule
