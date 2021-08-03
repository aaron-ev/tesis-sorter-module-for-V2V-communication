
module squareComplex#(parameter WIDTH = 16) 
(
	input  [WIDTH-1:0]aReal, 
	input  [WIDTH-1:0]aImag, 
	output  [WIDTH-1:0]outReal,
	output  [WIDTH-1:0]outImag
);

`define SUB 1
`define SUM 0

wire [WIDTH-1:0]tempOutSquare0; 
wire [WIDTH-1:0]tempOutSquare1; 
 
square#(.WIDTH(WIDTH)) square0
(
	.a(aReal),
	.out(tempOutSquare0)
);

square#(.WIDTH(WIDTH)) square1
(
	.a(aImag),
	.out(tempOutSquare1)
);

adderSub#(.WIDTH(WIDTH),.OP(`SUB)) adder0
(
	.a(tempOutSquare0),
	.b(tempOutSquare1),
	.sum(outReal)
);


mul2ab#(.WIDTH(WIDTH)) mul2ab0
(
	.a(aReal),
	.b(aImag),
	.out(outImag)
);


endmodule