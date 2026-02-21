module clock_divider (
	input Clk,
	input Rst,
	output clk_divby2,
	output clk_divby4,
	output clk_divby8,
	output clk_divby16);
	
	reg [3:0]count;
	always @(posedge Clk) begin
		if(Rst)
			begin
				count <= 4'd0;
			end
		else
			begin
				count <= count +4'd1;
			end
	end
	assign clk_divby2 = count[0];
	assign clk_divby4 = count[1];
	assign clk_divby8 = count[2];
	assign clk_divby16 = count[3];
endmodule