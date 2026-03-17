`timescale 1ns/1ps
module synchronizer (
    input d, clk,
    output reg q,q0
);

    reg notifier;

    // Flip-flop behavior with violation effect
    always @(posedge clk) begin
        if (notifier)
            q <= 1'bx;   // simulate metastability
        else
				q0 <= d;
            q <= q0;
    end

    // Timing checks
    specify
        specparam setup_time = 4, hold_time = 3;

        $setup(d, posedge clk, setup_time, notifier);
        $hold(posedge clk, d, hold_time, notifier);
    endspecify

endmodule