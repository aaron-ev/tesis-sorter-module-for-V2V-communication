
module squareComplex#(parameter WIDTH = 8) 
(
	input  [WIDTH-1:0]aReal, 
	input  [WIDTH-1:0]aImag, 
	output  [2*WIDTH-1:0]outReal,
	output  [2*WIDTH-1:0]outImag
);

`define SUB 1
`define SUM 0

wire [2*WIDTH-1:0]tempOutSquare0; 
wire [2*WIDTH-1:0]tempOutSquare1; 
 
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

adderSub#(.WIDTH(16),.OP(`SUB)) adder0
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