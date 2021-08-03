
module dotProduct#(parameter WIDTH = 16,parameter ADDR_WIDTH = 7)
(
	input clk, 
	input rst,
	input start,
	input [1:0]M,
	input [WIDTH-1:0] inaReal,
	input [WIDTH-1:0] inaImag,
	input [WIDTH-1:0] inbReal,
	input [WIDTH-1:0] inbImag,
	input [WIDTH-1:0] incReal,
	input [WIDTH-1:0] incImag,	
	input [WIDTH-1:0] indReal,
	input [WIDTH-1:0] indImag,
	input [ADDR_WIDTH-1:0]readAddr,
	
	output [WIDTH-1:0]outaDist,
	output [WIDTH-1:0]outbDist,
	output [WIDTH-1:0]outcDist,
	output [WIDTH-1:0]outdDist,	
	output done
);

wire [WIDTH-1:0] tempOutaDist;
wire [WIDTH-1:0] tempOutbDist;
wire [WIDTH-1:0] tempOutcDist;
wire [WIDTH-1:0] tempOutdDist;
	
wire [ADDR_WIDTH-1:0]tempWriteAddr; 
wire tempWe; 

norm #(.WIDTH(WIDTH)) norm_0
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


memDist2#(.WIDTH(WIDTH),.ADDR_WIDTH(ADDR_WIDTH),.DEPTH(8)) memory
(
	.clk(clk),
	
	//input
	.inaDist(tempOutaDist),
	.inbDist(tempOutbDist),
	.incDist(tempOutcDist),
	.indDist(tempOutdDist),	
	//write enable 
	.we(tempWe),
	//write address 
	.writeAddr(tempWriteAddr),
	//read adress 
	.readAddr(readAddr),
	//output 
	.outaDist(outaDist),
	.outbDist(outbDist),
	.outcDist(outcDist),
	.outdDist(outdDist)	
);

ctrlUnitDotProduct#(.ADDR_WIDTH(ADDR_WIDTH)) controlUnit
(
	.clk(clk),
	.rst(rst), 
	.start(start),
	.M(M),
	
	.we(tempWe),
	.writeAddr(tempWriteAddr),
	.done(done)
);

endmodule