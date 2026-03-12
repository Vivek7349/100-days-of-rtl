module bcd_adder (x, y, c, sum);
	input [3:0]x;
	input [3:0]y;
	output reg c;
	output reg [3:0]sum;
	
	reg [4:0] temp;
	
	always @(*) begin 
		temp = x + y;
		
		if(temp > 9) begin 
			{c,sum}=temp + 5'b00110;
		end
		else
			{c,sum}=temp;
	end
endmodule