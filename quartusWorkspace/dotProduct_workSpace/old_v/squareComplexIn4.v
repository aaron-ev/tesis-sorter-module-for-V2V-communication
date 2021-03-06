

module squareComplexIn4#(parameter WIDTH = 8)
(
	input [WIDTH-1:0] inaReal,
	input [WIDTH-1:0] inaImag,
	input [WIDTH-1:0] inbReal,
	input [WIDTH-1:0] inbImag,
	input [WIDTH-1:0] incReal,
	input [WIDTH-1:0] incImag,	
	input [WIDTH-1:0] indReal,
	input [WIDTH-1:0] indImag,
	
	output [2*WIDTH-1:0] outaReal,
	output [2*WIDTH-1:0] outaImag,
	output [2*WIDTH-1:0] outbReal,
	output [2*WIDTH-1:0] outbImag,
	output [2*WIDTH-1:0] outcReal,
	output [2*WIDTH-1:0] outcImag,
	output [2*WIDTH-1:0] outdReal,
	output [2*WIDTH-1:0] outdImag	
);

squareComplex#(.WIDTH(8)) squareComplexa
(
	.aReal(inaReal),
	.aImag(inaImag),
	.outReal(outaReal),
	.outImag(outaImag)
);
squareComplex#(.WIDTH(8)) squareComplexb
(
	.aReal(inbReal),
	.aImag(inbImag),
	.outReal(outbReal),
	.outImag(outbImag)
);
squareComplex#(.WIDTH(8)) squareComplexc
(
	.aReal(incReal),
	.aImag(incImag),
	.outReal(outcReal),
	.outImag(outcImag)
);
squareComplex#(.WIDTH(8)) squareComplexd
(
	.aReal(indReal),
	.aImag(indImag),
	.outReal(outdReal),
	.outImag(outdImag)
);

endmodule