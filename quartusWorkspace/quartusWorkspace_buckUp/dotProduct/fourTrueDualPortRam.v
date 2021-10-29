
module fourTrueDualPortRam#(parameter WIDTH = 16,ADDR_WIDTH = 3, DEPTH = 8)
(
	input clk,
	//input
	input [WIDTH-1:0]din_aReal,
	input [WIDTH-1:0]din_aImag,
	input [WIDTH-1:0]din_bReal,
	input [WIDTH-1:0]din_bImag,
	input [WIDTH-1:0]din_cReal,
	input [WIDTH-1:0]din_cImag,	
	input [WIDTH-1:0]din_dReal,
	input [WIDTH-1:0]din_dImag,
	//write enable 
	input we, 
	//read address 
	input [ADDR_WIDTH-1:0] readAddrReal,
	input [ADDR_WIDTH-1:0] readAddrImag,
	//write address
	input [ADDR_WIDTH-1:0] writeAddrReal,
	input [ADDR_WIDTH-1:0] writeAddrImag,
	//output 
	output  [WIDTH-1:0] dout_aReal,
	output  [WIDTH-1:0] dout_aImag,	
	output  [WIDTH-1:0] dout_bReal,
	output  [WIDTH-1:0] dout_bImag,
	output  [WIDTH-1:0] dout_cReal,
	output  [WIDTH-1:0] dout_cImag,
	output  [WIDTH-1:0] dout_dReal,
	output  [WIDTH-1:0] dout_dImag	
	/*
	input we_aReal,
	input we_aImag,
	input we_bReal,
	input we_bImag,
	input we_cReal,
	input we_cImag,
	input we_dReal,
	input we_dImag,	
	
	input [ADDR_WIDTH-1:0]w_addr_aReal,
	input [ADDR_WIDTH-1:0]w_addr_aImag,
	input [ADDR_WIDTH-1:0]r_addr_aReal,
	input [ADDR_WIDTH-1:0]r_addr_aImag,
	*/
	// complex number 2
	/*
	input [ADDR_WIDTH-1:0]w_addr_bReal,
	input [ADDR_WIDTH-1:0]w_addr_bImag,
	input [ADDR_WIDTH-1:0]r_addr_bReal,
	input [ADDR_WIDTH-1:0]r_addr_bImag,
	*/
	// complex number 3
	/*
	input [ADDR_WIDTH-1:0]w_addr_cReal,
	input [ADDR_WIDTH-1:0]w_addr_cImag,
	input [ADDR_WIDTH-1:0]r_addr_cReal,
	input [ADDR_WIDTH-1:0]r_addr_cImag,
	*/
	// complex number 4
	/*
	input [ADDR_WIDTH-1:0]w_addr_dReal,
	input [ADDR_WIDTH-1:0]w_addr_dImag,
	input [ADDR_WIDTH-1:0]r_addr_dReal,
	input [ADDR_WIDTH-1:0]r_addr_dImag,
	*/	
);

trueDualPortRam#(.WIDTH(WIDTH),.ADDR_WIDTH(ADDR_WIDTH),.DEPTH(DEPTH)) a
(
	.din_a(din_aReal),
	.din_b(din_aImag),
	.we_a(we),
	.we_b(we),
	.clk(clk),
	.w_addr_a(writeAddrReal),
	.r_addr_a(readAddrReal),
	.w_addr_b(writeAddrImag),
	.r_addr_b(readAddrImag),
	.dout_a(dout_aReal),
	.dout_b(dout_aImag)
);

trueDualPortRam#(.WIDTH(WIDTH),.ADDR_WIDTH(ADDR_WIDTH),.DEPTH(DEPTH)) b
(
	.din_a(din_bReal),
	.din_b(din_bImag),
	.we_a(we),
	.we_b(we),
	.clk(clk),
	.w_addr_a(writeAddrReal),
	.r_addr_a(readAddrReal),
	.w_addr_b(writeAddrImag),
	.r_addr_b(readAddrImag),
	.dout_a(dout_bReal),
	.dout_b(dout_bImag)
);

trueDualPortRam#(.WIDTH(WIDTH),.ADDR_WIDTH(ADDR_WIDTH),.DEPTH(DEPTH)) c
(
	.din_a(din_cReal),
	.din_b(din_cImag),
	.we_a(we),
	.we_b(we),
	.clk(clk),
	.w_addr_a(writeAddrReal),
	.r_addr_a(readAddrReal),
	.w_addr_b(writeAddrImag),
	.r_addr_b(readAddrImag),
	.dout_a(dout_cReal),
	.dout_b(dout_cImag)
);

trueDualPortRam#(.WIDTH(WIDTH),.ADDR_WIDTH(ADDR_WIDTH),.DEPTH(DEPTH)) d
(
	.din_a(din_dReal),
	.din_b(din_dImag),
	.we_a(we),
	.we_b(we),
	.clk(clk),
	.w_addr_a(writeAddrReal),
	.r_addr_a(readAddrReal),
	.w_addr_b(writeAddrImag),
	.r_addr_b(readAddrImag),
	.dout_a(dout_dReal),
	.dout_b(dout_dImag)
);


endmodule