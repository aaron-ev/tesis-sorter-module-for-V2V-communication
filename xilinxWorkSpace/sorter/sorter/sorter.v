module sorter#
(
	parameter WIDTH = 16,
	parameter NUM_OUTPUTS = 4,
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
	input start, 
	input [1:0]M,
	output done,
	output [NUM_OUTPUTS*WIDTH-1:0]y
);
wire [4*WIDTH-1:0]tempyQPSK;
wire [4*WIDTH-1:0]tempyQAM16;

wire [4*WIDTH-1:0]tempdToMerge;
wire [4*WIDTH-1:0]tempd2out;

wire [1:0]loadQPSK;
wire [1:0]loadQAM16;

//sorting network
sortingNetwork4#(.WIDTH(WIDTH)) sortingNetwork
(
	.d1(d1),
	.d2(d2),
	.d3(d3),
	.d4(d4),
	.d(tempyQPSK)
);
//merge uni
merge#(.WIDTH(WIDTH))mergeUnit
(
	 .clk(clk),
	 .rst(rst),
	 .loadQPSK(loadQPSK),
	 .loadQAM16(loadQAM16),
	 .inba(tempyQPSK),
	 .yQAM16(tempyQAM16)
);

muxQAM#(.WIDTH(WIDTH)) muxQAM_0 
(
	.yQPSK(tempyQPSK), 
	.yQAM16(tempyQAM16),
	.M(M), 
	.y(y)
);

ctrlUnit_sorter controlUnit 
(
	.clk(clk),
	.rst(rst),
	.start(start),
	.M(M),
	.done(done),
	.loadQPSK(loadQPSK),
	.loadQAM16(loadQAM16)
);

wire [WIDTH-1:0]y1 = y[WIDTH-1:0];
wire [2*WIDTH-1:WIDTH]y2 = y[2*WIDTH-1:WIDTH];
wire [3*WIDTH-1:2*WIDTH]y3 = y[3*WIDTH-1:2*WIDTH];
wire [4*WIDTH-1:3*WIDTH]y4 = y[4*WIDTH-1:3*WIDTH];
/*
wire [5*WIDTH-1:4*WIDTH]y5 = tempyQAM16[5*WIDTH-1:4*WIDTH];
wire [6*WIDTH-1:5*WIDTH]y6 = tempyQAM16[6*WIDTH-1:5*WIDTH];
wire [7*WIDTH-1:6*WIDTH]y7 = tempyQAM16[7*WIDTH-1:6*WIDTH];
wire [8*WIDTH-1:7*WIDTH]y8 = tempyQAM16[8*WIDTH-1:7*WIDTH];
wire [9*WIDTH-1:8*WIDTH]y9 = tempyQAM16[9*WIDTH-1:8*WIDTH];
wire [10*WIDTH-1:9*WIDTH]y10 = tempyQAM16[10*WIDTH-1:9*WIDTH];
wire [11*WIDTH-1:10*WIDTH]y11 = tempyQAM16[11*WIDTH-1:10*WIDTH];
wire [12*WIDTH-1:11*WIDTH]y12 = tempyQAM16[12*WIDTH-1:11*WIDTH];
wire [13*WIDTH-1:12*WIDTH]y13 = tempyQAM16[13*WIDTH-1:12*WIDTH];
wire [14*WIDTH-1:13*WIDTH]y14 = tempyQAM16[14*WIDTH-1:13*WIDTH];
wire [15*WIDTH-1:14*WIDTH]y15 = y[15*WIDTH-1:14*WIDTH];
wire [16*WIDTH-1:15*WIDTH]y16 = y[16*WIDTH-1:15*WIDTH];
*/
endmodule