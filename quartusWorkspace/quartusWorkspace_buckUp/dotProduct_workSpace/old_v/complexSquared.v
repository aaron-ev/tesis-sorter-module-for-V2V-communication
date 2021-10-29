	
module complex2#(parameter WIDTH = 16) 
(
	input clk,
	input rst,
	input  [WIDTH-1:0]aReal, 
	input  [WIDTH-1:0]aImag, 
	output [WIDTH-1:0]outReal,
	output [WIDTH-1:0]outImag
);

reg  [WIDTH-1:0]tempAReal; 
reg  [WIDTH-1:0]tempAImag;

always@(posedge clk, negedge rst)
	begin
		if(!rst)
			begin 
				tempAReal <= 0;
				tempAImag <= 0; 
			end
		else 
			begin
				tempAReal <= aReal;
				tempAImag <= aImag;
			end
	end
	
assign outReal = (tempAReal * tempAReal) - (tempAImag * tempAImag); 
assign outImag = +2*(tempAReal * tempAImag);
 
endmodule


