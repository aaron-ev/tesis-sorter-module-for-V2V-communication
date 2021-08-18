module sortingNetwork4#
(
parameter WIDTH = 16)
(
	input [WIDTH-1:0]d1, 
	input [WIDTH-1:0]d2,
	input [WIDTH-1:0]d3,
	input [WIDTH-1:0]d4,
	output [4*WIDTH-1:0]d
);
wire [WIDTH-1:0]y0,y1,y2,y3; 

wire [WIDTH-1:0] tempMinComp0;
wire [WIDTH-1:0] tempMinComp1;
wire [WIDTH-1:0] tempMinComp2;
wire [WIDTH-1:0] tempMinComp3;

wire [WIDTH-1:0] tempMaxComp0;
wire [WIDTH-1:0] tempMaxComp1;
wire [WIDTH-1:0] tempMaxComp2;
wire [WIDTH-1:0] tempMaxComp3;

assign d = {y3,y2,y1,y0};

comparator#(.WIDTH(WIDTH)) comparator0
(
	.A(a0),
	.B(a1),
	.L(tempMinComp0),
	.H(tempMaxComp0)
);

comparator#(.WIDTH(WIDTH)) comparator1
(
	.A(a2),
	.B(a3),
	.L(tempMinComp1),
	.H(tempMaxComp1)
);

comparator#(.WIDTH(WIDTH)) comparator2
(
	.A(tempMinComp0),
	.B(tempMaxComp1),
	.L(tempMinComp2),
	.H(tempMaxComp2)
);

comparator#(.WIDTH(WIDTH)) comparator3
(
	.A(tempMaxComp0),
	.B(tempMinComp1),
	.L(tempMinComp3),
	.H(tempMaxComp3)
);
comparator#(.WIDTH(WIDTH)) comparator4
(
	.A(tempMinComp2),
	.B(tempMinComp3),
	.L(y0),
	.H(y1)
);

comparator#(.WIDTH(WIDTH)) comparator5
(
	.A(tempMaxComp3),
	.B(tempMaxComp2),
	.L(y2),
	.H(y3)
);

endmodule

