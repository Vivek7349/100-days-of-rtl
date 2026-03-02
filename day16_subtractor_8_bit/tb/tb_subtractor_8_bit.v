module tb_subtractor_8_bit;
	reg [7:0]a;
	reg [7:0]b;
	wire [7:0]out;
	
	
	subtractor_8_bit uut ( .a(a), .b(b), .out(out) );
	
	initial begin 
		$monitor( "a = %b, b= %b, out=%b", a, b, out );
		#10 a = 8'b11111111; b=8'b11111110;
		#20  $finish;
	end

endmodule