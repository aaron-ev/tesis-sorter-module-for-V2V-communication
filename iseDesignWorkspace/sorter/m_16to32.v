

module m_16to32#(parameter WIDTH = 3,parameter n = 16)
(
	input [(2*n*WIDTH)-1:0]inba,
	output [(2*n*WIDTH)-1:0]c
);

wire [(2*n*WIDTH)-1:0]tempba;
wire [2*(n/2)*WIDTH-1:0] tempbaOdd; 
wire [2*(n/2)*WIDTH-1:0] tempbaEven; 
wire [n*WIDTH-1:0] tempCodd; 
wire [n*WIDTH-1:0] tempCeven;
 
assign c[WIDTH-1:0] = tempCodd[WIDTH-1:0]; //c1 first output
assign c[(2*n*WIDTH)-1:(2*n-1)*WIDTH] = tempCeven[n*WIDTH-1:(n-1)*WIDTH];//c2 last output; 

m_interface#(.WIDTH(WIDTH),.n(n)) inInterface
(
	.in(inba),
	.outOdd(tempbaOdd),
	.outEven(tempbaEven)
);

generate 
	genvar i; 
		for(i = 0; i < 2; i = i + 1)
			begin:oddEvenMerge 
				if(i == 0)
					begin 
						m_8to16#(.WIDTH(WIDTH)) m_2to4_0
						(
							.inba(tempbaOdd),
							.c(tempCodd)
						);				
					end
				else
					begin 
						m_8to16#(.WIDTH(WIDTH)) m_2to4_1
						(
							.inba(tempbaEven),
							.c(tempCeven)
						);						
					end
			end
	endgenerate
	
generate 
	genvar j; 
		for(j = 1; j < n; j = j + 1)
			begin:finalComparators 
				comparator#(.WIDTH(WIDTH)) comparator_0
					(
						.A(tempCodd[(j+1)*WIDTH-1:j*WIDTH]),
						.B(tempCeven[(j*WIDTH)-1:(j-1)*WIDTH]),
						.L(c[(2*j*WIDTH)-1:(2*j-1)*WIDTH]),
						.H(c[((2*j+1)*WIDTH)-1:(2*j)*WIDTH])
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
endmodule