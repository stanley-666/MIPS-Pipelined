/*
Input Port
		1. immed_in: 讀入欲做sign extend資料
		2. Sign : 0 無號 1 有號
	Output Port
		1. ext_immed_out: 輸出已完成sign extend資料
		
*/
module extend( immed_in, Sign, ext_immed_out );
    input Sign ;
	input[15:0] immed_in;
	output[31:0] ext_immed_out;
	assign ext_immed_out = Sign ? { {16{immed_in[15]}}, immed_in } : { 16'b0, immed_in };
endmodule
