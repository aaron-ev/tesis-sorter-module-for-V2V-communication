
module ctrlUnitDotProduct#(parameter ADDR_WIDTH = 3)
(
	input clk,
	input rst, 
	input start,
	output reg we,
	output reg [ADDR_WIDTH-1:0] addrReal,
	output reg [ADDR_WIDTH-1:0] addrImag,
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
			begin 
				addrReal <= 0; 
				addrImag <= 1; 
			end
		else 
			if(state == DONE)
				begin 
					addrReal <= 0; 
					addrImag <= 1; 
				end
			else 
				begin 
					if(state == LOAD)
						begin 
							addrReal <= addrReal + 2;
							addrImag <= addrImag + 2;
						end
					else 
						begin
							addrReal <= addrReal;
							addrImag <= addrImag;							
						end
				end
	end
	
always @(state,start,addrImag)
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
						if(addrImag == 7-2)
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