
module adderSub#(parameter WIDTH = 16, parameter OP = 0)
(
	input [WIDTH-1:0] a,
	input [WIDTH-1:0] b, 
	output [WIDTH-1:0]sum,
	output carry
);

assign {carry,sum} = OP ? a - b: a + b; 

endmodule 