module subtractor_8_bit(a, b, out);
	input [7:0]a;
	input [7:0]b;
	output [7:0]out;
	
	wire [7:0] b_2comp;
	
	assign b_2comp = ~b+1;
	assign out = a+b_2comp;
	

endmodule