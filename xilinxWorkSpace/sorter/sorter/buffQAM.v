
module buffQAM#
(
	parameter WIDTH = 8,
	parameter n = 4
)
(
	input [n*WIDTH-1:0]din,
	input en,
	output [n*WIDTH-1:0]doutQAM,
	output [n*WIDTH-1:0]doutQPSK
);

assign doutQAM = en ? 'bz:din; 
assign doutQPSK = en ? din:'bz;
endmodule