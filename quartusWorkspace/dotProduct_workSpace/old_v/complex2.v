
module complex2#(parameter WIDTH = 16) 
(
	input clk,
	input rst,
	input  [WIDTH-1:0]aReal, 
	input  [WIDTH-1:0]aImag, 
	output  [WIDTH-1:0]outReal,
	output  [WIDTH-1:0]outImag
);

`define SUB 1
`define SUM 0
//temp signals for registers

wire [WIDTH-1:0]tempDoutReal; 
wire [WIDTH-1:0]tempDoutImag;
 
// input registers

register#(.WIDTH(WIDTH)) registerReal
(
	.clk(clk),
	.rst(rst),
	.din(aReal),
	.dout(tempDoutReal)
);

register#(.WIDTH(WIDTH)) registerImag
(
	.clk(clk),
	.rst(rst),
	.din(aImag),
	.dout(tempDoutImag)
);

squareComplex#(.WIDTH(WIDTH)) squareComplex0
(
	.aReal(tempDoutReal),
	.aImag(tempDoutImag),
	.outReal(outReal),
	.outImag(outImag)
);
endmodule