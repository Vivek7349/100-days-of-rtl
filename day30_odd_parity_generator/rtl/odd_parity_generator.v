module odd_parity_generator (data_in, data_out);
	parameter N = 8;
	input [N-1:0] data_in;
	output [N:0] data_out;
	
	assign data_out = { (data_in), (~(^data_in))};
endmodule