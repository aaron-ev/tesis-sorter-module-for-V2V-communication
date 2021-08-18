

`timescale 1ns / 1ps
module sorter_tb();
parameter WIDTH = 8;
parameter NUM_OUTPUTS = 4;

//parameter N2 = 2;  
	reg clk;
	reg rst;
	//reg [1:0]loadQPSK;
	//reg [1:0]loadQAM16;
	//reg enQPSK; 
	reg start;
	reg [1:0]M;
	//input enQAM16,
	reg [WIDTH-1:0]d1,d2,d3,d4; 
	wire done; 
	wire [(NUM_OUTPUTS*WIDTH)-1:0]y;

parameter M_QPSK = 2'b00;
parameter M_QAM16 = 2'b01; 

sorter#(.WIDTH(WIDTH)) UUT
(
	.clk(clk),
	.rst(rst),
	.d1(d1),
	.d2(d2),
	.d3(d3),
	.d4(d4),
	//.enQPSK(enQPSK),
	//.loadQPSK(loadQPSK),
	//.loadQAM16(loadQAM16),
	.start(start),
	.M(M),
	.done(done),
	.y(y) 
);
initial clk = 0;
always#5 clk = ~clk;

initial	
	begin 
		M = M_QAM16;//M_QAM16; 
		d4 = 0; 
		d3 = 0;
		d2 = 0;
		d1 = 0;
		
	end
initial begin
	@(posedge clk) rst = 1;
	@(negedge clk) rst = 0;
	@(posedge clk) begin 
		rst = 1;
		//enQPSK = 0;
	end
	@(posedge clk) begin 
		start = 1;
	end
	@(posedge clk) start = 0; 
	@(posedge clk) begin 
		//load4to8[0] = 1;
		//load4to8[1] = 0;
		d4 = 0; 
		d3 = 1;
		d2 = 20;
		d1 = 10;
	end
	@(posedge clk) begin 
		//start = 0;
		d4 = 12; 
		d3 = 11;
		d2 = 10;
		d1 = 9;			
	end	
	@(posedge clk) begin 
		d4 = 8; 
		d3 = 7;
		d2 = 6;
		d1 = 5;		
	end	
	@(posedge clk) begin 
		d4 = 50; 
		d3 = 49;
		d2 = 48;
		d1 = 47;			
	end		
	/*
	@(posedge clk) begin 
		load4to8[0]  = 0;
		load4to8[1]  = 1;
		d1 = 3;
		d2 = 0;
		d3 = 5;
		d4 = 3;		
	end	
	// to create 8to16
	@(posedge clk) begin 
		load4to8[0] = 1;
		load4to8[1] = 0;
		load8to16[0] = 1;
		load8to16[1] = 0;
		d1 = 1;
		d2 = 4;
		d3 = 33;
		d4 = 5;
				
	end
	@(posedge clk) begin 

		load4to8[0] = 0;
		load4to8[1] = 1;
		load8to16[0]  = 0;
		load8to16[1]  = 1;
		d1 = 6;
		d2 = 8;
		d3 = 7;
		d4 = 1;		
	end
	*/
end
endmodule

