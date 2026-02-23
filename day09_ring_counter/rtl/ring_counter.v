module ring_counter (clk, reset, out);
	parameter WIDTH = 4;
	input clk;
	input reset;
	output wire [WIDTH-1:0]out;
	
	reg [WIDTH-1:0]count;
	
	always @(posedge clk) begin
		if(reset) begin
			count <= { {1'b1}, {WIDTH-1{1'b0}} };
		end
		
		else begin
			count <= {count[0], count[WIDTH-1 : 1]};
		end
	end
	assign out = count;
endmodule