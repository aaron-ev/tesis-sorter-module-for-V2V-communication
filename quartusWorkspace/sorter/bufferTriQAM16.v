module bufferTriQAM16#
(
	parameter WIDTH = 8,
	parameter n = 16
)
(
	input [n*WIDTH-1:0]din,
	input en,
	output [n*WIDTH-1:0]dout1
	//output [n*WIDTH-1:0]dout2
);

assign dout1 = en ? din:128'bz; 
//assign dout2 = en ? din:128'bz;

endmodule