module bufferTri#
(
	parameter  WIDTH = 8,
	parameter  n = 2
)
(
	input [n*WIDTH-1:0]din, 
	input en,
	output [n*WIDTH-1:0]dout
);

assign dout = en ? din:'bz; 

endmodule