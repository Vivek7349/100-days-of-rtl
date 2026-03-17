# 170326-synchronizer

## Overview

A **synchronizer** is a digital circuit used to safely transfer signals
between different clock domains. When signals cross clock domains, they
can cause **metastability**, which leads to unpredictable behavior.

------------------------------------------------------------------------

# What is Metastability?

Metastability occurs when a flip-flop input violates setup/hold time,
causing uncertain output.

------------------------------------------------------------------------

# 2-Flip-Flop Synchronizer

Basic structure:

async_in → FF1 → FF2 → sync_out

### Working:

-   FF1 may become metastable
-   FF2 stabilizes the output

------------------------------------------------------------------------

# Verilog Code

``` verilog
module synchronizer (
    input clk,
    input async_in,
    output reg sync_out
);

reg q1;

always @(posedge clk) begin
    q1 <= async_in;
    sync_out <= q1;
end

endmodule
```

------------------------------------------------------------------------

# Types

-   Single-bit synchronizer
-   Multi-bit (FIFO based)
-   Pulse synchronizer

------------------------------------------------------------------------

# Applications

-   Clock domain crossing
-   Button inputs
-   Communication systems
-   FPGA designs

------------------------------------------------------------------------

# Advantages

-   Simple
-   Reliable
-   Easy to implement

------------------------------------------------------------------------

# Limitations

-   Adds latency
-   Not for multi-bit signals

------------------------------------------------------------------------

# Summary

Synchronizers are essential for safe signal transfer across clock
domains and are widely used in digital systems.
