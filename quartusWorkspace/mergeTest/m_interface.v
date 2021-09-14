

module m_interface#(parameter WIDTH = 1,parameter n = 4)
(
	input [2*n*WIDTH-1:0]in,
	output [n*WIDTH-1:0]outOdd,
	output [n*WIDTH-1:0]outEven
);

wire [(n/2)*WIDTH-1:0] tempAodd; 
wire [(n/2)*WIDTH-1:0] tempAeven; 

wire [(n/2)*WIDTH-1:0] tempBodd; 
wire [(n/2)*WIDTH-1:0] tempBeven; 

assign outOdd = {tempBodd,tempAodd}; 
assign outEven = {tempBeven,tempAeven}; 


`define k (i/2)
genvar i;
generate
	for(i = 0; i < n-1; i = i + 2) 
		begin :oddValues
			if(i == 0)//an evaluation of 0 is needed because of we divide by 0 in k macro
				begin 
					cableUnit#(.WIDTH(WIDTH)) unita(in[WIDTH-1:0],tempAodd[WIDTH-1:0]);
					cableUnit#(.WIDTH(WIDTH)) unitb(in[(n+1)*WIDTH-1:n*WIDTH],tempBodd[WIDTH-1:0]);	
				end 
			else 
				begin 
					cableUnit#(.WIDTH(WIDTH)) unita1(in[(i+1)*WIDTH-1:i*WIDTH],tempAodd[(`k+1)*WIDTH-1:`k*WIDTH]); 
					cableUnit#(.WIDTH(WIDTH)) unitb2(in[(i+1+n)*WIDTH-1:(i+n)*WIDTH],tempBodd[(`k+1)*WIDTH-1:`k*WIDTH]); 
				end
		end
endgenerate


`define r ((j-1)/2)
genvar j;
generate
	for(j = 1; j < n; j = j + 2) 
		begin :evenValues
			cableUnit#(.WIDTH(WIDTH)) unita1(in[(j+1)*WIDTH-1:j*WIDTH],tempAeven[(`r+1)*WIDTH-1:`r*WIDTH]); 
			cableUnit#(.WIDTH(WIDTH)) unitb2(in[(j+1+n)*WIDTH-1:(j+n)*WIDTH],tempBeven[(`r+1)*WIDTH-1:`r*WIDTH]); 		
		end
endgenerate
endmodule

