# Ring Counter (Day 09 -- 100 Days RTL Challenge)

## Overview

A Ring Counter is a shift register in which the output of the last
flip-flop is fed back directly to the first flip-flop.

This implementation is parameterized and designed for N-bit operation.
It is initialized in a one-hot state during reset.

------------------------------------------------------------------------

## Architecture

Structure:

    +---------------------------------------+
    |                                       |
    v                                       |

\[FF0\] → \[FF1\] → \[FF2\] → ... → \[FF(N-1)\] --+ (feedback without
inversion)

-   One-hot state rotates on every clock edge
-   Only one flip-flop is HIGH at any time

------------------------------------------------------------------------

## Truth Table (Example WIDTH = 4)

Assuming reset initializes to 0001:

  Clock Cycle   Output (count)
  ------------- ----------------
  0 (Reset)     0001
  1             1000
  2             0100
  3             0010
  4             0001

This pattern repeats continuously.

------------------------------------------------------------------------

## Number of States

For N flip-flops:

Number of States = N

Example: - WIDTH = 4 → 4 states - WIDTH = 8 → 8 states

------------------------------------------------------------------------

## Output Frequency

Each output bit goes HIGH once every N clock cycles.

If input clock frequency = f_clk

Then:

Output frequency per bit = f_clk / N

Example: If f_clk = 100 MHz and WIDTH = 4

Each output pulse repeats every 4 cycles.

------------------------------------------------------------------------

## Duty Cycle

Each output bit:

-   HIGH for 1 clock cycle
-   LOW for (N - 1) cycles

Duty Cycle = 1 / N

Example: WIDTH = 4 → 25%\
WIDTH = 8 → 12.5%

------------------------------------------------------------------------

## Scheduling Tasks Using Output Pins (No Extra Hardware)

Since each output is one-hot and non-overlapping:

-   Each output pin can directly enable a specific task
-   No decoder required
-   No additional combinational logic needed

Example:

out\[0\] → Task 0 enable\
out\[1\] → Task 1 enable\
out\[2\] → Task 2 enable\
out\[3\] → Task 3 enable

Each task executes in its dedicated clock slot.

Ideal for:

-   Time-division multiplexing
-   Sequential control operations
-   Multi-phase control signals
-   Simple state machine replacement

------------------------------------------------------------------------

## Advantages

-   Simple hardware structure
-   Easy state decoding (one-hot)
-   Deterministic behavior
-   Minimal combinational logic
-   Glitch-free state transitions
-   Direct task scheduling capability

------------------------------------------------------------------------

## Limitations

-   Limited number of states (N only)
-   Requires proper one-hot reset
-   Cannot generate all binary combinations
-   Less state-efficient compared to Johnson counter

------------------------------------------------------------------------

## Design Considerations

-   Reset must initialize exactly one bit to HIGH
-   If reset initializes to all zeros, counter will stall
-   Use non-blocking assignments for sequential logic
-   Maintain single clock domain design

------------------------------------------------------------------------

## Applications

-   LED running patterns
-   Phase generation
-   Task scheduling
-   Pipeline stage enable signals
-   Simple FSM implementations
-   Clock slot control logic

------------------------------------------------------------------------

## Learning Outcomes

-   One-hot state machine concept
-   Sequential shift register design
-   Frequency division understanding
-   Hardware-efficient scheduling
-   Comparison with Johnson counter

------------------------------------------------------------------------

**Project:** 100 Days RTL Design Challenge\
**Day:** 09\
**Module Type:** Sequential Structured Counter\
**Implementation:** Parameterized N-bit Ring Counter
