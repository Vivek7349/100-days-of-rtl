# 220226-Johnson-Counter

## Overview

A **Johnson Counter**, also known as a **Twisted Ring Counter**, is a
shift register in which the inverted output of the last flip-flop is fed
back to the first flip-flop.

It is called a *twisted ring counter* because, unlike a normal ring
counter (direct feedback), the feedback path includes an inverter.

This design has been generalized to work as an **N-bit Johnson
Counter**, making it scalable and reusable for different widths.

------------------------------------------------------------------------

## Why Johnson Counter? (Advantages Over Ring Counter)

Even though both ring and Johnson counters use the same number of
flip-flops, the Johnson counter provides several structural advantages.

### 1. More States with Same Hardware

For N flip-flops:

-   Ring Counter → N states
-   Johnson Counter → 2 × N states

Example (4 flip-flops):

-   Ring Counter → 4 states
-   Johnson Counter → 8 states

This means the Johnson counter doubles the usable state space without
increasing hardware.

------------------------------------------------------------------------

### 2. Simpler Decoding Logic

In a ring counter:

-   Each state is one-hot
-   To detect certain multi-stage patterns, additional decoding logic
    may be required

In a Johnson counter:

-   States consist of contiguous 1s followed by contiguous 0s
-   Many states can be decoded using only **2-input AND gates**
-   No complex multi-level decoders are required

This reduces combinational logic depth and hardware complexity.

------------------------------------------------------------------------

### 3. Predictable Pattern Structure

Johnson counter produces structured patterns:

-   Increasing block of 1s
-   Then decreasing block of 1s

This makes it ideal for:

-   Non-overlapping timing generation
-   Control sequencing
-   Phase generation

------------------------------------------------------------------------

### 4. Better Utilization of Flip-Flops

With the same number of flip-flops:

-   Ring counter provides N states
-   Johnson counter provides 2 × N states

This improves hardware efficiency per flip-flop.

------------------------------------------------------------------------

### 5. Easy State Expansion

Increasing WIDTH:

-   Automatically increases total states (2 × WIDTH)
-   No change in feedback logic required
-   No additional decoding complexity

This makes it scalable for larger designs.

------------------------------------------------------------------------

### 6. Deterministic State Transitions

-   Structured transitions between states
-   Smooth propagation of 1s and 0s
-   Useful for glitch-sensitive control logic

------------------------------------------------------------------------

### 7. Minimal Additional Hardware

Compared to a ring counter:

-   Only one inverter is added in the feedback path
-   No extra flip-flops required
-   No increase in clock load

Hardware cost is nearly identical.

------------------------------------------------------------------------

## Comparison Summary

  Feature         Ring Counter       Johnson Counter
  --------------- ------------------ ------------------------
  Feedback        Direct MSB → LSB   Inverted MSB → LSB
  States          N                  2 × N
  Hardware Cost   N FFs              N FFs + 1 inverter
  Decoding        One-hot            Simple 2-input logic
  Scalability     Linear             Linear (double states)
  Efficiency      Moderate           High

------------------------------------------------------------------------

## Key Characteristics

-   Sequential logic structure
-   Shift register based
-   Single inverter in feedback
-   Single clock domain
-   Deterministic state transitions
-   Fully parameterized for N-bit operation

------------------------------------------------------------------------

## Applications

-   Sequence generation
-   Timing generation
-   LED pattern control
-   Phase generation
-   FSM implementation
-   Clock phase sequencing
-   Control signal generation

------------------------------------------------------------------------

## Learning Insights

Studying Johnson counters builds understanding of:

-   Feedback-based sequential systems
-   Structured state-space restriction
-   Hardware-efficient sequencing
-   Shift register dynamics
-   Counter design trade-offs

------------------------------------------------------------------------

**Project:** 100 Days RTL Design Challenge\
**Module Type:** Sequential Structured Counter\
**Implementation:** Parameterized N-bit Johnson Counter
