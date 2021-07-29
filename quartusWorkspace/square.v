
module square#(parameter WIDTH = 8)
(
	input [WIDTH-1:0] a,
	output [2*WIDTH-1:0]out
);

assign out = a * a; 

endmodule 