module tb_comparator_2bit;
	reg a, b;
	wire greater, lesser, equal;
	
	comparator_2bit dut (.A(a), .B(b), .Greater(greater), .Lesser(lesser), .Equal(equal));
	
	initial begin
		$monitor("Time =%t | A = %b | B = %b | Greater = %b | Lesser = %b | Equal = %b", $time, a, b, greater, lesser, equal);
		
		#10; a = 0; b = 0;
		#10; a = 0; b = 1;
		#10; a = 1; b = 0;
		#10; a = 1; b = 1;
		#10;
		
		$finish;
	end
endmodule