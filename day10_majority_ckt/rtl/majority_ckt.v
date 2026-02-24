module majority_ckt(in, out);
	parameter WIDTH=5;
	input [WIDTH-1:0]in;
	output out;
	
	integer i;
	reg [$clog2(WIDTH+1)-1:0]count;
	
	always @(in) begin
		count = 0;
		for(i=0;i<WIDTH;i=i+1)
			count = count + in[i];
	end
	
	assign out = (count >= (WIDTH+1)/2);
	
endmodule