# 190226-day05-4X1-mux-con-assignment

##  Overview

This project implements a **4x1 Multiplexer (MUX)** in Verilog using a
**continuous assignment (`assign`) statement**.

A 4x1 MUX selects one of four inputs and forwards it to a single output
based on a 2-bit select signal.

------------------------------------------------------------------------

##  Source Code Used

``` verilog
module mux_4X1_con_assignment (
    input A, B, C, D,
    input [1:0] Sel,
    output Y );
    
    assign Y = (Sel == 2'b00) ? A :
                  (Sel == 2'b01) ? B :
                  (Sel == 2'b10) ? C :
                  (Sel == 2'b11) ? D:
                  1'b0;
endmodule
```

------------------------------------------------------------------------

##  Design Explanation

### Inputs

-   4 Data inputs
-   2-bit Select line

### Output

-   Single output that reflects one of the inputs based on the select
    value

### Working Principle

The `assign` statement continuously evaluates the select line and
updates the output accordingly.

Since this uses **continuous assignment**: - Output must be declared as
`wire` - Logic is purely combinational - No flip-flops or latches are
inferred

------------------------------------------------------------------------

##  Hardware Behavior

This design synthesizes into:

-   Pure combinational logic
-   A 4x1 multiplexer network
-   No sequential elements

Whenever: - Any data input changes - The select signal changes

The output updates immediately.

------------------------------------------------------------------------

##  Key Points

-   Uses continuous assignment (not procedural block)
-   Fully synthesizable RTL
-   Suitable for FPGA and ASIC implementation
-   Clean combinational design

------------------------------------------------------------------------

##  Suggested Next Steps

-   Write a testbench to verify all select combinations
-   Convert to a parameterized N:1 MUX
-   Implement using `case` statement for comparison

------------------------------------------------------------------------

**Design Type:** Combinational\
**Implementation Style:** Continuous Assignment
