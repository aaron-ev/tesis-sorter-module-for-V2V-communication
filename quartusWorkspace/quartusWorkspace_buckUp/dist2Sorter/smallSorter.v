

module smallSorter#(parameter WIDTH = 8)
(
	input [WIDTH-1:0]d1,d2,d3,d4,
	output [2*2*WIDTH-1:0]d
);
wire [2*WIDTH-1:0]d_0 = d1 > d2 ? {d1,d2}:{d2,d1};
wire [2*WIDTH-1:0]d_1  = d3 > d4 ? {d3,d4}:{d4,d3};

assign d = {d_1,d_0};

endmodule