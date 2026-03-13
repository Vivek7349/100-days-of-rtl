# 130326-moore-fsm-1010

## Overview

A Finite State Machine (FSM) is a sequential logic circuit where the
output depends on the sequence of inputs over time. FSMs are widely used
in digital design, processors, communication systems, and control logic.

Two major FSM models exist: - Moore Machine - Mealy Machine

This project implements a **Moore FSM that detects the sequence 1010
with overlapping detection using Verilog HDL.**

------------------------------------------------------------------------

# Moore Machine

A Moore Machine is an FSM where the **output depends only on the current
state**.

Output = f(State)

Because the output depends only on the state, the output changes **only
when the state changes on a clock edge**.

### Moore Characteristics

-   Output depends only on state
-   Output changes on clock edges
-   Very stable outputs
-   Usually requires more states

------------------------------------------------------------------------

# Mealy Machine

A Mealy Machine is an FSM where the **output depends on both state and
input**.

Output = f(State, Input)

### Mealy Characteristics

-   Output depends on state and input
-   Output can change immediately when input changes
-   Usually requires fewer states
-   Can produce glitches if inputs are asynchronous

------------------------------------------------------------------------

# Moore vs Mealy Comparison

  Feature             Moore           Mealy
  ------------------- --------------- -------------------
  Output depends on   State           State + Input
  Output timing       On clock edge   Immediate
  Number of states    More            Fewer
  Output stability    Very stable     Possible glitches
  Design complexity   Easier          Slightly complex

------------------------------------------------------------------------

# Sequence Detector -- 1010

This FSM detects the binary sequence **1010** in a serial input stream.

The design supports **overlapping detection**.

Example:

Input: 1 0 1 0 1 0

Output: 0 0 0 1 0 1

This means the FSM can detect the sequence again without resetting
fully.

------------------------------------------------------------------------

# State Definitions

The FSM tracks prefixes of the sequence.

  State   Meaning
  ------- ------------------------------
  s00     No match
  s10     Detected 1
  s20     Detected 10
  s30     Detected 101
  s01     Detected 1010 (output state)

------------------------------------------------------------------------

# FSM Architecture

The FSM is implemented using the **three block FSM model**.

1.  State Register\
    Stores the present state.

2.  Next State Logic\
    Determines the next state based on input.

3.  Output Logic\
    For Moore FSM the output depends only on the state.

------------------------------------------------------------------------

# Verilog Design

``` verilog
module moore_fsm_1010(in, out, reset, clk);

input in, reset, clk;
output reg out;

localparam s00 = 3'b000,
           s01 = 3'b001,
           s10 = 3'b010,
           s20 = 3'b011,
           s30 = 3'b100;

reg [2:0] p_state, n_state;

always @(posedge clk) begin
    if(reset)
        p_state <= s00;
    else
        p_state <= n_state;
end

always @(*) begin
    case(p_state)
        s00: n_state = in ? s10 : s00;
        s10: n_state = in ? s10 : s20;
        s20: n_state = in ? s30 : s00;
        s30: n_state = in ? s10 : s01;
        s01: n_state = in ? s30 : s00;
        default: n_state = s00;
    endcase
end

always @(*) begin
    case(p_state)
        s01: out = 1'b1;
        default: out = 1'b0;
    endcase
end

endmodule
```

------------------------------------------------------------------------

# Applications of Moore FSM

Moore FSMs are widely used in digital systems.

1.  Sequence detectors in serial communication
2.  Traffic light controllers
3.  Vending machines
4.  Digital locks
5.  Protocol controllers
6.  CPU control units
7.  UART communication systems

------------------------------------------------------------------------

# Advantages of Moore FSM

-   Stable outputs
-   Easy debugging
-   Predictable timing
-   Safe for synchronous designs

------------------------------------------------------------------------

# Limitations

-   More states compared to Mealy machines
-   One clock cycle output delay
-   Slightly larger hardware

------------------------------------------------------------------------

# Possible Improvements

-   Implement Mealy version to reduce state count

------------------------------------------------------------------------

# Summary

This project demonstrates how to design a **Moore FSM in Verilog** to
detect the sequence 1010.

Key concepts: - FSM design methodology - Moore vs Mealy differences -
Sequence detection - Verilog implementation
