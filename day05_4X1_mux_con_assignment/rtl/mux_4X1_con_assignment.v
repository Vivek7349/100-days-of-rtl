module mux_4X1_con_assignment (
	input A, B, C, D,
	input [1:0] Sel,
	output Y );
	
	assign Y = (Sel == 2'b00) ? A :
				  (Sel == 2'b01) ? B :
				  (Sel == 2'b10) ? C :
				  (Sel == 2'b11) ? D:
				  1'b0;
endmodule