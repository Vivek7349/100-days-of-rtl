module tb_parity_based_error_detection;
	parameter N = 8;
	reg odd;
	reg [N-1:0] data_in;
	wire error;
	
	parity_based_error_detection uut ( .odd(odd), .data_in(data_in), .error(error) );
	
	
	initial begin
		odd = 1'b1; data_in = 8'b11110000;
		#5 data_in = 8'b10000000;
		#5 data_in = 8'b11000000;
		#5 data_in = 8'b11100000;
		#5 odd = 1'b0; data_in = 8'b10000000;
		#5 data_in = 8'b11000000;
		#5 data_in = 8'b11100000;
		#5 data_in = 8'b11110000;
		#5 data_in = 8'b11111000;
		#5 data_in = 8'b11111100;
		#5 data_in = 8'b11111110;
		#5 data_in = 8'b11111111;
		#30 $finish;
		
	
	end
	
endmodule