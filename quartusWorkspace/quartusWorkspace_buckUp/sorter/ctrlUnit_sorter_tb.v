

`timescale 1ns / 1ps
module ctrlUnit_sorter_tb();
	reg clk;
	reg rst;
	reg [1:0]M;
	reg start; 
	wire done; 
	wire [1:0]loadQPSK;
	wire [1:0]loadQAM16;

ctrlUnit_sorter UUT
(
	 .clk(clk),
	 .rst(rst),
	 .M(M),
	 .start(start), 
	 .done(done), 
	 .loadQPSK(loadQPSK),
	 .loadQAM16(loadQAM16)
);

parameter M_QPSK = 2'b00;
parameter M_QAM16 = 2'b01;  
initial clk = 0;
always#5 clk = ~clk;

initial begin 
	start = 0; 
end
initial begin
	@(posedge clk) rst = 1;
	@(negedge clk) rst = 0;
	@(posedge clk) begin 
		rst = 1;
		M = M_QPSK;
		//M = M_QAM16;
	end
	@(posedge clk) begin 
		start = 1; 
	end	
	//repeat(4) 
	@(posedge clk) begin 
		start = 0; 
	end
	repeat(2) 
	@(posedge clk) begin 
		start = 0; 
	end
	@(posedge clk) begin 
		start = 1; 
	end
	@(posedge clk) begin 
		start = 0; 
	end	
	@(posedge clk) begin 
		start = 1; 
	end
	@(posedge clk) begin 
		start = 0; 
	end		
end
endmodule

