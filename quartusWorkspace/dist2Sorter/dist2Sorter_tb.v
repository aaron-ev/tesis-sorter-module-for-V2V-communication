
`timescale 1ns / 1ps
module dist2Sorter_tb();

parameter WIDTH = 16;
parameter N_IN = 8;
	reg clk; 
	reg rst;
	reg [WIDTH-1:0] inaReal;
	reg [WIDTH-1:0] inaImag;
	reg [WIDTH-1:0] inbReal;
	reg [WIDTH-1:0] inbImag;
	reg [WIDTH-1:0] incReal;
	reg [WIDTH-1:0] incImag;	
	reg [WIDTH-1:0] indReal;
	reg [WIDTH-1:0] indImag;
	reg  [4-1:0] load;
	wire [(2*N_IN*WIDTH)-1:0]c;

dist2Sorter#(.WIDTH(WIDTH)) UUT
(
	.clk(clk), 
	.rst(rst),
	.inaReal(inaReal),
	.inaImag(inaImag),
	.inbReal(inbReal),
	.inbImag(inbImag),
	.incReal(incReal),
	.incImag(incImag),	
	.indReal(indReal),
	.indImag(indImag),
	.load(load),
	.c(c)
);
initial clk = 0;
always#5 clk = ~clk;

initial begin
	@(posedge clk) rst = 1;
	@(negedge clk) rst = 0;
	@(posedge clk) begin 
		rst = 1;		
		inaReal = 2;
		inaImag = 1; 
		inbReal = 3; 
		inbImag = 1; 
		incReal = 1; 
		incImag = 0; 
		indReal = 3; 
		indImag = 2;
	end

	@(posedge clk) begin 
		load = 1;
		inaReal = 0;
		inaImag = 1; 
		inbReal = 1; 
		inbImag = 1; 
		incReal = 2; 
		incImag = 2; 
		indReal = 3; 
		indImag = 3;
	end
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
	@(posedge clk) begin 
		load = 4;
		inaReal = 2;
		inaImag = 2; 
		inbReal = 3; 
		inbImag = 3; 
		incReal = 1; 
		incImag = 1; 
		indReal = 0; 
		indImag = 2;	
end
	@(posedge clk) begin 
		load = 8;
	end
end
endmodule

