module piso_shift_register (in, out, clk, reset, load);
	parameter N = 3;
	input [N-1:0]in;
	output out;
	input clk;
	input reset;
	input load;
	
	reg [N-1:0] y;
	
	
	always @(posedge clk) begin
		if(reset) begin
			 y <= {N{1'b0}};
		end
		else if(load) begin 
			y <= in;
		end
		else begin
			y <= { {1'b0}, {y[N-1:1]}};
		end
	
	end
	assign out = y[0];
endmodule