module mod_n_down_counter (clk, reset, out);
	parameter N = 3;
	parameter count = N-1;
	parameter len = $clog2(N);
	input clk;
	input reset;
	output reg [len-1: 0]out;
	
	always @(posedge clk) begin 
		if(reset)
			out <= count;
		else if (out == 0)	
			out <= count;
		else 
			out <= out -1;
	end
	
endmodule