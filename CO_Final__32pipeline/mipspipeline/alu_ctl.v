/*
	Title:	ALU Control Unit
	Author: Garfield (Computer System and Architecture Lab, ICE, CYCU)
	Input Port
		1. ALUOp: 控制alu是要用+還是-或是其他指令
		2. Funct: 如果是其他指令則用這邊6碼判斷
	Output Port
		1. ALUOperation: 最後解碼完成之指令
*/

module alu_ctl( clk, ALUOp, Funct, ALUOperation, DIVSignal, MUXsignal);
	input clk ;
    input [1:0] ALUOp;
    input [5:0] Funct;
    output [2:0] ALUOperation;
	output [5:0] DIVSignal ;
	output [1:0] MUXsignal;

    reg    [2:0] ALUOperation;
	reg    [1:0] MUXsignal;

    // symbolic constants for instruction function code
    parameter F_add = 6'd32;
    parameter F_sub = 6'd34;
    parameter F_and = 6'd36;
    parameter F_or  = 6'd37;
    parameter F_slt = 6'd42;
	parameter F_sl1 = 6'd0;
	parameter F_DIVU= 6'd27; // 011011
	parameter F_MFHI= 6'd16;
	parameter F_MFLO= 6'd18;
	parameter ORI = 6'd13;

    // symbolic constants for ALU Operations
    parameter ALU_add = 3'b010;
    parameter ALU_sub = 3'b110;
    parameter ALU_and = 3'b000;
    parameter ALU_or  = 3'b001;
    parameter ALU_slt = 3'b111;
	parameter ALU_sll = 3'b011;

    always @(ALUOp or Funct)
    begin
        case (ALUOp) 
            2'b00 : ALUOperation = ALU_add;
            2'b01 : ALUOperation = ALU_sub;
            2'b10 : case (Funct) 
                        F_add : begin
							ALUOperation = ALU_add; 
							MUXsignal = 2'b10;
						end
                        F_sub : begin
							ALUOperation = ALU_sub; 
							MUXsignal = 2'b10;
						end
                        F_and : begin
							ALUOperation = ALU_and; 
							MUXsignal = 2'b10;
						end
                        F_or  : begin
							ALUOperation = ALU_or; 
							MUXsignal = 2'b10;
						end
						F_sl1 : begin
							ALUOperation = ALU_sll; 
							MUXsignal = 2'b10;
                        end
						F_slt : begin
							ALUOperation = ALU_slt; 
							MUXsignal = 2'b10;
						end
						ORI: begin
							ALUOperation = ALU_or; ; 
							MUXsignal = 2'b10;
                        end
						F_MFHI: begin
							ALUOperation = 3'bxxx; 
							MUXsignal = 2'b00;
						end
						F_MFLO: begin
							ALUOperation = 3'bxxx; 
							MUXsignal = 2'b01;
						end
						
						default ALUOperation = 3'bxxx;
                    endcase
            default ALUOperation = 3'bxxx;
        endcase
    end

endmodule

