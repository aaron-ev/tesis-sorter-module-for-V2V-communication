
module square#(parameter WIDTH = 16)
(
	input [WIDTH-1:0] a,
	output [WIDTH-1:0]out
);

assign out = a * a; 

endmodule 