module pseudo_bit_random_sequence (clk, reset, out);
	parameter N = 4;
	input clk;
	input reset;
	output out;
	
	reg [N-1:0]out;
	
	always @(posedge clk) begin 
		if (reset)
			out <= 4'b1001;
		else
			out <= { {out[1] ^ out[0]},{out[N-1:1]} };
	end
endmodule