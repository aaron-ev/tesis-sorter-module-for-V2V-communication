
module decoderQAM#
(
	parameter WIDTH = 8,
	parameter n = 4,
	parameter n_sel = 1
)
(
	input [n*WIDTH-1:0]din,
	input [n_sel-1:0]sel,
	output [n*WIDTH-1:0]dout1
	output [n*WIDTH-1:0]dout1
);

assign doutQAM = sel ? 'bz:din; 
assign doutQPSK = sel ? din:'bz;
endmodule