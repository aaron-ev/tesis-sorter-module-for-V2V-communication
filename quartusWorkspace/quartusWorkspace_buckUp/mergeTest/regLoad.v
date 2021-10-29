
module regLoad#(parameter WIDTH = 3,parameter n = 2)
(
	input clk,
	input rst,
	input [1:0]load,
	input [2*n*WIDTH-1:0]inba,
	output[2*n*WIDTH-1:0]y
);

reg [n*WIDTH-1:0]tempa,tempb; 

assign y = {tempb,tempa};

always@(posedge clk,negedge rst)
	begin 
		if(!rst)
			begin 
				tempa <= 0; 
				tempb <= 0; 
			end
		else if(load[0])
			begin 
				tempa <= inba[n*WIDTH-1:0];
			end
		else if(load[1])
			begin 
				tempb <= inba[2*n*WIDTH-1:n*WIDTH];
			end
		else 
			begin
				tempa <= tempa; 
				tempb <= tempb; 
			end
	end

endmodule