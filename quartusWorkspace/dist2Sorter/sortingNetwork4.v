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

wire [WIDTH-1:0] tempLComp0;
wire [WIDTH-1:0] tempLComp1;
wire [WIDTH-1:0] tempLComp2;
wire [WIDTH-1:0] tempLComp3;

wire [WIDTH-1:0] tempHComp0;
wire [WIDTH-1:0] tempHComp1;
wire [WIDTH-1:0] tempHComp2;
wire [WIDTH-1:0] tempHComp3;

comparator#(.WIDTH(WIDTH)) comparator0
(
	.A(a0),
	.B(a1),
	.L(tempLComp0),
	.H(tempHComp0)
);

comparator#(.WIDTH(WIDTH)) comparator1
(
	.A(a2),
	.B(a3),
	.L(tempLComp1),
	.H(tempHComp1)
);

comparator#(.WIDTH(WIDTH)) comparator2
(
	.A(tempLComp0),
	.B(tempHComp1),
	.L(tempLComp2),
	.H(tempHComp2)
);

comparator#(.WIDTH(WIDTH)) comparator3
(
	.A(tempHComp0),
	.B(tempLComp1),
	.L(tempLComp3),
	.H(tempHComp3)
);
comparator#(.WIDTH(WIDTH)) comparator4
(
	.A(tempLComp2),
	.B(tempLComp3),
	.L(y0),
	.H(y1)
);

comparator#(.WIDTH(WIDTH)) comparator5
(
	.A(tempHComp3),
	.B(tempHComp2),
	.L(y2),
	.H(y3)
);

endmodule

