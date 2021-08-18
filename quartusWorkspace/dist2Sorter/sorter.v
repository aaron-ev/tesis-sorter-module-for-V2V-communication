module sorter#
(
	parameter WIDTH = 16,
	parameter NUM_OUTPUTS = 16,
	parameter R2TO4 = 4,
	parameter R4TO8 = 2,
	parameter R8TO16 = 1
)
(
	input clk, 
	input rst,
	input [WIDTH-1:0] d1,
	input [WIDTH-1:0] d2,
	input [WIDTH-1:0] d3,
	input [WIDTH-1:0] d4,
	input [1:0]load4to8,
	input [1:0]load8to16,
	output [(NUM_OUTPUTS*WIDTH)-1:0]d
);
wire [4*WIDTH-1:0]tempd;

sortingNetwork4#(.WIDTH(WIDTH))
(
	.d1(d1),
	.d2(d2),
	.d3(d3),
	.d4(d4),
	.d(tempd)
);
merge#(.WIDTH(WIDTH))mergeUnit
(
	 .clk(clk),
	 .rst(rst),
	 .load4to8(load4to8),
	 .load8to16(load8to16),
	 .inba(tempd),
	 .c(d)
);
endmodule