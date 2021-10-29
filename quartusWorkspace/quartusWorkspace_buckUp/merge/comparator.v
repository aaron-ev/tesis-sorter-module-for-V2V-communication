

module comparator#(parameter WIDTH = 8)
(
	input [WIDTH-1:0]A, 
	input	[WIDTH-1:0]B,
	output reg [WIDTH-1:0]L,
	output reg [WIDTH-1:0] H
);

always@(*)
	begin
		if(A < B)
			begin 
				L <= A; 
				H <= B;
			end
		else 
			begin 
				L <= B; 
				H <= A; 
			end
	end
endmodule  