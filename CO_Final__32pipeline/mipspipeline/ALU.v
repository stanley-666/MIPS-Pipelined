
module ALU( DATAOUT, A, B, ctl, ZERO, shamt); // shamt shifter ctl == 011
	input [31:0]A ;
	input [31:0]B ;
	input [4:0] shamt;
	input [2:0] ctl ; 
	output [31:0] DATAOUT;
	output ZERO;
	wire [31:0] Cout;
	wire [31:0] TEMPOUT, sll_ans;
	wire set ;
	
	// and 000
	// or  001
	// add 010
	// sub 110 ZERO 1|0
	// stl 111
	
	// sll 011
	
	onebitALU alu1(TEMPOUT[0], A[0], B[0], ctl[2], Cout[0], ctl, set );
	onebitALU alu2(TEMPOUT[1], A[1], B[1], Cout[0], Cout[1], ctl, 1'b0);
	onebitALU alu3(TEMPOUT[2], A[2], B[2], Cout[1], Cout[2], ctl, 1'b0);
	onebitALU alu4(TEMPOUT[3], A[3], B[3], Cout[2], Cout[3], ctl, 1'b0);
	onebitALU alu5(TEMPOUT[4], A[4], B[4], Cout[3], Cout[4], ctl, 1'b0);
	onebitALU alu6(TEMPOUT[5], A[5], B[5], Cout[4], Cout[5], ctl, 1'b0);
	onebitALU alu7(TEMPOUT[6], A[6], B[6], Cout[5], Cout[6], ctl, 1'b0);
	onebitALU alu8(TEMPOUT[7], A[7], B[7], Cout[6], Cout[7], ctl, 1'b0);
	onebitALU alu9(TEMPOUT[8], A[8], B[8], Cout[7], Cout[8], ctl, 1'b0);
	onebitALU alu10(TEMPOUT[9], A[9], B[9],	Cout[8], Cout[9], ctl, 1'b0);
	onebitALU alu11(TEMPOUT[10], A[10], B[10], Cout[9],	Cout[10], ctl, 1'b0);
	onebitALU alu12(TEMPOUT[11], A[11], B[11], Cout[10], Cout[11], ctl, 1'b0);
	onebitALU alu13(TEMPOUT[12], A[12], B[12], Cout[11], Cout[12], ctl, 1'b0);
	onebitALU alu14(TEMPOUT[13], A[13], B[13], Cout[12], Cout[13], ctl, 1'b0);
	onebitALU alu15(TEMPOUT[14], A[14], B[14], Cout[13], Cout[14], ctl, 1'b0);
	onebitALU alu16(TEMPOUT[15], A[15], B[15], Cout[14], Cout[15], ctl, 1'b0);
	onebitALU alu17(TEMPOUT[16], A[16], B[16], Cout[15], Cout[16], ctl, 1'b0);
	onebitALU alu18(TEMPOUT[17], A[17], B[17], Cout[16], Cout[17], ctl, 1'b0);
	onebitALU alu19(TEMPOUT[18], A[18], B[18], Cout[17], Cout[18], ctl, 1'b0);
	onebitALU alu20(TEMPOUT[19], A[19], B[19], Cout[18], Cout[19], ctl, 1'b0);
	onebitALU alu21(TEMPOUT[20], A[20], B[20], Cout[19], Cout[20], ctl, 1'b0);
	onebitALU alu22(TEMPOUT[21], A[21], B[21], Cout[20], Cout[21], ctl, 1'b0);
	onebitALU alu23(TEMPOUT[22], A[22], B[22], Cout[21], Cout[22], ctl, 1'b0);
	onebitALU alu24(TEMPOUT[23], A[23], B[23], Cout[22], Cout[23], ctl, 1'b0);
	onebitALU alu25(TEMPOUT[24], A[24], B[24], Cout[23], Cout[24], ctl, 1'b0);
	onebitALU alu26(TEMPOUT[25], A[25], B[25], Cout[24], Cout[25], ctl, 1'b0);
	onebitALU alu27(TEMPOUT[26], A[26], B[26], Cout[25], Cout[26], ctl, 1'b0);
	onebitALU alu28(TEMPOUT[27], A[27], B[27], Cout[26], Cout[27], ctl, 1'b0);
	onebitALU alu29(TEMPOUT[28], A[28], B[28], Cout[27], Cout[28], ctl, 1'b0);
	onebitALU alu30(TEMPOUT[29], A[29], B[29], Cout[28], Cout[29], ctl, 1'b0);	
	onebitALU alu31(TEMPOUT[30], A[30], B[30], Cout[29], Cout[30], ctl, 1'b0);	
	thirty2thbitALU alu32(TEMPOUT[31], A[31], B[31], Cout[30], Cout[31], ctl, 1'b0, set);
	
    assign ZERO = (TEMPOUT == 32'd0)? 1 : 0 ;
	
	shifter sll( .dataA(A), .dataB(shamt), .out(sll_ans) );
	assign DATAOUT = (ctl == 3'b011)? sll_ans : TEMPOUT ;
	
endmodule