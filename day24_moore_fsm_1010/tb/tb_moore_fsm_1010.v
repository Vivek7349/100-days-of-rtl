module tb_moore_fsm_1010;
	reg in, clk, reset;
	wire out;
	
	moore_fsm_1010 uut ( .in(in), .clk(clk), .reset(reset), .out(out) );
	
	initial clk = 1'b0;
	always #5 clk = ~clk;
	
	
	initial begin
		#10 reset = 1'b1;
		#10 reset = 1'b0; in = 1'b1;
		#10 in = 1'b0;
		#10 in = 1'b1;
		#10 in = 1'b0;
		#10 in = 1'b1;
		#10 in = 1'b0;
		
		#40 $finish;
		
	end
endmodule