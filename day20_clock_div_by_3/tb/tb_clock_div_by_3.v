module tb_clock_div_by_3;
	reg clk, reset;
	wire out;
	
	clock_div_by_3 uut ( .clk(clk), .out(out), .reset(reset) );
	
	initial clk = 1'b0;
	always #5 clk = ~clk;
	
	initial begin
		#10 reset = 1'b1;
		#10 reset = 1'b0;
		#100 $finish;
	end
endmodule