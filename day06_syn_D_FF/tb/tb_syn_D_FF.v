module tb_syn_D_FF;
	reg d, clk, reset;
	wire q, qb;
	
	syn_D_FF dut (.D(d), .Clk(clk), .Reset(reset), .Q(q), .Qb(qb));
	
	initial begin
		clk =1'b0;
		repeat (20) #5 clk = ~clk;
		clk = 1'b0;
	end
	
	initial begin
		$display("Time=%0t | Reset=%b | D=%b | Clk=%b | Q=%b | Qb=%b |",$time, reset, d, clk, q, qb);
		
		#10 reset = 1'b1;
		#10 reset = 1'b0;
		#10 d= 1'b1;
		#10 d= 1'b0;
		#10 d= 1'b1;
		#10 reset = 1'b1;
		#10 reset = 1'b0;
		#10 d=1'b1;
		
		#30 d= 1'b0;
		
		#100 $finish;
	end
endmodule