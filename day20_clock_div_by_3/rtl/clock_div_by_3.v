module clock_div_by_3 (clk, out, reset);
	input clk, reset;
	output out;
	
	reg [1:0] count;
	reg a,d;
	
	always @(posedge clk) begin
		if (reset)
			count <= 2'b00;
		else if(count == 2'b10)
			count <= 2'b00;
		else
			count <= count + 1;
	end
	
	
	always @(posedge clk) begin 
		if(count == 2'b00)
			a <= 1'b1;
		else 
			a <= 1'b0;
	end
	
	always @(negedge clk)begin
		d <= a;
	end
	
	assign out = (a|d);
endmodule