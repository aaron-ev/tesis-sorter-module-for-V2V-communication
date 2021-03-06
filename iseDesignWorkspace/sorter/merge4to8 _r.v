

module merge4to8_r#(parameter WIDTH = 3,parameter n = 4)
(
	//input  [(n*WIDTH)-1:0]a,b,
	input clk,
	input rst,
	input [1:0]load,
	input [(2*n*WIDTH)-1:0]inba,
	output [(2*n*WIDTH)-1:0]c
);

wire  [(2*n*WIDTH)-1:0]tempba;

`define a1 tempba[WIDTH-1:0] 
`define a2 tempba[2*WIDTH-1:WIDTH] 
`define a3 tempba[3*WIDTH-1:2*WIDTH]
`define a4 tempba[4*WIDTH-1:3*WIDTH]
 
`define b1 tempba[5*WIDTH-1:4*WIDTH]  
`define b2 tempba[6*WIDTH-1:5*WIDTH] 
`define b3 tempba[7*WIDTH-1:6*WIDTH] 
`define b4 tempba[8*WIDTH-1:7*WIDTH]

wire [WIDTH-1:0]a1 = inba[WIDTH-1:0];
wire [WIDTH-1:0]a2 = inba[2*WIDTH-1:WIDTH];
wire [WIDTH-1:0]a3 = inba[3*WIDTH-1:2*WIDTH];
wire [WIDTH-1:0]a4 = inba[4*WIDTH-1:3*WIDTH];

wire [WIDTH-1:0]b1 = inba[5*WIDTH-1:4*WIDTH];
wire [WIDTH-1:0]b2 = inba[6*WIDTH-1:5*WIDTH];
wire [WIDTH-1:0]b3 = inba[7*WIDTH-1:6*WIDTH];
wire [WIDTH-1:0]b4 = inba[8*WIDTH-1:7*WIDTH];

wire [(n/2)*WIDTH-1:0] tempAodd = {`a3,`a1}; 
wire [(n/2)*WIDTH-1:0] tempBodd = {`b3,`b1}; 

wire [(n/2)*WIDTH-1:0] tempAeven = {`a4,`a2}; 
wire [(n/2)*WIDTH-1:0] tempBeven = {`b4,`b2}; 

wire [2*(n/2)*WIDTH-1:0] tempbaOdd = {tempBodd,tempAodd}; 
wire [2*(n/2)*WIDTH-1:0] tempbaEven = {tempBeven,tempAeven}; 


//correct
wire [n*WIDTH-1:0] tempCodd; 
wire [n*WIDTH-1:0] tempCeven;
 
assign c[WIDTH-1:0] = tempCodd[WIDTH-1:0]; //c1 first output
assign c[(2*n*WIDTH)-1:(2*n-1)*WIDTH] = tempCeven[n*WIDTH-1:(n-1)*WIDTH];//c2 last output; 

regLoad#(.WIDTH(WIDTH),.n(n)) register
(
	.clk(clk),
	.rst(rst),
	.load(load),
	.inba(inba),
	.y(tempba)
);

generate 
	genvar i; 
		for(i = 0; i < 2; i = i + 1)
			begin:oddEvenMerge 
				if(i == 0)
					begin 
					merge2to4#(.WIDTH(WIDTH)) merge2to4_0
					(
						.inba(tempbaOdd),
						//.a(tempAodd),
						//.b(tempBodd),
						.c(tempCodd)
					);				
					end
				else
					begin 
						merge2to4#(.WIDTH(WIDTH)) merge2to4_1
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

wire [1*WIDTH-1:0*WIDTH]c1 = c[1*WIDTH-1:0*WIDTH];
wire [1*WIDTH-1:0*WIDTH]c2 = c[2*WIDTH-1:1*WIDTH];
wire [1*WIDTH-1:0*WIDTH]c3 = c[3*WIDTH-1:2*WIDTH];
wire [1*WIDTH-1:0*WIDTH]c4 = c[4*WIDTH-1:3*WIDTH];
wire [1*WIDTH-1:0*WIDTH]c5 = c[5*WIDTH-1:4*WIDTH];
wire [1*WIDTH-1:0*WIDTH]c6 = c[6*WIDTH-1:5*WIDTH];
wire [1*WIDTH-1:0*WIDTH]c7 = c[7*WIDTH-1:6*WIDTH];
wire [1*WIDTH-1:0*WIDTH]c8 = c[8*WIDTH-1:7*WIDTH];	
endmodule