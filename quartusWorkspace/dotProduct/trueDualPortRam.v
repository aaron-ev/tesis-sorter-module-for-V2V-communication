

module trueDualPortRam#(parameter WIDTH = 16, ADDR_WIDTH = 7, DEPTH = 128)
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
	output  [WIDTH-1:0] dout_a,
	output  [WIDTH-1:0] dout_b
	//output reg  [WIDTH-1:0] dout_a,
	//output reg  [WIDTH-1:0] dout_b	
);

reg [WIDTH-1:0] ram[DEPTH-1:0]; 

reg [ADDR_WIDTH-1:0]tempw_addr_a;
reg [ADDR_WIDTH-1:0]tempw_addr_b;

//assign dout_a = we_a ? din_a : ram[r_addr_a];
//assign dout_b = we_b ? din_b : ram[r_addr_b];

integer i;
//default values 
initial 
	begin  
		for(i = 0; i < DEPTH; i = i + 1)
			ram[i] <= 7'd0; 
	end
//port a
always@(posedge clk)
	begin: porta_rwProcess
		if(we_a)
			begin 
				//dout_a <= din_a;
				ram[w_addr_a]<= din_a;  
			end
		else 
			tempw_addr_a <= w_addr_a;
	end

assign dout_a = we_a ? din_a : ram[tempw_addr_a];

//port b
always@(posedge clk)
	begin: portb_rwProcess
		if(we_b)
			begin 
				//dout_b <= din_b; 
				ram[w_addr_b]<= din_b;
			end
		else 
			tempw_addr_b <= w_addr_b;
	end
assign dout_b = we_b ? din_b : ram[tempw_addr_b];
endmodule