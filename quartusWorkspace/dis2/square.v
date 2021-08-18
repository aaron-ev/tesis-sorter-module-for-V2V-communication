

module square#(parameter WIDTH = 16)
(
	input [WIDTH-1:0] a,
	output [WIDTH-1:0]y
);

assign y = a*a; 

endmodule