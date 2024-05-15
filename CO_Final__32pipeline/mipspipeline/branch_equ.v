
module branch_equ( opcode, zero, a, b );

    parameter BEQ = 6'd4;
    parameter BNE = 6'd5;

    input  [5:0] opcode;
    input  [31:0] a, b;
    output zero ;

    assign zero = (opcode == BEQ && a == b) ? 1'b1 :
		  (opcode == BNE && a != b) ? 1'b1 : 1'b0;

endmodule
