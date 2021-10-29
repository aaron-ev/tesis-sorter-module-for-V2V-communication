
module abs#(parameter WIDTH = 16)
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
	output  [WIDTH-1:0] outaAbs,
	output  [WIDTH-1:0] outbAbs,
	output  [WIDTH-1:0] outcAbs,
	output  [WIDTH-1:0] outdAbs	
);

reg [WIDTH-1:0] tempInaReal;
reg [WIDTH-1:0] tempInaImag;
reg [WIDTH-1:0] tempInbReal;
reg [WIDTH-1:0] tempInbImag;
reg [WIDTH-1:0] tempIncReal;
reg [WIDTH-1:0] tempIncImag;
reg [WIDTH-1:0] tempIndReal;
reg [WIDTH-1:0] tempIndImag;

assign outaAbs = tempInaReal * tempInaReal + tempInaImag * tempInaImag;
assign outbAbs = tempInbReal * tempInbReal + tempInbImag * tempInbImag;
assign outcAbs = tempInbReal * tempInbReal + tempInbImag * tempInbImag;
assign outdAbs = tempIndReal * tempIndReal + tempIndImag * tempIndImag;

always@(posedge clk,negedge rst)
	begin 
		if(!rst)
			begin
				tempInaReal <= 0;
				tempInaImag <= 0;
				tempInbReal <= 0;
				tempInbImag <= 0;
				tempIncReal <= 0;
				tempIncImag <= 0;
				tempIndReal <= 0;
				tempIndImag <= 0;
			end
		else 
			begin
				tempInaReal <= inaReal;
				tempInaImag <= inaImag;
				tempInbReal <= inbReal;
				tempInbImag <= inbImag;
				tempIncReal <= incReal;
				tempIncImag <= incImag;
				tempIndReal <= indReal;
				tempIndImag <= indImag;
		end
	end

endmodule