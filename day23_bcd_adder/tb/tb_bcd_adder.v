module tb_bcd_adder;
	reg [3:0] x,y;
	wire c;
	wire [3:0]sum;
	
	bcd_adder uut ( .x(x), .y(y), .c(c), .sum(sum) );
	
	initial begin 
		#10 x=4'b1001; y=4'b1001;
		#20 $finish;
	end
endmodule