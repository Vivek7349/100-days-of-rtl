module comparator_2bit (A, B, Greater, Lesser, Equal);
	input A, B;
	output Greater, Lesser, Equal;
	
	assign Greater = A & ~B;
	assign Lesser = ~A & B;
	assign Equal = ~(A ^ B);
endmodule