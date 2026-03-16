module tb_bcd_7segment;

reg [3:0] in;
reg reset;
wire [6:0] out;

integer i;

bcd_7segment uut ( .in(in), .reset(reset), .out(out) );

initial begin

    reset = 1;
    in = 4'b0000;
    #10;

    reset = 0;

    for(i = 0; i < 16; i = i + 1) begin
        in = i;
        #10;
    end

    $finish;

end

endmodule