
module MEM_WB ( clk, rst, en_reg, WB_out, RD_out, ADDR_out, WN_out,
								  WB_in,  RD_in,  ADDR_in,  WN_in );
								  
    input clk, rst, en_reg;
	
	input [1:0]  WB_in;
	input [4:0]	 WN_in;
    input [31:0] RD_in, ADDR_in;
	
	output [1:0]  WB_out;
	output [4:0]  WN_out;
    output [31:0] RD_out, ADDR_out;
	
	reg	  [1:0]  WB_out;
	reg   [4:0]  WN_out;
    reg   [31:0] RD_out, ADDR_out;
   
    always @( posedge clk ) begin
        if ( rst ) begin
		WB_out    <= 2'b0;
		RD_out    <= 32'b0;
		ADDR_out  <= 32'b0; 
		WN_out    <= 5'b0;
	end
        else if ( en_reg ) begin
		WB_out    <=  WB_in;
		RD_out    <=  RD_in;
		ADDR_out  <=  ADDR_in; 
		WN_out    <=  WN_in;
	end
    end
endmodule
