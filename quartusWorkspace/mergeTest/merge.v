
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
	input [1:0]s,
	input [1:0]loadQPSK,
	input [1:0]loadQAM16,
	input [1:0]loadQAM32,
	input [1:0]loadQAM64,
	input [1:0]loadQAM128,
	input [1:0]loadQAM256,	
	input [(2*N2)*WIDTH-1:0]inba,
	output [4*WIDTH-1:0]y
	//output [4*WIDTH-1:0]yQAM16
	//output [(n*WIDTH)-1:0]c
);

wire [8*WIDTH-1:0]tempinba8to16;
wire [(16*WIDTH)-1:0] tempc_QAM16;
wire [(32*WIDTH)-1:0] tempc_QAM32;
wire [(64*WIDTH)-1:0] tempc_QAM64;
wire [(128*WIDTH)-1:0] tempc_QAM128;
wire [(256*WIDTH)-1:0] tempc_QAM256;

//assign y = tempc_QAM256[4*WIDTH-1:0]; 


m_4to8_r#(.WIDTH(WIDTH)) _4to8
(
	 .clk(clk),
	 .rst(rst),
	 .load(loadQPSK),
	 .inba({inba,inba}),
	 .c(tempinba8to16)
);

m_8to16_r#(.WIDTH(WIDTH)) _8to16
(
	 .clk(clk),
	 .rst(rst),
	 .load(loadQAM16),
	 .inba({tempinba8to16,tempinba8to16}),
	 .c(tempc_QAM16)
);

m_16to32_r#(.WIDTH(WIDTH)) _16to32
(
	 .clk(clk),
	 .rst(rst),
	 .load(loadQAM16),
	 .inba({tempc_QAM16,tempc_QAM16}),
	 .c(tempc_QAM32)
);

m_32to64_r#(.WIDTH(WIDTH)) _32to64
(
	 .clk(clk),
	 .rst(rst),
	 .load(loadQAM32),
	 .inba({tempc_QAM32,tempc_QAM32}),
	 .c(tempc_QAM64)
);
m_64to128_r#(.WIDTH(WIDTH)) _64to128
(
	 .clk(clk),
	 .rst(rst),
	 .load(loadQAM64),
	 .inba({tempc_QAM64,tempc_QAM64}),
	 .c(tempc_QAM128)
);
m_128to256_r#(.WIDTH(WIDTH)) _128to256
(
	 .clk(clk),
	 .rst(rst),
	 .load(loadQAM128),
	 .inba({tempc_QAM128,tempc_QAM128}),
	 .c(tempc_QAM256)
);
mux_merge#(.WIDTH(WIDTH)) mux
(
	.in({tempinba8to16[4*WIDTH-1:0], tempc_QAM16[4*WIDTH-1:0],tempc_QAM64[4*WIDTH-1:0],		    tempc_QAM256[4*WIDTH-1:0]}),
	.s(s),
	.out(y)
);
endmodule