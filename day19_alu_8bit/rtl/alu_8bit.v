module alu_8bit (a, b, x, op, carry, zero);
	input [7:0]a;
	input [7:0]b;
	output reg [7:0]x;
	input [2:0]op;
	output zero;
	output reg carry;
	
	parameter ad_op =	 3'b000,
				 sub_op = 3'b001,
				 and_op = 3'b010,
				 or_op =  3'b011,
				 xor_op = 3'b100,
				 not_op = 3'b101,
				 ls_op =  3'b110,
				 rs_op =  3'b111;
				 
	always @(*) begin 
		x=8'd0;
		carry = 1'b0;
		case (op)
			ad_op : {carry,x} = a + b;
			sub_op: {carry,x} = a + (~b+1);
			and_op: x = a & b;
			or_op : x = a | b;
			xor_op: x = a ^ b;
			not_op: x = ~a;
			ls_op : x = a << b[2:0];
			rs_op : x = a >> b[2:0];
			default : x=8'd0;
		endcase
	end
	assign zero = (x==8'd0);
	
endmodule