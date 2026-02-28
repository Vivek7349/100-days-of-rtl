module tb_bidirectional_shift_register;
	reg clk;
	reg d;
	reg rshift;
	reg reset;
	wire out;
	
	bidirectional_shift_register uut ( .clk(clk), .d(d), .rshift(rshift), .reset(reset), .out(out) );
	
	initial clk =1'b0;
	always #5 clk = ~clk;
	
	
	initial begin 
		#10 reset = 1'b1;
		#10 reset = 1'b0; rshift = 1'b1; d = 1'b1;
		#10 d = 1'b0;
		#10 d = 1'b1;
		#10 d = 1'b0;
		#40;
		rshift = 1'b0; d = 1'b1;
		#10 d = 1'b0;
		#10 d = 1'b1;
		#10 d = 1'b0;
		#50 $finish;
		
	end
	
endmodule