
module merge8to16#(parameter WIDTH = 3,parameter n = 8)
(
	input  [(n*WIDTH)-1:0]a,b,
	output [(2*n*WIDTH)-1:0]c
);

`define a1 a[WIDTH-1:0] 
`define a2 a[2*WIDTH-1:WIDTH] 
`define a3 a[3*WIDTH-1:2*WIDTH] 
`define a4 a[4*WIDTH-1:3*WIDTH] 
`define a5 a[5*WIDTH-1:4*WIDTH]
`define a6 a[6*WIDTH-1:5*WIDTH] 
`define a7 a[7*WIDTH-1:6*WIDTH] 
`define a8 a[8*WIDTH-1:7*WIDTH]

`define b1 b[WIDTH-1:0] 
`define b2 b[2*WIDTH-1:WIDTH] 
`define b3 b[3*WIDTH-1:2*WIDTH] 
`define b4 b[4*WIDTH-1:3*WIDTH] 
`define b5 b[5*WIDTH-1:4*WIDTH]
`define b6 b[6*WIDTH-1:5*WIDTH] 
`define b7 b[7*WIDTH-1:6*WIDTH]
`define b8 b[8*WIDTH-1:7*WIDTH]   


wire [(n/2)*WIDTH-1:0] tempAodd = {`a7,`a5,`a3,`a1}; 
wire [(n/2)*WIDTH-1:0] tempBodd = {`b7,`b5,`b3,`b1}; 

wire [(n/2)*WIDTH-1:0] tempAeven = {`a8,`a6,`a4,`a2}; 
wire [(n/2)*WIDTH-1:0] tempBeven = {`b8,`b6,`b4,`b2};  

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
					merge4to8#(.WIDTH(WIDTH)) merge4to8_0
					(
						.a(tempAodd),
						.b(tempBodd),
						.c(tempCodd)
					);				
					end
				else
					begin 
						merge4to8#(.WIDTH(WIDTH)) merge4to8_1
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