module tb_pipo_shift_register;
	parameter N = 4;
	reg clk;
	reg reset;
	reg [N-1:0]in;
	wire [N-1:0]out;
	
	pipo_shift_register uut ( .clk(clk), .reset(reset), .in(in), .out(out) );
	
	initial clk = 0;
	always #5 clk = ~clk;
	
	initial begin
		#10 reset =1;
		#10 reset =0; in = 4'b0010;
		#10 in = 4'b1001;
		#10 in = 4'b1100;
		#10 in = 4'b1110;
		#10 in = 4'b1111;
		
		#20 $finish;
	end
endmodule