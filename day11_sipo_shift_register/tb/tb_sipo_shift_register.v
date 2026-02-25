module tb_sipo_shift_register;
	parameter N=3;
	reg in;
	reg clk;
	reg reset;
	wire [N-1:0]out;
	
	sipo_shift_register uut ( .in(in), .clk(clk), .reset(reset), .out(out) );
	
	initial clk =1'b0;
	always #5 clk = ~clk;
	
	initial begin
		#10 reset = 1'b1;
		#10 reset = 1'b0;in = 1'b0;
		#10 in = 1'b1;
		#10 in = 1'b0;
		#10 in = 1'b1;
		
		#20 $finish;
	end
	
endmodule