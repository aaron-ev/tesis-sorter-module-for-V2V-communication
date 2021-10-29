
module merge8to16#(parameter WIDTH = 3,parameter n = 8)
(
	input [(2*n*WIDTH)-1:0]inba,
	output [(2*n*WIDTH)-1:0]c
);

`define a1 inba[WIDTH-1:0] 
`define a2 inba[2*WIDTH-1:WIDTH] 
`define a3 inba[3*WIDTH-1:2*WIDTH] 
`define a4 inba[4*WIDTH-1:3*WIDTH] 
`define a5 inba[5*WIDTH-1:4*WIDTH]
`define a6 inba[6*WIDTH-1:5*WIDTH] 
`define a7 inba[7*WIDTH-1:6*WIDTH] 
`define a8 inba[8*WIDTH-1:7*WIDTH]

`define b1 inba[9*WIDTH-1:8*WIDTH] 
`define b2 inba[10*WIDTH-1:9*WIDTH] 
`define b3 inba[11*WIDTH-1:10*WIDTH] 
`define b4 inba[12*WIDTH-1:11*WIDTH] 
`define b5 inba[13*WIDTH-1:12*WIDTH]
`define b6 inba[14*WIDTH-1:13*WIDTH] 
`define b7 inba[15*WIDTH-1:14*WIDTH]
`define b8 inba[16*WIDTH-1:15*WIDTH]   


wire [(n/2)*WIDTH-1:0] tempAodd = {`a7,`a5,`a3,`a1}; 
wire [(n/2)*WIDTH-1:0] tempBodd = {`b7,`b5,`b3,`b1}; 

wire [(n/2)*WIDTH-1:0] tempAeven = {`a8,`a6,`a4,`a2}; 
wire [(n/2)*WIDTH-1:0] tempBeven = {`b8,`b6,`b4,`b2};  

wire [2*(n/2)*WIDTH-1:0] tempbaOdd = {tempBodd,tempAodd}; 
wire [2*(n/2)*WIDTH-1:0] tempbaEven = {tempBeven,tempAeven};
 
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
						.inba(tempbaOdd),
						//.a(tempAodd),
						//.b(tempBodd),
						.c(tempCodd)
					);			
					end
				else
					begin 
						merge4to8#(.WIDTH(WIDTH)) merge4to8_1
					(
						.inba(tempbaEven),
						//.a(tempAeven),
						//.b(tempBeven),
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


wire [WIDTH-1:0]c1 = c[1*WIDTH-1:0*WIDTH];
wire [WIDTH-1:0]c2 = c[2*WIDTH-1:1*WIDTH];
wire [WIDTH-1:0]c3 = c[3*WIDTH-1:2*WIDTH];
wire [WIDTH-1:0]c4 = c[4*WIDTH-1:3*WIDTH];
wire [WIDTH-1:0]c5 = c[5*WIDTH-1:4*WIDTH];
wire [WIDTH-1:0]c6 = c[6*WIDTH-1:5*WIDTH];
wire [WIDTH-1:0]c7 = c[7*WIDTH-1:6*WIDTH];
wire [WIDTH-1:0]c8 = c[8*WIDTH-1:7*WIDTH];

wire [WIDTH-1:0]c9 = c[9*WIDTH-1:8*WIDTH];
wire [WIDTH-1:0]c10 = c[10*WIDTH-1:9*WIDTH];
wire [WIDTH-1:0]c11 = c[11*WIDTH-1:10*WIDTH];
wire [WIDTH-1:0]c12 = c[12*WIDTH-1:11*WIDTH];
wire [WIDTH-1:0]c13 = c[13*WIDTH-1:12*WIDTH];
wire [WIDTH-1:0]c14 = c[14*WIDTH-1:13*WIDTH];
wire [WIDTH-1:0]c15 = c[15*WIDTH-1:14*WIDTH];
wire [WIDTH-1:0]c16 = c[16*WIDTH-1:15*WIDTH];	
endmodule