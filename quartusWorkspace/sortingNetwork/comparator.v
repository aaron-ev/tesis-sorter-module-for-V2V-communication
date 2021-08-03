

module comparator#(parameter WIDTH = 16)
(
	input [WIDTH-1:0]a, 
	input	[WIDTH-1:0]b,
	output reg [WIDTH-1:0]min,
	output reg [WIDTH-1:0]max 
);

always@(*)
	begin
		if(a < b)
			begin 
				min <= a; 
				max <= b;
			end
		else 
			begin 
				min <= b; 
				max <= a; 
			end
	end
endmodule  