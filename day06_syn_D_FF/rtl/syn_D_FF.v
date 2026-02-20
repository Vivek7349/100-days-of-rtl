module syn_D_FF (
	input D,
	input Clk,
	output reg Q,
	output wire Qb,
	input Reset);
	
	
	
	always @(posedge Clk) begin
	
		if(Reset) begin
			Q <= 1'b0;
		end
		
		else begin
			Q <= D;
		end
	end
	assign Qb = ~ Q;
	
endmodule