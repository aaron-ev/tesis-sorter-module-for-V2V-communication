/*
*	Description: Register of n bits. Default n = 8 bits. 
*	Author: Aarón Escoboza Villegas
*/

module register#(parameter WIDTH = 8)
(
	input clk,
	input rst,
	input [WIDTH-1:0]din, 
	output reg [WIDTH-1:0] dout
);

always@(posedge clk,negedge rst) 
begin 
	if (!rst)
		dout <= 0;
	else 
		dout <= din;
end
endmodule