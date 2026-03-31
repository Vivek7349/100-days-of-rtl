module odd_even_parity_generator(data_in, data_out, odd);
	parameter N = 8;
	input [N-1:0] data_in;
	output [N:0] data_out;
	input odd;
	
	assign data_out = odd ? {data_in,~(^data_in)} : {data_in,(^data_in)};
endmodule