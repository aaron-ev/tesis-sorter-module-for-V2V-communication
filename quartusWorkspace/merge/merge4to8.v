
module merge4to8#(parameter WIDTH = 3,parameter n = 4)
(
	input  [(n*WIDTH)-1:0]a,b,
	output [(2*n*WIDTH)-1:0]c
);
`define a1 a[WIDTH-1:0] 
`define b1 b[WIDTH-1:0] 
`define a3 a[3*WIDTH-1:2*WIDTH] 
`define b3 b[3*WIDTH-1:2*WIDTH] 

`define a2 a[2*WIDTH-1:WIDTH] 
`define b2 b[2*WIDTH-1:WIDTH] 
`define a4 a[4*WIDTH-1:3*WIDTH] 
`define b4 b[4*WIDTH-1:3*WIDTH] 

wire [n*WIDTH-1:0] tempAodd = {`a3,`a1}; 
wire [n*WIDTH-1:0] tempBodd = {`b3,`b1}; 

wire [n*WIDTH-1:0] tempAeven = {`a4,`a2}; 
wire [n*WIDTH-1:0] tempBeven = {`b4,`b2}; 

wire [n*WIDTH-1:0] tempCodd; 
wire [n*WIDTH-1:0] tempCeven;
 
assign c[WIDTH-1:0] = tempCodd[WIDTH-1:0]; 
assign c[(2*n*WIDTH)-1:(2*n-1)*WIDTH] = tempCeven[n*WIDTH-1:(n-1)*WIDTH]; 

generate 
	genvar i; 
		for(i = 0; i < 2; i = i + 1)
			begin:oddEvenMerge 
				if(i == 0)
					begin 
					merge2to4#(.WIDTH(WIDTH)) merge2to4_0
					(
						.a(tempAodd),
						.b(tempBodd),
						.c(tempCodd)
					);				
					end
				else
					begin 
						merge2to4#(.WIDTH(WIDTH)) merge2to4_1
					(
						.a(tempAeven),
						.b(tempBeven),
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
endmodule