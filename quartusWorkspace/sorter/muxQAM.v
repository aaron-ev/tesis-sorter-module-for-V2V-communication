

module muxQAM#(parameter WIDTH = 8, parameter NUM_INPUTS = 4)
(
	input [NUM_INPUTS*WIDTH-1:0] yQPSK,
	input [NUM_INPUTS*WIDTH-1:0] yQAM16, 	
	input [1:0]M,
	output reg[NUM_INPUTS*WIDTH-1:0]y
);

`define QPSK 2'b00 
`define QAM16 2'b01 
`define QAM64 2'b10 
`define QAM256 2'b11 

always@(yQPSK,yQAM16,M)
	begin 
		case(M)
			`QPSK: y <= yQPSK; 
			`QAM16: y <= yQAM16; 
			//`QAM64: dout <= din[3*WIDTH-1:2*WIDTH]; 
			//`QAM256: dout <= din[4*WIDTH-1:3*WIDTH]; 
			default: y <= yQAM16;
		endcase
	end
	
endmodule