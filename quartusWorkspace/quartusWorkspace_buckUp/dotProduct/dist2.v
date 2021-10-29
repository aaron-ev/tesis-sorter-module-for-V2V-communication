
module dist2#(parameter WIDTH = 16,parameter ADDR_WIDTH = 7)
(
	input clk, 
	input rst,
	//input start,
	//input [1:0]M,
	input [WIDTH-1:0] inaReal,
	input [WIDTH-1:0] inaImag,
	input [WIDTH-1:0] inbReal,
	input [WIDTH-1:0] inbImag,
	input [WIDTH-1:0] incReal,
	input [WIDTH-1:0] incImag,	
	input [WIDTH-1:0] indReal,
	input [WIDTH-1:0] indImag,
	//input [ADDR_WIDTH-1:0] inReadAddr,
	
	output  [WIDTH-1:0] outaDist,
	output  [WIDTH-1:0] outbDist,	
	output  [WIDTH-1:0] outcDist,
	output  [WIDTH-1:0] outdDist	
	//output done
);
/*
wire [WIDTH-1:0] tempaDist;
wire [WIDTH-1:0] tempbDist;
wire [WIDTH-1:0] tempcDist;
wire [WIDTH-1:0] tempdDist;

	
wire [ADDR_WIDTH-1:0]tempOutAddrReal; 
wire [ADDR_WIDTH-1:0]tempOutAddrImag; 
wire tempWe; 
*/
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
	/*
	.outaDist(tempaDist),
	.outbDist(tempbDist),
	.outcDist(tempcDist),
	.outdDist(tempdDist),
	*/
	.outaDist(outaDist),
	.outbDist(outbDist),
	.outcDist(outcDist),
	.outdDist(outdDist),	
);

/*
memDist2#(.WIDTH(WIDTH),.ADDR_WIDTH(ADDR_WIDTH),.DEPTH(8)) memory
(
	.clk(clk),
	//input
	.inaDist(tempaDist),
	.inbDist(tempbDist),
	.incDist(tempcDist),
	.indDist(tempdDist),
	//write enable 
	.we(tempWe),
	//write address 
	.writeAddrReal(tempOutAddrReal),
	.writeAddrImag(tempOutAddrImag),
	//read adress 
	.readAddrReal(inReadAddr),
	.readAddrImag(inReadAddr+1'd1),
	//output 
	.outaDist(outaDist),
	.outbDist(outbDist),
	.outcDist(outcDist),
	.outdDist(outdDist),	
);

ctrlUnitDotProduct#(.ADDR_WIDTH(ADDR_WIDTH)) controlUnit
(
	.clk(clk),
	.rst(rst), 
	.start(start),
	.we(tempWe),
	.M(M),
	
	.outAddrReal(tempOutAddrReal),
	.outAddrImag(tempOutAddrImag),
	.done(done)
);
*/
endmodule