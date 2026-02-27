module tb_piso_shift_register;
	reg [2:0]  in;
	reg clk;
	reg load;
	reg reset;
	wire out;
	
	piso_shift_register uut ( .clk(clk), .reset(reset), .load(load), .in(in), .out(out) );
	
	initial clk =0;
	always #5 clk = ~clk;
	
	initial begin
		#10 reset =1'b1; 
		#10 reset =1'b0;load =1'b1; in= 3'b101;
		#10 load = 1'b0;
		#60 $finish;
	end


endmodule