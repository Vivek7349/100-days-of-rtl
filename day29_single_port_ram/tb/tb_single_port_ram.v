module tb_single_port_ram;
	parameter width = 8,
				 depth = 64,
				 add_bus = $clog2(depth);
				 
	reg [width-1:0] data_in;
	reg [add_bus-1:0] add;
	reg clk, we;
	wire [width-1:0] data_out;
	
	single_port_ram uut ( .data_in(data_in), .add(add), .clk(clk), .we(we), .data_out(data_out) );
	
	initial clk = 1'b0;
	always #5 clk = ~clk;
	
	initial begin 
		we = 1'b1; data_in = 8'b11111111; add = 6'110000;
		#20 we = 1'b0; add = 8'b11110000;
		
		#40 $finish;
	end
endmodule