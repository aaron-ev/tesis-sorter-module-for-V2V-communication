

module abs#(parameter WIDTH = 16)
(
	input [WIDTH-1:0] a,b,
	output [WIDTH-1:0]y
);

assign y = a*a + b*b; 

endmodule