module multiplier_4_bit (a, b, m);
	input [3:0]a;
	input [3:0]b;
	output [7:0]m;
	
	
	wire [3:0] m0, m1, m2, m3;
	
	assign m0 = a[3:0] & {4{b[0]}};
	assign m1 = a[3:0] & {4{b[1]}};
	assign m2 = a[3:0] & {4{b[2]}};
	assign m3 = a[3:0] & {4{b[3]}};

	
	assign m = ({4'b000,m0})+
				  ({3'b000,m1,1'b0})+
				  ({2'b00,m2,2'b00})+
				  ({1'b0,m3,3'b000});
endmodule