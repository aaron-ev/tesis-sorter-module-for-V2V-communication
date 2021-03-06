
module norm#(parameter WIDTH = 16)
(
	input clk, 
	input rst,
	input [WIDTH-1:0] inaReal,
	input [WIDTH-1:0] inaImag,
	input [WIDTH-1:0] inbReal,
	input [WIDTH-1:0] inbImag,
	input [WIDTH-1:0] incReal,
	input [WIDTH-1:0] incImag,	
	input [WIDTH-1:0] indReal,
	input [WIDTH-1:0] indImag,
	output  [WIDTH-1:0] outaDist,
	output  [WIDTH-1:0] outbDist,
	output  [WIDTH-1:0] outcDist,
	output  [WIDTH-1:0] outdDist
);


wire [WIDTH-1:0] tempOutaAbs;
wire [WIDTH-1:0] tempOutbAbs;
wire [WIDTH-1:0] tempOutcAbs;
wire [WIDTH-1:0] tempOutdAbs;

	
abs#(.WIDTH(WIDTH)) abs_0 
(
	.clk(clk),
	.rst(rst),
	.inaReal(inaReal),
	.inaImag(inaImag),	
	.inbReal(inbReal),
	.inbImag(inbImag),
	.incReal(incReal),
	.incImag(incImag),
	.indReal(indReal),
	.indImag(indImag),
	
	.outaAbs(tempOutaAbs),
	.outbAbs(tempOutbAbs),
	.outcAbs(tempOutcAbs),
	.outdAbs(tempOutdAbs)		
);

square#(.WIDTH(WIDTH)) square_0 
(
	.a(tempOutaAbs),
	.y(outaDist)
);
square#(.WIDTH(WIDTH)) square_1 
(
	.a(tempOutbAbs),
	.y(outbDist)
);
square#(.WIDTH(WIDTH)) square_2 
(
	.a(tempOutcAbs),
	.y(outcDist)
);
square#(.WIDTH(WIDTH)) square_3 
(
	.a(tempOutdAbs),
	.y(outdDist)
);

endmodule