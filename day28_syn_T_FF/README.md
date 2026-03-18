# 180326-syn_T_FF

## Overview

A **T Flip-Flop (Toggle Flip-Flop)** is a sequential logic circuit that
toggles its output on each clock edge when the input `T` is HIGH.

It is widely used in counters, frequency dividers, and digital systems
requiring toggle operations.

------------------------------------------------------------------------

# What is a T Flip-Flop?

Inputs: - T (Toggle) - Clock (clk)

Output: - Q

### Behavior

  T   Q(n+1)
  --- --------
  0   Q(n)
  1   \~Q(n)

------------------------------------------------------------------------

# Truth Table

  T   Q(n)   Q(n+1)
  --- ------ --------
  0   0      0
  0   1      1
  1   0      1
  1   1      0

------------------------------------------------------------------------

# Characteristic Equation

Q(n+1) = T ⊕ Q(n)

------------------------------------------------------------------------

# Verilog Implementation

``` verilog
module t_flip_flop (
    input clk,
    input reset,
    input T,
    output reg Q
);

always @(posedge clk) begin
    if (reset)
        Q <= 1'b0;
    else if (T)
        Q <= ~Q;
end

endmodule
```

------------------------------------------------------------------------

# Applications

1.  Binary counters\
2.  Frequency dividers\
3.  Digital clocks\
4.  Toggle circuits\
5.  FSM design\
6.  Control systems

------------------------------------------------------------------------

# Advantages

-   Simple design\
-   Efficient for toggling\
-   Used in frequency division

------------------------------------------------------------------------

# Limitations

-   Not used for general storage\
-   Needs clock

------------------------------------------------------------------------

# Summary

T Flip-Flop toggles output when T=1 and holds state when T=0.\
It is widely used in counters and clock-related designs.
