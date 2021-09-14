

`timescale 1ns / 1ps
module m_4to8_tb();

parameter WIDTH = 8;
parameter n = 4;

reg clk;
reg rst;
reg [1:0]load;
reg [2*n*WIDTH-1:0]inba;
wire [2*n*WIDTH-1:0]c;

`define a1 inba[1*WIDTH-1:0*WIDTH]
`define a2 inba[2*WIDTH-1:1*WIDTH]
`define a3 inba[3*WIDTH-1:2*WIDTH]
`define a4 inba[4*WIDTH-1:3*WIDTH]

`define b1 inba[5*WIDTH-1:4*WIDTH]
`define b2 inba[6*WIDTH-1:5*WIDTH]
`define b3 inba[7*WIDTH-1:6*WIDTH]
`define b4 inba[8*WIDTH-1:7*WIDTH]

m_4to8_r#(.WIDTH(WIDTH)) UUT
(
	.clk(clk),
	.rst(rst),
	.load(load),
	.inba(inba),
	.c(c) 
);

initial clk = 0;
	always#5 clk = ~clk;

initial begin
	//reset
	@(posedge clk) rst = 1;
	@(negedge clk) rst = 0;
	@(posedge clk) begin 
		rst = 1;
	end
	//initial point
	@(posedge clk) begin 
		load[0] = 1;
		load[1] = 0;
		`a1 = 0;
		`a2 = 0;
		`a3 = 200;
		`a4 = 201;
				
	end
	@(posedge clk) begin 
		load[0]  = 0;
		load[1]  = 1;
		`b1 = 1;
		`b2 = 1;
		`b3 = 9;
		`b4 = 23;	
	end	
end
endmodule

