
module ctrlUnitDotProduct#(parameter ADDR_WIDTH = 7)
(
	input clk,
	input rst, 
	input start,
	input [1:0]M,
	output reg we,
	output reg [ADDR_WIDTH-1:0] writeAddr,
	//output [ADDR_WIDTH-1:0] writeAddrImag,
	output reg done
);

`define QPSK 	2'b00 
`define QAM16  2'b01 
`define QAM64  2'b10 
`define QAM256 2'b11    

localparam IDLE = 2'd0;
localparam LOAD = 2'd1;
localparam DONE = 2'd3;

reg [1:0]state;
reg [1:0] nextState;

reg [ADDR_WIDTH-1:0]addrToCount;

//assign writeAddrImag = writeAddrReal + 1; 

//multiplexor for index M
always@(M)
	begin 
		case(M)
			`QPSK: addrToCount <= 0;
			`QAM16: addrToCount <= 4;
			`QAM64: addrToCount <= 28;
			`QAM256: addrToCount <= 124;
			default: addrToCount <= 0; 
		endcase
	end
	
always@(posedge clk,negedge rst) 
	begin
		if(!rst)
			state <= IDLE;
		else 
			state <= nextState;
	end

always@(posedge clk,negedge rst) 
	begin
		if(!rst)
			writeAddr <= 0; 
		else 
			if(state == DONE)
				writeAddr <= 0; 
			else 
				begin 
					if(state == LOAD)
						writeAddr <= writeAddr + 2;
					else 
						writeAddr <= writeAddr;							
				end
end
	
always @(state,start,writeAddr,addrToCount,M)
	begin 
		case(state)
			IDLE:	begin
						{we,done}<=2'b00;
						if(start && M == `QPSK)
							begin 
								nextState <= DONE;
							end
						else if(start)
							nextState <= LOAD;
						else 
							nextState <= IDLE;
					end
			LOAD: begin 
						{we,done}<=2'b10; 
						if(writeAddr == addrToCount)
							begin 
								nextState <= DONE;
							end
						else 
							nextState <= LOAD;
					end
			DONE: begin 
						{we,done}<=2'b11;
						if(start && M == `QPSK)
							nextState <= DONE;
						else if(start)
							nextState <= LOAD;
						else 
							nextState <= IDLE;
					end	
			default: begin 
							{we,done}<=2'b00;
							nextState <= IDLE;
						end 
		endcase
	end
	
endmodule