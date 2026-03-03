module fsm_for_2s_complement (in, clk, reset, out);
	input in;
	input clk;
	input reset;
	output reg out;
	
	parameter S0 = 1'b0,
				 S1 = 1'b1;
				 
	reg p_state, n_state;
	
	always @(posedge clk) begin 
		if(reset)
			p_state <= 1'b0;
		else 
			p_state <= n_state;
	end
	
	always @(*) begin 

		case (p_state)
			S0:begin 
				if(in)
					n_state = S1;
				else 
					n_state = S0;
			end
			
			S1:n_state = S1;

			default : n_state = p_state;
		endcase
	end
	
	always @(*) begin
		case(p_state)
			S0 : out = in;
			S1 : out = ~in;
			default : out = 1'b0;
		endcase
	end

endmodule