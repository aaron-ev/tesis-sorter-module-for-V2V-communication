module sortingNetwork4#(parameter WIDTH = 16)
(
	input [WIDTH-1:0]a0, 
	input	[WIDTH-1:0]a1,
	input	[WIDTH-1:0]a2,
	input	[WIDTH-1:0]a3,
	output [WIDTH-1:0]y0,
	output [WIDTH-1:0]y1,
	output [WIDTH-1:0]y2,
	output [WIDTH-1:0]y3
);

wire [WIDTH-1:0] tempMinComp0;
wire [WIDTH-1:0] tempMinComp1;
wire [WIDTH-1:0] tempMinComp2;
wire [WIDTH-1:0] tempMinComp3;

wire [WIDTH-1:0] tempMaxComp0;
wire [WIDTH-1:0] tempMaxComp1;
wire [WIDTH-1:0] tempMaxComp2;
wire [WIDTH-1:0] tempMaxComp3;

comparator#(.WIDTH(WIDTH)) comparator0
(
	.a(a0),
	.b(a1),
	.min(tempMinComp0),
	.max(tempMaxComp0)
);

comparator#(.WIDTH(WIDTH)) comparator1
(
	.a(a2),
	.b(a3),
	.min(tempMinComp1),
	.max(tempMaxComp1)
);

comparator#(.WIDTH(WIDTH)) comparator2
(
	.a(tempMinComp0),
	.b(tempMaxComp1),
	.min(tempMinComp2),
	.max(tempMaxComp2)
);

comparator#(.WIDTH(WIDTH)) comparator3
(
	.a(tempMaxComp0),
	.b(tempMinComp1),
	.min(tempMinComp3),
	.max(tempMaxComp3)
);
comparator#(.WIDTH(WIDTH)) comparator4
(
	.a(tempMinComp2),
	.b(tempMinComp3),
	.min(y0),
	.max(y1)
);

comparator#(.WIDTH(WIDTH)) comparator5
(
	.a(tempMaxComp3),
	.b(tempMaxComp2),
	.min(y2),
	.max(y3)
);

endmodule

