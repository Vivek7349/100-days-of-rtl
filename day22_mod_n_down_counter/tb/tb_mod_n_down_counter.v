module tb_mod_n_down_counter;
	parameter N = 3;
	parameter len = $clog2(N);
	reg clk;
	reg reset;
	wire [len-1:0]out;
	
	mod_n_down_counter uut ( .clk(clk), .reset(reset), .out(out) );
	
	initial clk = 1'b0;
	always #5 clk = ~clk;
	
	initial begin 
		#10 reset = 1'b1;
		#10 reset = 1'b0;
		#100 $finish;
	end
	
endmodule