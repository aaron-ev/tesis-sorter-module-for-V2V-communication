
module ctrlUnitDotProductTESTCOUNTER#(parameter ADDR_WIDTH = 3)
(
	input clk,
	input rst, 
	input start,
	output reg we,
	output reg [ADDR_WIDTH-1:0] addr,
	output reg done
);

localparam false = 1'd0;
localparam true = 1'd1;

reg flagStart;
 
always@(posedge clk,negedge rst) 
	begin
		if(!rst)
			begin 
				done <= false;	
				addr <= 0; 
				we <= 0;
				flagStart <= false;
			end
		else 
			begin 
				if(start || flagStart)
					flagStart <= true;
					done <= false;	
					we <= 1;
					addr <= addr + 1; 
					if(addr == 4)
						begin
							flagStart <= false; 
							done <= true; 
							addr <= 0; 
							we <= 0;
						end
			end
	end
	
endmodule