module tb_majority_ckt;
	parameter N =5;
	reg [N-1:0]in;
	wire out;
	
	majority_ckt uut (.in(in), .out(out) );
	
	initial begin
		#5 in = 5'b00000;
		#5 in = 5'b00001;
		#5 in = 5'b00111;
		#5 in = 5'b11111;
		#5 in = 5'b00011;
		#5 in = 5'b10101;
		#15 $finish;
	end
	
endmodule