

`timescale 1ns / 1ps
module m_8to16_tb();

parameter WIDTH = 8;
parameter n = 8;

reg clk;
reg rst;
reg [1:0]load;
reg [2*n*WIDTH-1:0]inba;
wire [2*n*WIDTH-1:0]c;

`define a1 inba[1*WIDTH-1:0*WIDTH]
`define a2 inba[2*WIDTH-1:1*WIDTH]
`define a3 inba[3*WIDTH-1:2*WIDTH]
`define a4 inba[4*WIDTH-1:3*WIDTH]
`define a5 inba[5*WIDTH-1:4*WIDTH]
`define a6 inba[6*WIDTH-1:5*WIDTH]
`define a7 inba[7*WIDTH-1:6*WIDTH]
`define a8 inba[8*WIDTH-1:7*WIDTH]

`define b1 inba[9*WIDTH-1:8*WIDTH]
`define b2 inba[10*WIDTH-1:9*WIDTH]
`define b3 inba[11*WIDTH-1:10*WIDTH]
`define b4 inba[12*WIDTH-1:11*WIDTH]

`define b5 inba[13*WIDTH-1:12*WIDTH]
`define b6 inba[14*WIDTH-1:13*WIDTH]
`define b7 inba[15*WIDTH-1:14*WIDTH]
`define b8 inba[16*WIDTH-1:15*WIDTH]

m_8to16_r#(.WIDTH(WIDTH)) UUT
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
		`a5 = 204;
		`a6 = 207;
		`a7 = 208;
		`a8 = 210;		
				
	end
	@(posedge clk) begin 
		load[0]  = 0;
		load[1]  = 1;
		`b1 = 1;
		`b2 = 2;
		`b3 = 3;
		`b4 = 4;
		`b5 = 5;
		`b6 = 6;
		`b7 = 7;
		`b8 = 20;	
	end		
end
endmodule

