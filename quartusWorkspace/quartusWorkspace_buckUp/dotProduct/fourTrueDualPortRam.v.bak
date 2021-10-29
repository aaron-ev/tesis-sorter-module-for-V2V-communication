
module ramComplexNum#(parameter WIDTH = 16,ADDR_WIDTH = 3, DEPTH = 8)
(
	input clk,
	// complex number 1
	input [WIDTH-1:0]din_aReal,
	input [WIDTH-1:0]din_aImag,
	input we_aReal,
	input we_aImag,
	input [ADDR_WIDTH-1:0]w_addr_aReal,
	input [ADDR_WIDTH-1:0]w_addr_aImag,
	input [ADDR_WIDTH-1:0]r_addr_aReal,
	input [ADDR_WIDTH-1:0]r_addr_aImag,
	output  [WIDTH-1:0] dout_aReal,
	output  [WIDTH-1:0] dout_aImag,
	// complex number 2
	input [WIDTH-1:0]din_bReal,
	input [WIDTH-1:0]din_bImag,
	input we_bReal,
	input we_bImag,
	input [ADDR_WIDTH-1:0]w_addr_bReal,
	input [ADDR_WIDTH-1:0]w_addr_bImag,
	input [ADDR_WIDTH-1:0]r_addr_bReal,
	input [ADDR_WIDTH-1:0]r_addr_bImag,
	output  [WIDTH-1:0] dout_bReal,
	output  [WIDTH-1:0] dout_bImag,
	// complex number 3
	input [WIDTH-1:0]din_cReal,
	input [WIDTH-1:0]din_cImag,
	input we_cReal,
	input we_cImag,
	input [ADDR_WIDTH-1:0]w_addr_cReal,
	input [ADDR_WIDTH-1:0]w_addr_cImag,
	input [ADDR_WIDTH-1:0]r_addr_cReal,
	input [ADDR_WIDTH-1:0]r_addr_cImag,
	output  [WIDTH-1:0] dout_cReal,
	output  [WIDTH-1:0] dout_cImag,	
	// complex number 4
	input [WIDTH-1:0]din_dReal,
	input [WIDTH-1:0]din_dImag,
	input we_dReal,
	input we_dImag,
	input [ADDR_WIDTH-1:0]w_addr_dReal,
	input [ADDR_WIDTH-1:0]w_addr_dImag,
	input [ADDR_WIDTH-1:0]r_addr_dReal,
	input [ADDR_WIDTH-1:0]r_addr_dImag,
	output  [WIDTH-1:0] dout_dReal,
	output  [WIDTH-1:0] dout_dImag	
);

trueDualPortRam#(.WIDTH(WIDTH),.ADDR_WIDTH(ADDR_WIDTH),.DEPTH(DEPTH)) trueDualPortRam0
(
	.din_a(din_aReal),
	.din_b(din_aImag),
	.we_a(we_aReal),
	.we_b(we_aImag),
	.clk(clk),
	.w_addr_a(w_addr_aReal),
	.r_addr_a(r_addr_aReal),
	.w_addr_b(w_addr_aImag),
	.r_addr_b(r_addr_aImag),
	.dout_a(dout_aReal),
	.dout_b(dout_aImag)
);

trueDualPortRam#(.WIDTH(WIDTH),.ADDR_WIDTH(ADDR_WIDTH),.DEPTH(DEPTH)) trueDualPortRam1
(
	.din_a(din_bReal),
	.din_b(din_bImag),
	.we_a(we_bReal),
	.we_b(we_bImag),
	.clk(clk),
	.w_addr_a(w_addr_bReal),
	.r_addr_a(r_addr_bReal),
	.w_addr_b(w_addr_bImag),
	.r_addr_b(r_addr_bImag),
	.dout_a(dout_bReal),
	.dout_b(dout_bImag)
);

trueDualPortRam#(.WIDTH(WIDTH),.ADDR_WIDTH(ADDR_WIDTH),.DEPTH(DEPTH)) trueDualPortRam2
(
	.din_a(din_cReal),
	.din_b(din_cImag),
	.we_a(we_cReal),
	.we_b(we_cImag),
	.clk(clk),
	.w_addr_a(w_addr_cReal),
	.r_addr_a(r_addr_cReal),
	.w_addr_b(w_addr_cImag),
	.r_addr_b(r_addr_cImag),
	.dout_a(dout_cReal),
	.dout_b(dout_cImag)
);

trueDualPortRam#(.WIDTH(WIDTH),.ADDR_WIDTH(ADDR_WIDTH),.DEPTH(DEPTH)) trueDualPortRam3
(
	.din_a(din_dReal),
	.din_b(din_dImag),
	.we_a(we_dReal),
	.we_b(we_dImag),
	.clk(clk),
	.w_addr_a(w_addr_dReal),
	.r_addr_a(r_addr_dReal),
	.w_addr_b(w_addr_dImag),
	.r_addr_b(r_addr_dImag),
	.dout_a(dout_dReal),
	.dout_b(dout_dImag)
);


endmodule