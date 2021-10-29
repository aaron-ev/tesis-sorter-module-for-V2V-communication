

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
	input [ADDR_WIDTH-1:0] readAddr,
	//write address
	input [ADDR_WIDTH-1:0] writeAddr,
	//output 
	output  [WIDTH-1:0] outaDist,
	output  [WIDTH-1:0] outbDist,	
	output  [WIDTH-1:0] outcDist,
	output  [WIDTH-1:0] outdDist	
);
wire [ADDR_WIDTH-1:0] readAddrPlus1 = readAddr + 1; 
wire [ADDR_WIDTH-1:0] writeAddrPlus1 = writeAddr + 1;

trueDualPortRam#(.WIDTH(WIDTH),.ADDR_WIDTH(ADDR_WIDTH),.DEPTH(DEPTH)) a
(
	.din_a(inaDist),
	.din_b(inbDist),
	.we_a(we),
	.we_b(we),
	.clk(clk),
	.w_addr_a(writeAddr),
	.w_addr_b(writeAddrPlus1),
	.r_addr_a(readAddr),
	.r_addr_b(readAddrPlus1),
	
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
	.w_addr_a(writeAddr),
	.w_addr_b(writeAddrPlus1),
	.r_addr_a(readAddr),
	.r_addr_b(readAddrPlus1),
	
	.dout_a(outcDist),
	.dout_b(outdDist)
);

endmodule