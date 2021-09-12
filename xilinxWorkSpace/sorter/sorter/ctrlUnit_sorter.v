
module ctrlUnit_sorter
(
	input clk,
	input rst,
	input [1:0]M,
	input start, 
	output reg done, 
	output reg [1:0]loadQPSK,
	output reg [1:0]loadQAM16
);

parameter IDLE = 2'b00; 
parameter MERGING = 2'b01; 
parameter DONE_QAMX = 2'b10;  
parameter DONE_QPSK = 2'b11;

parameter M_QPSK = 2'b00;
parameter M_QAM16 = 2'b01; 

localparam completed = 1'd1;
localparam uncompleted = 1'd0;

reg [1:0]state,nextState;
reg en; 
reg [7:0]toCountInQPSK;

`define QPSK 	2'b00 
`define QAM16  2'b01 
`define QAM64  2'b10 
`define QAM256 2'b11
//multiplexor for index M
always@(M)
	begin 
		case(M)
			`QPSK: toCountInQPSK <= 0;
			`QAM16: toCountInQPSK <= 4;
			`QAM64: toCountInQPSK <= 0;
			`QAM256: toCountInQPSK <= 0;
			default: toCountInQPSK <= 0; 
		endcase
	end
	
// current state logic
always@(posedge clk, negedge rst) 
	begin 
		if(!rst)
			begin 
				state <= IDLE;
			end
		else
			state <= nextState;
	end
	
//counter QPSK 
reg [7:0] countQPSK;  
always@(posedge clk, negedge rst)
	begin 
		if(!rst)
			begin 
				countQPSK <= 0; 
				loadQPSK <= 0;
				//done <= 0; 
			end
		else if(en) 
			begin 
				//done <= 0;
				countQPSK <= countQPSK + 1; 
				if(countQPSK == toCountInQPSK) 
					begin 
						countQPSK <= 0;
						if(start == 1)
							begin 
								loadQPSK <= (loadQPSK == 1) ? 2:1; 
							end
						else 
							begin 
								//done <= 1;
								loadQPSK <= 0;	
							end
							
					end
				else 
					loadQPSK <= (loadQPSK == 1) ? 2:1;
					
			end
		else 
			begin 
				countQPSK <= 0; 
				loadQPSK <= 0;
			end
	end	
	
//counter QAM16 
reg [7:0]countQAM16;  
reg [1:0]countToInit;  
reg [1:0]countToChangeQAM16; 
			
always@(posedge clk, negedge rst)
	begin 
		if(!rst)
			begin 
				countQAM16 <= 0; 
				loadQAM16 <= 0;
				countToInit <= 0;
			end
		else if(en) 
			begin 
				if(countToInit == 2'd2) 
					begin 
						countToChangeQAM16 <= countToChangeQAM16 + 1;
						case (countToChangeQAM16)
							0: loadQAM16 <= 1; 
							1: begin 
									countQAM16 <= countQAM16 + 1; 
									loadQAM16 <= 0;
								end 
							2: begin 
									loadQAM16 <= 2;
								end
							3: begin 
									loadQAM16 <= 0;
									countToChangeQAM16 <= 0;
								end								
						endcase
					end
				else 
					countToInit <= countToInit + 1;
			end
		else 
			begin 
				countToInit <= 0; 
				countQAM16 <= 0; 
				loadQAM16 <= 0;
				countToChangeQAM16 <= 0;
			end
	end	
//next state and ouput logic 
always@(state,start,M,countQPSK,toCountInQPSK)
	begin 
		case(state)
			 IDLE: begin 
						en <= 0; 
						done <= 0;
						if(start && M == M_QPSK)
							nextState <= DONE_QPSK;
						else if(start)
							nextState <= MERGING;
						else 
							nextState <= IDLE; 		
					end
			 MERGING: begin
							en <= 1;
							done <= 0;
							if(countQPSK == toCountInQPSK)
								nextState <= start ? MERGING:DONE_QAMX; 
							else 
								nextState <= MERGING;
						 end
			 DONE_QAMX: begin
							en <= 0;
							done <= 1;
							//if(start && M == M_QPSK)
								//nextState <= DONE_QAMX;
							if(start)
								nextState <= MERGING;
							else 
								nextState <= IDLE;
					end
			 DONE_QPSK: begin
							en <= 1;
							done <= 1;
							nextState <= start ? DONE_QPSK:IDLE;							
						 end						 
			default: nextState <= IDLE; 
		endcase
	end
endmodule