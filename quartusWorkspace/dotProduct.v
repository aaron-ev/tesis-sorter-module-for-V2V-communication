
module dotProduct#(parameter WIDTH = 8)
(
	input clk, 
	input rst,
	input start, 
	input [WIDTH-1:0] inaReal,
	input [WIDTH-1:0] inaImag,
	input [WIDTH-1:0] inbReal,
	input [WIDTH-1:0] inbImag,
	input [WIDTH-1:0] incReal,
	input [WIDTH-1:0] incImag,	
	input [WIDTH-1:0] indReal,
	input [WIDTH-1:0] indImag,
	output done
);

complex2In4 complex2In4_0 
(

);

ramcomplexNum ramcomplexNum_0
(

);

ctrlUnitDotProduct ctrlUnitDotProduct_0
(

);
