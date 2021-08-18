
module regLoad#(parameter WIDTH = 8,parameter n = 2)
(
	input clk,
	input rst,
	input load,
	//input [n*WIDTH-1:0]a,
	//input [n*WIDTH-1:0]b,
	input [2*n*WIDTH-1:0]inba,
	//output reg [n*WIDTH-1:0]outa,
	//output reg [n*WIDTH-1:0]outb
	output reg [2*n*WIDTH-1:0]y
);

always@(posedge clk,negedge rst)
	begin 
		if(!rst)
			begin 
				y <= 0; 
			end
		else if(load)
			begin 
				y <= inba;
			end
		else 
			begin 
				y <= y;
			end
	end

endmodule