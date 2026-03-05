module tb_alu_8bit;
	reg [7:0] a, b;
	reg [2:0] op;
	wire [7:0] x;
	wire carry;
	wire zero;
	
	alu_8bit uut ( .a(a), .b(b), .op(op), .x(x), .carry(carry), .zero(zero) );
	
	initial begin
		$monitor("a=%b, b=%b, op=%b, x=%b, carry= %b, zero = %b", a,b,op,x,carry,zero);
		 // ADD
    a = 8'd10; b = 8'd5; op = 3'b000;
    #10;

    // SUB
    a = 8'd10; b = 8'd5; op = 3'b001;
    #10;

    // AND
    a = 8'b10101010; b = 8'b11001100; op = 3'b010;
    #10;

    // OR
    a = 8'b10101010; b = 8'b11001100; op = 3'b011;
    #10;

    // XOR
    a = 8'b10101010; b = 8'b11001100; op = 3'b100;
    #10;

    // NOT
    a = 8'b10101010; b = 8'b00000000; op = 3'b101;
    #10;

    // SHIFT LEFT
    a = 8'b00001111; b = 8'b00000010; op = 3'b110;
    #10;

    // SHIFT RIGHT
    a = 8'b11110000; b = 8'b00000010; op = 3'b111;
    #10;

    $finish;
	
	end
endmodule