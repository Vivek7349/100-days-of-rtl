module tb_pseudo_bit_random_sequence;
	reg clk;
	reg reset;
	wire [3:0]out;
	
	pseudo_bit_random_sequence uut( .clk(clk), .reset(reset), .out(out) );
	
	initial clk = 1'b0;
	always #5 clk = ~clk;
	
	initial begin 
		#10 reset = 1'b1;
		#10 reset = 1'b0; 
		#200 $finish;
	end 
endmodule