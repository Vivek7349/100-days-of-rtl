module tb_and_gate;
	reg ina, inb; wire outx;
	and_gate dut (.a(ina), .b(inb), .x(outx));
	
	
	initial begin
		$monitor ("TIME= %0t | ina=%b inb=%b | outx=%b", $time, ina, inb, outx,);
		
		ina=0; inb=0;
		#5 ina=0; inb=1;
		#5 ina=1; inb=0;
		#5 ina=1; inb=1;
		#5 ina=0; inb=0;
		$finish;
	end
endmodule