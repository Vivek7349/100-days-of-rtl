module tb_clock_divider;
	reg clk;
	reg rst;
	wire clk_divby2;
	wire clk_divby4;
	wire clk_divby8;
	wire clk_divby16;
	
	clock_divider dut (.Clk(clk), .Rst(rst), .clk_divby2(clk_divby2), 
	.clk_divby4(clk_divby4), .clk_divby8(clk_divby8), .clk_divby16(clk_divby16) );
	
	initial clk = 1'b0;
	always #2 clk = ~clk;
	
	initial begin
		#4 rst = 1'b1;
		#4 rst = 1'b0;
		#100 $finish;
	end
endmodule