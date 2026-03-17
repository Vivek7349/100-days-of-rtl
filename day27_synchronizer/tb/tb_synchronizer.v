`timescale 1ns/1ps

module tb_synchronizer;

	reg clk = 0;
	reg d = 0;
	wire q;

	synchronizer uut (.d(d), .clk(clk), .q(q));
	initial clk = 1'b0;
	always #5 clk = ~clk;  // 10ns period

	initial begin
		 d = 0;

		 #4 d = 1;   // INSIDE setup window (before edge at 5)
		 #2 d = 0;   // INSIDE hold window (after edge)

		 #10;

		 #4 d = 1;
		 #2 d = 0;

		 #20 $finish;
	end

endmodule
