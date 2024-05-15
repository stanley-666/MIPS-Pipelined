
module divider( clk, dataA, dataB, Signal, dataOut, reset);
output [63:0] dataOut;
input clk;
input reset;
input [31:0] dataA;
input [31:0] dataB;
input [5:0] Signal;

reg [63:0] temp ;
reg [31:0] DIVR ;
reg [63:0] REM ;
parameter DIVU = 6'b011011;
parameter OUT = 6'b111111;

reg [6:0] counter ;


always@( posedge clk )
begin
    if ( reset ) // 歸零
    begin
	    temp = 64'b0 ;
		DIVR = 32'b0 ;
		REM = 64'b0 ;
    end
	
	else
	begin	
		case ( Signal )
			DIVU:
			begin
				REM[63:32] = REM[63:32] - DIVR ;
				
				if(REM[63]) 
				begin
					REM[63:32] = REM[63:32] + DIVR ;
					REM = {REM[62:0], 1'b0}; // shift REM left 1 bit
				end
				
				else
				begin
					REM = {REM[62:0], 1'b1}; 
				end
				
				counter = counter + 1 ;
				
				if ( counter == 32 ) begin
				  temp = {1'b0, REM[63:33], REM[31:0] };  // shift REM right 1 bit
				end
			end
			
			default:
			begin
			    counter = 6'd0;
				REM = {31'b0, dataA[31:0], 1'b0}; // shift REM left 1 bit
                DIVR = dataB ;
			end
		endcase
    end
end

assign dataOut = temp ;

endmodule