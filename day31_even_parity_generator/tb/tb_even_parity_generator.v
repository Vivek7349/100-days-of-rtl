module tb_even_parity_generator;
	parameter N = 8;
	reg [N-1:0] data_in;
	wire [N:0] data_out;
	
	even_parity_generator uut ( .data_in(data_in), .data_out(data_out) );
	
	initial begin 
		#5 data_in = 8'b10000000;
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