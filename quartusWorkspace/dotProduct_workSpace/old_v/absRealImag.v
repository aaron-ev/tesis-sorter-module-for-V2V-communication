

module absRealImag#(parameter QI = 5, parameter QF = 11)
(
	input [QI-1:-QF] inReal,
	input [QI-1:-QF] inImag, 
	output outAbsReal,
	output outAbsImag
);

assign outAbsReal = inReal[QI-1] & 1'd1;
assign outAbsImag = inImag[QI-1] & 1'd1;

reg[3:0] sel; 

initial 
	sel = 0; 
	
always@(*)
	begin 
		case(sel)
			4
	end
endmodule
