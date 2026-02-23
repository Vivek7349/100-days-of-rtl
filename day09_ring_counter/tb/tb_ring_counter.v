module tb_ring_counter;
	parameter WIDTH = 4;
	reg clk;
	reg reset;
	wire [WIDTH-1:0]out;
	
	ring_counter uut ( .reset(reset), .clk(clk), .out(out) );
	
	initial clk= 1'b0;
	always #5 clk = ~clk;
	
	initial begin
		#5 reset = 1;
		#5 reset = 0;
		#50 $finish;
	end 
endmodule