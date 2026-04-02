module parity_based_error_detection( data_in, error, odd);
	parameter N = 8;
	input odd;
	input [N-1:0] data_in;
	output error;
	
	wire [N:0] connect;
	
	assign connect = odd ? {(data_in),(~(^data_in))}: {(data_in),(^data_in)};
	
	assign error = odd ? ~(^connect) : ^connect;
	
endmodule