# 200226-syn-D-FF

## Overview

This project implements and verifies a **Synchronous D Flip-Flop** using
Verilog HDL.

A D (Data) flip-flop is a fundamental **sequential logic** element used
to store one bit of data.\
Unlike combinational circuits, the output of a flip-flop depends on
both:

-   Present inputs
-   Previous state (stored value)

This makes it a memory element.

------------------------------------------------------------------------

## Functional Description

### Inputs

-   `clk` : Clock signal (active on rising edge)
-   `rst` : Synchronous reset
-   `d` : Data input

### Outputs

-   `q` : Stored output
-   `q_bar` : Complement of stored output

------------------------------------------------------------------------

## Operation

The flip-flop updates its output only on the **positive edge of the
clock**.

Behavior:

-   If `rst = 1` at rising edge → `q = 0`
-   If `rst = 0` at rising edge → `q = d`
-   Between clock edges → output remains unchanged

### RTL Logic

``` verilog
always @(posedge clk) begin
    if (rst)
        q <= 1'b0;
    else
        q <= d;
end

assign q_bar = ~q;
```

------------------------------------------------------------------------

## Why the Data Remains Stored

This is the key concept of sequential logic.

After a rising clock edge:

-   The value of `d` is copied into `q`
-   That value is stored inside the flip-flop
-   Even if:
    -   The clock stops toggling
    -   The input `d` changes
    -   The input `d` is removed

The stored value remains in `q`

### Why?

Because a flip-flop is implemented internally using feedback-based latch
structures.\
The output is fed back internally to maintain its state.

Without another active clock edge:

→ No new data is captured\
→ The stored state remains stable

This is how memory works in digital systems.

------------------------------------------------------------------------

## Timing Behavior

-   Output changes only at `posedge clk`
-   No combinational dependency on `d` between clock edges
-   Output is stable between clock transitions

------------------------------------------------------------------------

## Verification Strategy

The testbench performs:

-   Clock generation
-   Reset testing
-   Data transitions between clock edges
-   Observation of output stability

### Key Verification Points

1.  Reset forces output to 0 on rising edge
2.  Output updates only on rising edge
3.  Output remains constant between clock edges
4.  `q_bar` is always complement of `q`

------------------------------------------------------------------------

## Simulation Observation

Waveform confirms:

-   `q` changes only at rising clock edges
-   `q_bar = ~q`
-   When clock stops, `q` retains last stored value
-   Changing `d` without a clock edge does NOT affect `q`

This validates correct sequential behavior.

------------------------------------------------------------------------

## Applications

D Flip-Flops are used in:

-   Registers
-   Shift registers
-   Counters
-   State machines
-   Memory elements
-   Pipeline stages in processors

------------------------------------------------------------------------

## Conclusion

The Synchronous D Flip-Flop successfully demonstrates:

-   Controlled state storage
-   Edge-triggered behavior
-   Memory retention without continuous input
-   Fundamental sequential logic principles

This is a core building block for all synchronous digital systems.
