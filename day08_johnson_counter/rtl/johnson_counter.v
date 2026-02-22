module johnson_counter(clk, reset, count);
	parameter WIDTH=4;
	input clk;
	input reset;
	output reg [WIDTH-1:0] count;
	
	
	always @(posedge clk) begin
		if(reset) begin
			count = {WIDTH{1'b0}};
		end
		
		else begin
			count <= {~count[0], count[WIDTH-1:1]};
		end
	end
endmodule