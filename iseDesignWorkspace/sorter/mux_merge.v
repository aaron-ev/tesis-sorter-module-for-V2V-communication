

module mux_merge#(parameter WIDTH = 3)
(
	input [(4*(4*WIDTH))-1:0]in, 
	input [1:0]s,
	output reg [(4*WIDTH)-1:0]out 
);
`define QPSK 2'b00 
`define QAM16 2'b01 
`define QAM64 2'b10
`define QAM256 2'b11 

always@(*)
	begin 
		case(s)
			`QPSK:   out <= in[(1*(4*WIDTH))-1:0]; 
			`QAM16:  out <= in[(2*(4*WIDTH))-1:1*(4*WIDTH)]; 
			`QAM64:  out <= in[(3*(4*WIDTH))-1:2*(4*WIDTH)]; 
			`QAM256: out <= in[(4*(4*WIDTH))-1:3*(4*WIDTH)]; 
		endcase 
	end
	
endmodule