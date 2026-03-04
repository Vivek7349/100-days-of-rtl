module tb_multiplier_4_bit;
	reg [3:0]a;
	reg [3:0]b;
	wire [7:0]m;
	
	multiplier_4_bit uut ( .a(a), .b(b), .m(m) );
	
	initial begin 
		$monitor ("a=%b | b=%b | m = %b |", a,b,m);
		#10 a = 4'b1010; b = 4'b1010;
		#50 $finish;
	end
endmodule 