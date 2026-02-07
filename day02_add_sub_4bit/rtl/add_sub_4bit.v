module add_sub_4bit (
	input [3:0] a,
	input [3:0] b,
	input mode,
	output [3:0] s,
	output  co);
	
	wire [3:0] x_b;
	wire [3:0] c;
	
	assign c[0] = mode;
	assign x_b = b ^ {4{mode}};
	
	
	full_add fa0(.A(a[0]), .B(x_b[0]), .Ci(c[0]), .S(s[0]), .Co(c[1]));
	full_add fa1(.A(a[1]), .B(x_b[1]), .Ci(c[1]), .S(s[1]), .Co(c[2]));
	full_add fa2(.A(a[2]), .B(x_b[2]), .Ci(c[2]), .S(s[2]), .Co(c[3]));
	full_add fa3(.A(a[3]), .B(x_b[3]), .Ci(c[3]), .S(s[3]), .Co(co));
	
endmodule