`timescale 1ns / 1ps



module dotProduct_tb();

parameter WIDTH = 16;
parameter ADDR_WIDTH = 3;

	reg clk; 
	reg rst;
	reg start; 
	reg [WIDTH-1:0] inaReal;
	reg [WIDTH-1:0] inaImag;
	reg [WIDTH-1:0] inbReal;
	reg [WIDTH-1:0] inbImag;
	reg [WIDTH-1:0] incReal;
	reg [WIDTH-1:0] incImag;	
	reg [WIDTH-1:0] indReal;
	reg [WIDTH-1:0] indImag;

	reg [ADDR_WIDTH-1:0]readAddr;
	reg [ADDR_WIDTH-1:0]readAddrReal;
	reg [ADDR_WIDTH-1:0]readAddrImag;
	wire [WIDTH-1:0]outaReal;
	wire [WIDTH-1:0]outaImag;
	wire [WIDTH-1:0]outbReal;
	wire [WIDTH-1:0]outbImag;
	wire [WIDTH-1:0]outcReal;
	wire [WIDTH-1:0]outcImag;
	wire [WIDTH-1:0]outdReal;
	wire [WIDTH-1:0]outdImag;		
	wire done;

dotProduct UUT
(
	.clk(clk), 
	.rst(rst),
	.start(start), 
	.inaReal(inaReal),
	.inaImag(inaImag),
	.inbReal(inbReal),
	.inbImag(inbImag),
	.incReal(incReal),
	.incImag(incImag),	
	.indReal(indReal),
	.indImag(indImag),

	.readAddr(readAddr),
	.readAddrReal(readAddrReal),
	.readAddrImag(readAddrImag),
	.outaReal(outaReal),
	.outaImag(outaImag),
	.outbReal(outbReal),
	.outbImag(outbImag),
	.outcReal(outcReal),
	.outcImag(outcImag),
	.outdReal(outdReal),
	.outdImag(outdImag),		
	.done(done)
);

initial 
	clk = 0;
always #5 clk = ~clk; 

initial  begin
	#200
	$finish; 
end

initial begin 
	rst = 1;
	#5; 
	rst  = 0; 
	#5;
	rst = 1;
	#3; 
	start = 1; 
	inaReal = 4; 
	inaImag = 1;
	#15;
	start = 0; 
	#10;
	readAddrReal = 0;
	readAddrImag = 1; 

end

endmodule

