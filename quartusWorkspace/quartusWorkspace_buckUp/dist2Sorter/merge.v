
// n means the numbers of inputs in the highest level
module merge#
(
	parameter WIDTH = 8, 
	parameter n = 8,
	parameter N2 = 2,
	parameter N4 = 4,
	parameter R2TO4 = 4,
	parameter R4TO8 = 2,
	parameter R8TO16 = 1
)
(
	input clk,
	input rst,
	input [R2TO4-1:0]load,
	input enQAM16,
	input [(2*N2)*WIDTH-1:0]inba,
	output [(2*n*WIDTH)-1:0]c
);

wire [(2*N2*R2TO4)*WIDTH-1:0]tempc2to4_row;
wire [(2*N4*R4TO8)*WIDTH-1:0]tempc4to8_row;


//wire [((2*N2*R2TO4)/2)*WIDTH-1:0] tempa4to8_row = tempc2to4_row[((2*N2*R2TO4)/2)*WIDTH-1:0];
//wire [((2*N2*R2TO4)/2)*WIDTH-1:0] tempb4to8_row = tempc2to4_row[(2*N2*R2TO4)*WIDTH-1:((2*N2*R2TO4)/2)*WIDTH];

 merge2to4_row#(.WIDTH(WIDTH),.R(R2TO4)) merge2to4_row_0 
(
	.clk(clk),
	.rst(rst),
	.load(load),
	.inba(inba),
	.c(tempc2to4_row)
);

merge4to8_row#(.WIDTH(WIDTH),.R(R4TO8)) merge4to8_row_0 
(
	.inba(tempc2to4_row),
	.c(tempc4to8_row)
);

merge8to16_row#(.WIDTH(WIDTH),.R(R8TO16)) merge8to16_row_0 
(
	.inba(tempc4to8_row),
	.c(tempcQAM16)
);

wire [(2*n*WIDTH)-1:0]tempcQAM16;
//buffer QPSK 
bufferTri#(.WIDTH(WIDTH),.n(16)) bufferQAM16
(
	.din(tempcQAM16),
	.en(enQAM16),
	.dout(c)
);

endmodule