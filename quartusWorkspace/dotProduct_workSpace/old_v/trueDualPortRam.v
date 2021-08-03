

module trueDualPortRam#(parameter WIDTH = 8,ADDR_WIDTH = 3, DEPTH = 8)
(
	input [WIDTH-1:0]din_a,
	input [WIDTH-1:0]din_b,
	input we_a,
	input we_b,
	input clk,
	input [ADDR_WIDTH-1:0]w_addr_a,
	input [ADDR_WIDTH-1:0]r_addr_a,
	input [ADDR_WIDTH-1:0]w_addr_b,
	input [ADDR_WIDTH-1:0]r_addr_b,
	output reg [WIDTH-1:0] dout_a,
	output reg [WIDTH-1:0] dout_b
);

reg [WIDTH-1:0] ram[DEPTH-1:0]; 

//port a
always@(posedge clk)
	begin: porta_rwProcess
		if(we_a)
			ram[w_addr_a]<= din_a; 
		dout_a <= ram[r_addr_a];
	end
	
//port b
always@(posedge clk)
	begin: portb_rwProcess
		if(we_b)
			ram[w_addr_b]<= din_b; 
		dout_b <= ram[r_addr_b];
	end
endmodule