module bufferTriQPSK#
(
	parameter WIDTH = 8,
	parameter n = 4
)
(
	input [n*WIDTH-1:0]din,
	input en,
	output [n*WIDTH-1:0]doutToMerge,
	output [n*WIDTH-1:0]doutToSorter
);



assign doutToMerge = en ? 32'bz:din; 
assign doutToSorter = en ? din:32'bz;

endmodule