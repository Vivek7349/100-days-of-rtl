module bidirectional_shift_register(clk, d, out, rshift, reset);
	parameter N = 3;
	input clk;
	input d;
	input rshift;
	input reset;
	output out;
	
	reg [N-1:0]y;
	
	always @(posedge clk) begin
		if (reset)
			y <= {N{1'b0}};
			
		else if (rshift)
			y <= {d,y[N-1:1]};

		else
			y <= {y[N-2:0],d};
			
	end
	assign out =(rshift)? y[0] : y[N-1];
endmodule	