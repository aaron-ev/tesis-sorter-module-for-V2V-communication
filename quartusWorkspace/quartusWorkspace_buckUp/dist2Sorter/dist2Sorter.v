
module dist2Sorter#(parameter WIDTH = 16,parameter n = 8)
(
	input clk, 
	input rst,
	input [WIDTH-1:0] inaReal,
	input [WIDTH-1:0] inaImag,
	input [WIDTH-1:0] inbReal,
	input [WIDTH-1:0] inbImag,
	input [WIDTH-1:0] incReal,
	input [WIDTH-1:0] incImag,	
	input [WIDTH-1:0] indReal,
	input [WIDTH-1:0] indImag,
	input  [4-1:0] load,
	/*
	output [WIDTH-1:0]c1,
	output [WIDTH-1:0]c2,
	output [WIDTH-1:0]c3,
	output [WIDTH-1:0]c4,
	output [WIDTH-1:0]c5,
	output [WIDTH-1:0]c6,
	output [WIDTH-1:0]c7,
	output [WIDTH-1:0]c8
	output [WIDTH-1:0]c9,
	output [WIDTH-1:0]c10,
	output [WIDTH-1:0]c11,
	output [WIDTH-1:0]c12,
	output [WIDTH-1:0]c13,
	output [WIDTH-1:0]c14,
	output [WIDTH-1:0]c15,
	output [WIDTH-1:0]c16
	*/
	output [(2*n*WIDTH)-1:0]c
);


wire [WIDTH-1:0] tempOutaDist;
wire [WIDTH-1:0] tempOutbDist;
wire [WIDTH-1:0] tempOutcDist;
wire [WIDTH-1:0] tempOutdDist;

wire [2*WIDTH-1:0] tempx;
wire [2*WIDTH-1:0] tempy;

wire [2*2*WIDTH-1:0] tempyTwoTimes1to2;
//wire [(2*4*WIDTH)-1:0]c;
dist2#(.WIDTH(WIDTH)) dist2_0  
(
	.clk(clk), 
	.rst(rst),
	.inaReal(inaReal),
	.inaImag(inaImag),
	.inbReal(inbReal),
	.inbImag(inbImag),
	.incReal(incReal),
	.incImag(incImag),	
	.indReal(indReal),
	.indImag(indImag),

	.outaDist(tempOutaDist),
	.outbDist(tempOutbDist),	
	.outcDist(tempOutcDist),
	.outdDist(tempOutdDist)
	);

twoTimesMerge1to2#(.WIDTH(WIDTH)) merge1to2
(
	.a(tempOutaDist),
	.b(tempOutbDist),
	.c(tempOutcDist),
	.d(tempOutdDist),
	//.x(tempx),
	//.y(tempy)
	.y(tempyTwoTimes1to2)
); 

merge#(.WIDTH(WIDTH)) merge_0
(
	 .clk(clk),
	 .rst(rst),
	 //.a(tempx),
	 //.b(tempy),
	 .load(load),
	 .inba(tempyTwoTimes1to2),
	 .c(c)
);

/*
assign c1 = c[1*WIDTH-1:0*WIDTH];
assign c2 = c[2*WIDTH-1:1*WIDTH];
assign c3 = c[3*WIDTH-1:2*WIDTH];
assign c4 = c[4*WIDTH-1:3*WIDTH];
assign c5 = c[5*WIDTH-1:4*WIDTH];
assign c6 = c[6*WIDTH-1:5*WIDTH];
assign c7 = c[7*WIDTH-1:6*WIDTH];
assign c8 = c[8*WIDTH-1:7*WIDTH];

assign c9 = c[9*WIDTH-1:8*WIDTH];
assign c10 = c[10*WIDTH-1:9*WIDTH];
assign c11 = c[11*WIDTH-1:10*WIDTH];
assign c12 = c[12*WIDTH-1:11*WIDTH];
assign c13 = c[13*WIDTH-1:12*WIDTH];
assign c14 = c[14*WIDTH-1:13*WIDTH];
assign c15 = c[15*WIDTH-1:14*WIDTH];
assign c16 = c[16*WIDTH-1:15*WIDTH];
*/
endmodule