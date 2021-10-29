

`timescale 1ns / 1ps
module merge_tb();
parameter WIDTH = 8;
parameter n = 16;
parameter N2 = 2;  
	reg clk;
	reg rst;
	reg [1:0]load4to8;
	reg [1:0]load8to16;
	//input enQAM16,
	reg [(2*N2)*WIDTH-1:0]inba;
	wire [(n*WIDTH)-1:0]c;

`define d1 inba[1*WIDTH-1:0*WIDTH]
`define d2 inba[2*WIDTH-1:1*WIDTH]
`define d3 inba[3*WIDTH-1:2*WIDTH]
`define d4 inba[4*WIDTH-1:3*WIDTH]

merge#(.WIDTH(WIDTH)) UUT
(
	.clk(clk),
	.rst(rst),
	.load4to8(load4to8),
	.load8to16(load8to16),
	.inba(inba),
	.c(c) 
);
initial clk = 0;
always#5 clk = ~clk;

initial begin
	@(posedge clk) rst = 1;
	@(negedge clk) rst = 0;
	@(posedge clk) begin 
		rst = 1;
	end
	@(posedge clk) begin 
		load4to8[0] = 1;
		load4to8[1] = 0;
		`d1 = 7;
		`d2 = 8;
		`d3 = 9;
		`d4 = 10;
				
	end
	@(posedge clk) begin 
		load4to8[0]  = 0;
		load4to8[1]  = 1;
		`d1 = 20;
		`d2 = 21;
		`d3 = 22;
		`d4 = 23;		
	end	
	// to create 8to16
	@(posedge clk) begin 
		load4to8[0] = 1;
		load4to8[1] = 0;
		load8to16[0] = 1;
		load8to16[1] = 0;
		`d1 = 31;
		`d2 = 32;
		`d3 = 33;
		`d4 = 34;
				
	end
	@(posedge clk) begin 
		load4to8[0] = 0;
		load4to8[1] = 1;
		load8to16[0]  = 0;
		load8to16[1]  = 1;
		`d1 = 41;
		`d2 = 42;
		`d3 = 43;
		`d4 = 44;		
	end
end
endmodule

