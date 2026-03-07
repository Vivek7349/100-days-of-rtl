module mod_n_up_counter (clk, out, reset);
	parameter N = 3;
	parameter len = $clog2(N);
	input clk;
	input reset;
	output reg [len-1:0]out;
	
	always @(posedge clk) begin 
		if (reset)
			out <= {len{1'b0}};
		else if(out == N-1)
			out <= {len{1'b0}};
		else 
			out <= out + 1;
	end
endmodule