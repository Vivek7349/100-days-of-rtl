module syn_T_FF ( t, clk, reset, q);
	input t, clk, reset;
	output reg q;
	
	always @(posedge clk) begin 
		if(reset)
			q <= 1'b0;
		else if ( t == 1'b0 )
			q <= q;
		else 
			q <= ~q;
	end
endmodule