
module dist2#(parameter WIDTH = 16)
(
	input clk, 
	input rst,
	input [WIDTH-1:0] inaReal,
	input [WIDTH-1:0] inaImag,
	input [WIDTH-1:0] inbReal,
	input [WIDTH-1:0] inbImag,
	input [WIDTH-1:0] incReal,
	input [WIDTH-1:0] incImag,	
	input [WIDTH-1:0] indReal,
	input [WIDTH-1:0] indImag,
	
	output  [WIDTH-1:0] outaDist,
	output  [WIDTH-1:0] outbDist,	
	output  [WIDTH-1:0] outcDist,
	output  [WIDTH-1:0] outdDist	
);

norm #(.WIDTH(WIDTH)) norm_0
(
	.clk(clk),
	.rst(rst),
	.inaReal(inaReal),
	.inaImag(inaImag),	
	.inbReal(inbReal),
	.inbImag(inbImag),
	.incReal(incReal),
	.incImag(incImag),
	.indReal(indReal),
	.indImag(indImag),

	.outaDist(outaDist),
	.outbDist(outbDist),
	.outcDist(outcDist),
	.outdDist(outdDist)	
);

endmodule