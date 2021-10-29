module merge2to4_row#(parameter WIDTH = 2,parameter n = 2, parameter R = 4) 
(
	input clk,
	input rst,
	input [R-1:0]load,
	//input [n*WIDTH-1:0]a,
	//input [n*WIDTH-1:0]b,
	input [(2*n)*WIDTH-1:0]inba,
	output [(2*n*R)*WIDTH-1:0]c
);

`define a inba[n*WIDTH-1:0]
`define b inba[2*n*WIDTH-1:2*WIDTH]

//wire [R*n*WIDTH-1:0]tempa;
//wire [R*n*WIDTH-1:0]tempb;

wire [R*2*n*WIDTH-1:0]tempy;

generate
	genvar j; 
		for(j = 0; j < R; j = j + 1)
			begin:regs 
				regLoad#(.WIDTH(WIDTH)) regLoad_0 
				(
					.clk(clk),
					.rst(rst),
					.load(load[j]),
					.inba(inba),
					//.a(`a),
					//.b(`b),
					.y(tempy[(j+1)*2*n*WIDTH-1:j*2*n*WIDTH])
					//.outa(tempa[(j+1)*n*WIDTH-1:j*n*WIDTH]),
					//.outb(tempb[(j+1)*n*WIDTH-1:j*n*WIDTH])
				);
			end
		endgenerate
generate
	genvar i; 
		for(i = 0; i < R; i = i + 1)
			begin:merge2to4_row 
				merge2to4#(.WIDTH(WIDTH)) merge2to4_0 
				(
					.inba(tempy[(i+1)*2*n*WIDTH-1:i*2*n*WIDTH]),
					//.a(tempa[(i+1)*n*WIDTH-1:i*n*WIDTH]),
					//.b(tempb[(i+1)*n*WIDTH-1:i*n*WIDTH]),
					.c(c[((i+1)*2*n)*WIDTH-1:i*n*2*WIDTH])
				);
			end
		endgenerate
endmodule