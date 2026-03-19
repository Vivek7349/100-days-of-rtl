module single_port_ram ( data_in, add, clk, we, data_out);
	parameter width = 8,
				 depth = 64,
				 add_bus = $clog2(depth);
				 
	input [width-1:0] data_in;
	input [add_bus-1:0] add;
	input clk, we;
	output reg [width-1:0] data_out;
	
	reg [width-1:0] ram [depth-1:0];
	
	always @(posedge clk) begin 
		if(we) 
			ram[add] <= data_in;
		
		else 
			data_out <= ram[add];
	end
endmodule