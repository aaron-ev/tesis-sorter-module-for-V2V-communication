
module merge2to4#(parameter WIDTH = 8,parameter n = 2)
(
	input [2*WIDTH-1:0]a,b,
	output [(2*n)*WIDTH-1:0]c
);

`define a1 a[WIDTH-1:0] 
`define b1 b[WIDTH-1:0] 
`define a2 a[2*WIDTH-1:WIDTH] 
`define b2 b[2*WIDTH-1:WIDTH] 

wire [n*WIDTH-1:0] tempCodd; 
wire [n*WIDTH-1:0] tempCeven;
 
assign c[WIDTH-1:0] = tempCodd[WIDTH-1:0]; 
assign c[(2*n)*WIDTH-1:(2*n-1)*WIDTH] = tempCeven[n*WIDTH-1:(n-1)*WIDTH]; 

generate 
	genvar i; 
		for(i = 0; i < n; i = i + 1)
			begin:oddEvenMerge 
				if(i == 0)
					begin 
					comparator#(.WIDTH(WIDTH)) comparator_0
					(
						.A(`a1),
						.B(`b1),
						.L(tempCodd[WIDTH-1:0]),
						.H(tempCodd[n*WIDTH-1:(n-1)*WIDTH])
					);				
					end
				else
					begin 
						comparator#(.WIDTH(WIDTH)) comparator_1
					(
						.A(`a2),
						.B(`b2),
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