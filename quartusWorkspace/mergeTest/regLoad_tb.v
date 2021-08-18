

`timescale 1ns / 1ps
module regLoad_tb();
parameter WIDTH = 3;
parameter n = 2; 
	reg clk;
	reg rst;
	reg [1:0]load;
	reg [2*n*WIDTH-1:0]inba;
	wire[2*n*WIDTH-1:0]y;
	
regLoad#(.WIDTH(WIDTH)) UUT
(
	.clk(clk),
	.rst(rst),
	.load(load),
	.inba(inba),
	.y(y) 
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
		load = 1;
		inba[n*WIDTH-1:0] = 5;		
	end
	@(posedge clk) begin 
		load = 2;
		inba[2*n*WIDTH-1:n*WIDTH] = 2;		
	end	
	/*
	@(posedge clk) begin 
		load = 2;
		inaReal = 0;
		inaImag = 1; 
		inbReal = 1; 
		inbImag = 1; 
		incReal = 2; 
		incImag = 2; 
		indReal = 3; 
		indImag = 3;
	end	
	*/
end
endmodule

