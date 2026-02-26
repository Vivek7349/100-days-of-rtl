module pipo_shift_register (clk, reset, in, out);
	parameter N = 4;
	input clk;
	input reset;
	input [N-1:0]in;
	output out;

	reg [N-1:0]out;
	
	always @(posedge clk) begin 
		if(reset)
			out <= {N-1{1'b0}};
		else
			out <= in;
	end

endmodule