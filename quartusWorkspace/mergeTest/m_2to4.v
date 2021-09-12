
module m_2to4#(parameter WIDTH = 4)
(
	input [4*WIDTH-1:0]inba,
	output [4*WIDTH-1:0]c,
	output [WIDTH-1:0]a1_t,
	output [WIDTH-1:0]b1_t,
	output [WIDTH-1:0]a2_t,
	output [WIDTH-1:0]b2_t
);

localparam n = 2; 

wire [n*WIDTH-1:0] tempbaOdd;
wire [n*WIDTH-1:0] tempbaEven;
wire [n*WIDTH-1:0] tempCodd; 
wire [n*WIDTH-1:0] tempCeven;

assign c[WIDTH-1:0] = tempCodd[WIDTH-1:0]; 
assign c[(2*n)*WIDTH-1:(2*n-1)*WIDTH] = tempCeven[n*WIDTH-1:(n-1)*WIDTH]; 

assign a1_t = tempbaOdd[WIDTH-1:0];
assign b1_t = tempbaOdd[2*WIDTH-1:WIDTH];
assign a2_t = tempbaEven[WIDTH-1:0];
assign b2_t = tempbaEven[2*WIDTH-1:WIDTH];

oddEvenInputs#(.WIDTH(WIDTH),.n(n)) inInterface
(
	.in(inba),
	.outOdd(tempbaOdd),
	.outEven(tempbaEven)
);

generate 
	genvar i; 
		for(i = 0; i < n; i = i + 1)
			begin:oddEvenMerge 
				if(i == 0)
					begin 
					comparator#(.WIDTH(WIDTH)) comparator_0
					(
						.A(tempbaOdd[WIDTH-1:0]),
						.B(tempbaOdd[2*WIDTH-1:WIDTH]),
						.L(tempCodd[WIDTH-1:0]),
						.H(tempCodd[n*WIDTH-1:(n-1)*WIDTH])
					);				
					end
				else
					begin 
						comparator#(.WIDTH(WIDTH)) comparator_1
					(
						.A(tempbaEven[WIDTH-1:0]),
						.B(tempbaEven[2*WIDTH-1:WIDTH]),
						.L(tempCeven[WIDTH-1:0]),
						.H(tempCeven[n*WIDTH-1:(n-1)*WIDTH])
					);							
					end
			end
	endgenerate
	
generate 
	genvar j; 
		for(j = 0; j < n-1; j = j + 1)
			begin:finalComparators 
				comparator#(.WIDTH(WIDTH)) comparator_2
					(
						.A(tempCodd[n*WIDTH-1:(n-1)*WIDTH]),
						.B(tempCeven[WIDTH-1:0]),
						.L(c[2*WIDTH-1:WIDTH]),
						.H(c[3*WIDTH-1:2*WIDTH])
					);						
			end
	endgenerate	
endmodule