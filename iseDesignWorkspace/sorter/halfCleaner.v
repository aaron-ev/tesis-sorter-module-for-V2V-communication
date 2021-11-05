
module halfCleaner#(parameter WIDTH = 4,parameter N = 4)
(
	input  [(N*WIDTH)-1:0]din,
	output [(N*WIDTH)-1:0]dout
);

generate
	genvar i;
		for(i = 0; i < N/2; i = i + 1)
			begin:conectionProcess
				comparator#(.WIDTH(WIDTH)) comparator_0
				(
					.a(din[((i+1)*WIDTH)-1:i*WIDTH]),
					.b(din[((i+3)*WIDTH)-1:(i+2)*WIDTH]),
					.min(dout[((i+1)*WIDTH)-1:i*WIDTH]),
					.max(dout[((i+3)*WIDTH)-1:(i+2)*WIDTH])
				);
			end
	endgenerate
endmodule