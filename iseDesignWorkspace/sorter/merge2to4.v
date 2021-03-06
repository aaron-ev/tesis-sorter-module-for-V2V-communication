
module merge2to4#(parameter WIDTH = 3,parameter n = 2)
(
	input [(2*n)*WIDTH-1:0]inba,
	output [(2*n)*WIDTH-1:0]c
);

`define a1 inba[WIDTH-1:0] 
`define a2 inba[2*WIDTH-1:WIDTH] 

`define b1 inba[3*WIDTH-1:2*WIDTH]  
`define b2 inba[4*WIDTH-1:3*WIDTH] 

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