
module mul2ab#(parameter WIDTH = 16)
(
	input [WIDTH-1:0] a,
	input [WIDTH-1:0] b, 
	output [WIDTH-1:0]out
);

assign out = (a * b) + (a * b);
endmodule 