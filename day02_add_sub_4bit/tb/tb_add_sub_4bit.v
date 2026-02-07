module tb_add_sub_4bit;
	reg [3:0] Ain;
	reg [3:0] Bin;
	reg Cin;
	wire [3:0] Sum;
	wire Cout;
	
	add_sub_4bit dut (.a(Ain), .b(Bin), .mode(Cin), .s(Sum), .co(Cout));
	
	initial begin
		$monitor("Time =%0t | Ain = %b | Bin = %b | Cin=%b | Sum = %b %b|",$time, Ain, Bin, Cin, Cout, Sum);
		
		#10; Cin = 0; Ain = 4'b0111; Bin = 4'b0111;
		#10; Cin = 1; Ain = 4'b0111; Bin = 4'b0111;
		#10;
		$finish;
		
	end
endmodule
