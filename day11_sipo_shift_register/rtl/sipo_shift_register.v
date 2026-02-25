module sipo_shift_register (in, clk, reset, out);
	parameter N=3;
	input in;
	input clk;
	input reset;
	output out;
	
	reg [N-1:0]out;
	
	always @(posedge clk) begin
		if(reset)
			out <= {N{1'b0}};
		
		else
			out <= {in, out[N-1:1]};
	end
endmodule