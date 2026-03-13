module moore_fsm_1010(in, out, reset, clk);
	input in, reset, clk;
	output reg out;
	
	parameter s00 = 3'b000,
				 s01 = 3'b001,
				 s10 = 3'b010,
				 s20 = 3'b011,
				 s30 = 3'b100;
	reg [2:0] p_state, n_state;
	
	always @(posedge clk) begin 
		if(reset)
			p_state <= s00;
		else
			p_state <= n_state;
	end
	
	always @(*) begin 
		case(p_state)
				s00: n_state = in ? s10 : s00;
				s10: n_state = in ? s10 : s20;
				s20: n_state = in ? s30 : s00;
				s30: n_state = in ? s10 : s01;
				s01: n_state = in ? s30 : s00;
				default: n_state = s00;
		endcase
	end
	
	always @(*) begin 
		out = (p_state == s01);
	end

endmodule