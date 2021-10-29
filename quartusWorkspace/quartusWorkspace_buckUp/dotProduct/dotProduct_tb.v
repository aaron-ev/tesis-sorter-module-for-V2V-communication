`timescale 1ns / 1ps



module dotProduct_tb();


`define PERIOD 5
`define QPSK 	2'b00 
`define QAM16  2'b01 
`define QAM64  2'b10 
`define QAM256 2'b11  

parameter WIDTH = 16;
parameter ADDR_WIDTH = 7;

	reg clk; 
	reg rst;
	reg start;
	reg [1:0]M;
	reg [WIDTH-1:0] inaReal;
	reg [WIDTH-1:0] inaImag;
	reg [WIDTH-1:0] inbReal;
	reg [WIDTH-1:0] inbImag;
	reg [WIDTH-1:0] incReal;
	reg [WIDTH-1:0] incImag;	
	reg [WIDTH-1:0] indReal;
	reg [WIDTH-1:0] indImag;

	reg [ADDR_WIDTH-1:0]inReadAddr;
	//reg [ADDR_WIDTH-1:0]readAddrReal;
	//reg [ADDR_WIDTH-1:0]readAddrImag;
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
	.M(M),
	.inReadAddr(inReadAddr),
	//.readAddrReal(readAddrReal),
	//.readAddrImag(readAddrImag),
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

//clock 
initial 
	clk = 0;
always #`PERIOD clk = ~clk; 

initial  begin
	#200
	$finish; 
end

initial begin 
	rst = 1;
	start = 0; 
	M = `QAM16; 
	@(negedge clk) rst = 0;
	@(negedge clk) rst = 1;

	// complex number 1
	@(posedge clk)
		begin 
			start = 1;
			inaReal = 3; 
			inaImag = 2;		
		end
	// complex number 2
	@(posedge clk)
		begin 
			start = 0;	
			inaReal = 5; 
			inaImag = 1;		
		end
	// complex number 3
	@(posedge clk)
		begin 
			inReadAddr = 0;		
			inaReal = 7; 
			inaImag = 4;		
		end	
	// complex number 4
	@(posedge clk)
		begin 
			start = 0;	
			//inReadAddr = 2;	
			inaReal = 1; 
			inaImag = 1;		
		end	
	//read complex number 3
	@(posedge clk)
		begin 
			//inReadAddr = 4;	
		end	
	//read complex number 4
	@(posedge clk)
		begin 
			//inReadAddr = 6;	
		end				
end

endmodule

