
module merge8to16_row#(parameter WIDTH = 2,parameter  n = 8, parameter R = 1) 
(
	input [(2*n*R)*WIDTH-1:0]inba,
	output [(2*n*R)*WIDTH-1:0]c
);

`define a inba[n*WIDTH-1:0]
`define b inba[2*n*WIDTH-1:2*WIDTH]

generate
	genvar i; 
		for(i = 0; i < R; i = i + 1)
			begin:merge8to16_row 
				merge8to16#(.WIDTH(WIDTH)) merge4to8_0 
				(
					.inba(inba[(i+1)*2*n*WIDTH-1:i*2*n*WIDTH]),
					.c(c[((i+1)*2*n)*WIDTH-1:i*n*2*WIDTH])
				);
			end
		endgenerate
		
wire [1*WIDTH-1:0*WIDTH]c1 = c[1*WIDTH-1:0*WIDTH];
wire [1*WIDTH-1:0*WIDTH]c2 = c[2*WIDTH-1:1*WIDTH];
wire [1*WIDTH-1:0*WIDTH]c3 = c[3*WIDTH-1:2*WIDTH];
wire [1*WIDTH-1:0*WIDTH]c4 = c[4*WIDTH-1:3*WIDTH];
wire [1*WIDTH-1:0*WIDTH]c5 = c[5*WIDTH-1:4*WIDTH];
wire [1*WIDTH-1:0*WIDTH]c6 = c[6*WIDTH-1:5*WIDTH];
wire [1*WIDTH-1:0*WIDTH]c7 = c[7*WIDTH-1:6*WIDTH];
wire [1*WIDTH-1:0*WIDTH]c8 = c[8*WIDTH-1:7*WIDTH];
wire [1*WIDTH-1:0*WIDTH]c9 = c[9*WIDTH-1:8*WIDTH];	
wire [1*WIDTH-1:0*WIDTH]c10 = c[10*WIDTH-1:9*WIDTH];	
wire [1*WIDTH-1:0*WIDTH]c11 = c[11*WIDTH-1:10*WIDTH];	
wire [1*WIDTH-1:0*WIDTH]c12 = c[12*WIDTH-1:11*WIDTH];	
wire [1*WIDTH-1:0*WIDTH]c13 = c[13*WIDTH-1:12*WIDTH];	
wire [1*WIDTH-1:0*WIDTH]c14 = c[14*WIDTH-1:13*WIDTH];	
wire [1*WIDTH-1:0*WIDTH]c15 = c[15*WIDTH-1:14*WIDTH];	
wire [1*WIDTH-1:0*WIDTH]c16 = c[16*WIDTH-1:15*WIDTH];	

endmodule
