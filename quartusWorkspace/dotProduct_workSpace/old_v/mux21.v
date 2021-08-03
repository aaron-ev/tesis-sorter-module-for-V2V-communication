
module mux21#(parameter WIDTH = 8)
(
	input [WIDTH-1:0]a,
	input [WIDTH-1:0]b,
	input sel,
	output [WIDTH-1:0] out
);

assign out = sel ? b:a;

endmodule