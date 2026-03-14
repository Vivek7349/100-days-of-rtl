module mux_n_to_1 (in, sel, out);
	parameter n = 4;
	parameter sel_len = $clog2(n);
	
	input [n-1:0] in;
	input [sel_len-1:0] sel;
	output out;
	
	assign out = (sel<n) ? in[sel] : 1'b0;

endmodule