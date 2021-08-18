module bufferTri#
(
	parameter WIDTH = 8,
	parameter n = 4
)
(
	input [n*WIDTH-1:0]din,
	input en,
	output [n*WIDTH-1:0]dout1,
	output [n*WIDTH-1:0]dout2
);

assign dout1 = en ? 'bz:din; 
assign dout2 = en ? din:'bz;
endmodule