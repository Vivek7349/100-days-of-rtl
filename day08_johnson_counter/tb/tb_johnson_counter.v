module tb_johnson_counter;
	reg clk;
	reg reset;
	
	parameter WIDTH =4;
	wire [WIDTH-1:0]count;
	
	johnson_counter uut (.clk(clk), .reset(reset), .count(count) );
	
	initial clk =1'b0;
	always #5 clk = ~clk;
	
	initial begin
		#10 reset = 1'b1;
		#10 reset = 1'b0;
		#100 $finish;
	end
	
endmodule