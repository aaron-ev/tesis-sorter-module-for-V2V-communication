
module dotProduct#(parameter WIDTH = 16,parameter ADDR_WIDTH = 3)
(
	input clk, 
	input rst,
	input start, 
	input [WIDTH-1:0] inaReal,
	input [WIDTH-1:0] inaImag,
	input [WIDTH-1:0] inbReal,
	input [WIDTH-1:0] inbImag,
	input [WIDTH-1:0] incReal,
	input [WIDTH-1:0] incImag,	
	input [WIDTH-1:0] indReal,
	input [WIDTH-1:0] indImag,
	/*
	input [ADDR_WIDTH-1:0]r_addr_aReal,
	input [ADDR_WIDTH-1:0]r_addr_aImag,
	input [ADDR_WIDTH-1:0]r_addr_bReal,
	input [ADDR_WIDTH-1:0]r_addr_bImag,
	input [ADDR_WIDTH-1:0]r_addr_cReal,
	input [ADDR_WIDTH-1:0]r_addr_cImag,
	input [ADDR_WIDTH-1:0]r_addr_dReal,
	input [ADDR_WIDTH-1:0]r_addr_dImag,
	*/
	//input [ADDR_WIDTH-1:0]readAddr,
	input [ADDR_WIDTH-1:0]readAddrReal,
	input [ADDR_WIDTH-1:0]readAddrImag,
	output [WIDTH-1:0]outaReal,
	output [WIDTH-1:0]outaImag,
	output [WIDTH-1:0]outbReal,
	output [WIDTH-1:0]outbImag,
	output [WIDTH-1:0]outcReal,
	output [WIDTH-1:0]outcImag,
	output [WIDTH-1:0]outdReal,
	output [WIDTH-1:0]outdImag,		
	output done
);

wire [WIDTH-1:0] tempOutaReal;
wire [WIDTH-1:0] tempOutaImag;
wire [WIDTH-1:0] tempOutbReal;
wire [WIDTH-1:0] tempOutbImag;
wire [WIDTH-1:0] tempOutcReal;
wire [WIDTH-1:0] tempOutcImag;
wire [WIDTH-1:0] tempOutdReal;
wire [WIDTH-1:0] tempOutdImag;
	
wire [ADDR_WIDTH-1:0]tempAddrReal; 
wire [ADDR_WIDTH-1:0]tempAddrImag; 
wire tempWe; 

complex2In4 complex2In4_0 
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
	
	.outaReal(tempOutaReal),
	.outaImag(tempOutaImag),
	.outbReal(tempOutbReal),
	.outbImag(tempOutbImag),
	.outcReal(tempOutcReal),
	.outcImag(tempOutcImag),
	.outdReal(tempOutdReal),
	.outdImag(tempOutdImag)		
);


ramComplexNum#(.WIDTH(16),.ADDR_WIDTH(3),.DEPTH(8)) ramcomplexNum_0
(
	.clk(clk),
	// complex number 1
	.din_aReal(tempOutaReal),
	.din_aImag(tempOutaImag),
	.we_aReal(tempWe),
	.we_aImag(tempWe),
	.w_addr_aReal(tempAddrReal),
	.w_addr_aImag(tempAddrImag),
	.r_addr_aReal(readAddrReal),
	.r_addr_aImag(readAddrImag),
	.dout_aReal(outaReal),
	.dout_aImag(outaImag),
	// complex number 2
	.din_bReal(tempOutbReal),
	.din_bImag(tempOutbImag),
	.we_bReal(tempWe),
	.we_bImag(tempWe),
	.w_addr_bReal(tempAddrReal),
	.w_addr_bImag(tempAddrImag),
	.r_addr_bReal(readAddrReal),
	.r_addr_bImag(readAddrImag),
	.dout_bReal(outbReal),
	.dout_bImag(outbImag),
	// complex number 3
	.din_cReal(tempOutcReal),
	.din_cImag(tempOutcImag),
	.we_cReal(tempWe),
	.we_cImag(tempWe),
	.w_addr_cReal(tempAddrReal),
	.w_addr_cImag(tempAddrImag),
	.r_addr_cReal(readAddrReal),
	.r_addr_cImag(readAddrImag),
	.dout_cReal(outcReal),
	.dout_cImag(outcImag),	
	// complex number 4
	.din_dReal(tempOutdReal),
	.din_dImag(tempOutdImag),
	.we_dReal(tempWe),
	.we_dImag(tempWe),
	.w_addr_dReal(tempAddrReal),
	.w_addr_dImag(tempAddrImag),
	.r_addr_dReal(readAddrReal),
	.r_addr_dImag(readAddrImag),
	.dout_dReal(outdReal),
	.dout_dImag(outdImag)	
);

ctrlUnitDotProduct ctrlUnitDotProduct_0
(
	.clk(clk),
	.rst(rst), 
	.start(start),
	.we(tempWe),
	.addrReal(tempAddrReal),
	.addrImag(tempAddrImag),
	.done(done)
);

endmodule