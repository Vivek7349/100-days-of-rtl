module tb_syn_T_FF;
	reg t, clk, reset;
	wire q;
	
	syn_T_FF uut ( .t(t), .clk(clk), .reset(reset), .q(q) );
	
	initial clk = 1'b0;
	always #5 clk = ~clk;
	
	initial begin 
		#5 reset = 1'b1;
		#10 reset = 1'b0; t = 1'b1;
		#10 reset = 1'b0; t = 1'b0;
		#10 reset = 1'b0; t = 1'b1;
		#10 reset = 1'b0; t = 1'b0;
		#10 reset = 1'b0; t = 1'b1;
		#10 reset = 1'b0; t = 1'b0;
		#10 reset = 1'b0; t = 1'b1;
		
		#50 $finish;
		
	end
	
endmodule