
module fourComplex2#(parameter WIDTH = 16)
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
	output [WIDTH-1:0] outaReal,
	output [WIDTH-1:0] outaImag,
	output [WIDTH-1:0] outbReal,
	output [WIDTH-1:0] outbImag,
	output [WIDTH-1:0] outcReal,
	output [WIDTH-1:0] outcImag,
	output [WIDTH-1:0] outdReal,
	output [WIDTH-1:0] outdImag	
);

complex2#(.WIDTH(WIDTH)) a
(
	.clk(clk),
	.rst(rst),
	.aReal(inaReal),
	.aImag(inaImag),
	.outReal(outaReal),
	.outImag(outaImag)
);
complex2#(.WIDTH(WIDTH)) b
(
	.clk(clk),
	.rst(rst),
	.aReal(inbReal),
	.aImag(inbImag),
	.outReal(outbReal),
	.outImag(outbImag)
);
complex2#(.WIDTH(WIDTH)) c
(
	.clk(clk),
	.rst(rst),
	.aReal(incReal),
	.aImag(incImag),
	.outReal(outcReal),
	.outImag(outcImag)
);
complex2#(.WIDTH(WIDTH)) d
(
	.clk(clk),
	.rst(rst),
	.aReal(indReal),
	.aImag(indImag),
	.outReal(outdReal),
	.outImag(outdImag)
);

endmodule