
module memDist2#(parameter WIDTH = 16,ADDR_WIDTH = 3, DEPTH = 8)
(
	input clk,
	//input
	input [WIDTH-1:0]inaDist,
	input [WIDTH-1:0]inbDist,
	input [WIDTH-1:0]incDist,
	input [WIDTH-1:0]indDist,
	//write enable 
	input we, 
	//read address 
	input [ADDR_WIDTH-1:0] readAddrReal,
	input [ADDR_WIDTH-1:0] readAddrImag,
	//write address
	input [ADDR_WIDTH-1:0] writeAddrReal,
	input [ADDR_WIDTH-1:0] writeAddrImag,
	//output 
	output  [WIDTH-1:0] outaDist,
	output  [WIDTH-1:0] outbDist,	
	output  [WIDTH-1:0] outcDist,
	output  [WIDTH-1:0] outdDist	
);

trueDualPortRam#(.WIDTH(WIDTH),.ADDR_WIDTH(ADDR_WIDTH),.DEPTH(DEPTH)) a
(
	.din_a(inaDist),
	.din_b(inbDist),
	.we_a(we),
	.we_b(we),
	.clk(clk),
	.w_addr_a(writeAddrReal),
	.r_addr_a(readAddrReal),
	.w_addr_b(writeAddrImag),
	.r_addr_b(readAddrImag),
	.dout_a(outaDist),
	.dout_b(outbDist)
);

trueDualPortRam#(.WIDTH(WIDTH),.ADDR_WIDTH(ADDR_WIDTH),.DEPTH(DEPTH)) b
(
	.din_a(incDist),
	.din_b(indDist),
	.we_a(we),
	.we_b(we),
	.clk(clk),
	.w_addr_a(writeAddrReal),
	.r_addr_a(readAddrReal),
	.w_addr_b(writeAddrImag),
	.r_addr_b(readAddrImag),
	.dout_a(outcDist),
	.dout_b(outdDist)
);

endmodule