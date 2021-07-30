
module ctrlUnitDotProduct#(parameter ADDR_WIDTH = 3)
(
	input clk,
	input rst, 
	input start,
	output reg we,
	output reg [ADDR_WIDTH-1:0] addr,
	output reg done
);

localparam IDLE = 2'd0;
localparam LOAD = 2'd1;
localparam DONE = 2'd3;

reg [1:0]state;
reg [1:0] nextState;

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
			addr <= 0; 
		else 
			if(state == DONE) 
				addr <= 0; 
			else 
				begin 
					if(state == LOAD)
						addr <= addr + 1;
					else 
						addr <= addr; 
				end
	end
	
always @(state)
	begin 
		case(state)
			IDLE:	begin
						we <= 0;
						done <= 0; 
						if(start)
							nextState <= LOAD;
						else 
							nextState <= IDLE;
					end
			LOAD: begin 
						we <= 1;
						done <= 0; 
						if(addr == 4-1)
							begin 
								nextState <= DONE;
							end
						else 
							nextState <= LOAD;
					end
			DONE: begin 
						we <= 1;
						done <= 1; 
						if(start)
							begin 
								nextState <= LOAD;
							end
						else 
							nextState <= IDLE;
					end		
			default: begin 
							we <= 0;
							nextState <= IDLE;
						end 
		endcase
	end
	
endmodule