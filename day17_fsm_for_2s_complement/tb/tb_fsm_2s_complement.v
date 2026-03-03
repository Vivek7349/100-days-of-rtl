`timescale 1ns/1ps

module tb_fsm_2s_complement;

    reg clk;
    reg reset;
    reg in;
    wire out;

    // Instantiate DUT
    fsm_for_2s_complement uut (
        .in(in),
        .clk(clk),
        .reset(reset),
        .out(out)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    initial begin
        // Initialize
        clk = 0;
        reset = 1;
        in = 0;

        #10;
        reset = 0;

        // Apply serial input: 0 0 1 1
        #10 in = 0;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;

        #20;
        $finish;
    end

endmodule