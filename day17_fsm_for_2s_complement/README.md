# 030326-fsm-for-serial-2s-complement

## Overview

This project implements a Finite State Machine (FSM) in Verilog to
compute the **2's complement** of a binary number serially.

The FSM processes one bit at a time (LSB first) and generates the 2's
complement output in a sequential manner.

------------------------------------------------------------------------

## Concept: What is 2's Complement?

2's complement is a method used to represent negative numbers in binary.

To find the 2's complement of a binary number:

1.  Take the 1's complement (invert all bits)
2.  Add 1 to the result

Example:

Binary: `0011`\
1's complement: `1100`\
Add 1: `1101`

So, 2's complement of `0011` is `1101`.

------------------------------------------------------------------------

## Why Use FSM for 2's Complement?

When computing serially (bit-by-bit), we observe:

-   Copy bits as they are until the first `1` is encountered.
-   After the first `1`, invert all remaining bits.

This behavior can be modeled using two states:

-   **S0** → First `1` not yet detected
-   **S1** → First `1` detected, invert remaining bits

------------------------------------------------------------------------

## FSM States

### State S0

-   If input = 0 → output = 0 (stay in S0)
-   If input = 1 → output = 1 (move to S1)

### State S1

-   Output = NOT(input)
-   Stay in S1

------------------------------------------------------------------------

## Verilog Design Strategy

-   One flip-flop stores the present state.
-   Output logic depends on state and input.
-   Synchronous reset initializes state to S0.
-   Sequential logic updates state at every clock edge.

------------------------------------------------------------------------

## Testbench Behavior

If input sequence is: `0011` (LSB first)

Clock-wise operation:

  Clock   Input   State   Output
  ------- ------- ------- --------
  1       0       S0      0
  2       0       S0      0
  3       1       S0→S1   1
  4       1       S1      0

Output becomes: `1101` (correct 2's complement)

------------------------------------------------------------------------

## Applications

-   Binary subtraction using adders
-   ALU design
-   Signed number representation
-   Digital signal processing
-   Microprocessor arithmetic units

------------------------------------------------------------------------

## Key Learning Points

-   Understand difference between combinational and sequential logic
-   Learn state transition modeling
-   Understand serial arithmetic processing
-   Master synchronous reset behavior

------------------------------------------------------------------------

## How to Simulate

1.  Compile the Verilog file in ModelSim/QuestaSim/Quartus.
2.  Add the testbench.
3.  Apply clock and reset.
4.  Provide serial input.
5.  Observe waveform.

------------------------------------------------------------------------

## File Structure

-   `fsm_for_2s_complement.v`
-   `testbench.v`
-   `README.md`

------------------------------------------------------------------------

## Final Thought

This design teaches how arithmetic behavior can be translated into
state-based hardware implementation.

Once you master this, you are thinking like a hardware architect --- not
just writing code.
