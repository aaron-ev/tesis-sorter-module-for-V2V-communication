
module merge#
(
	parameter WIDTH = 8, 
	parameter n = 16,//numOutputs 
	parameter N2 = 2,
	parameter N4 = 4
)
(
	input clk,
	input rst,
	input [1:0]loadQPSK,
	input [1:0]loadQAM16,
	input [(2*N2)*WIDTH-1:0]inba,
	output [4*WIDTH-1:0]yQAM16
	//output [(n*WIDTH)-1:0]c
);

wire [8*WIDTH-1:0]tempinba8to16;
wire [(16*WIDTH)-1:0] tempc_QAM16;

assign yQAM16 = tempc_QAM16[16*WIDTH-1:0]; 


merge4to8_r#(.WIDTH(WIDTH)) _4to8
(
	 .clk(clk),
	 .rst(rst),
	 .load(loadQPSK),
	 .inba({inba,inba}),
	 .c(tempinba8to16)
);

merge8to16_r#(.WIDTH(WIDTH)) _8to16
(
	 .clk(clk),
	 .rst(rst),
	 .load(loadQAM16),
	 .inba({tempinba8to16,tempinba8to16}),
	 .c(tempc_QAM16)
);
endmodule