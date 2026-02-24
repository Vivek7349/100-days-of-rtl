# 240226-majority-ckt

## Overview

The Majority Circuit outputs HIGH when the majority of its inputs are
HIGH.

For a 3-input majority circuit:

Output = 1 when at least two inputs are 1.

This project includes:

-   RTL implementation of Majority Circuit
-   Complete testbench verification
-   Exhaustive input testing
-   Clean modular structure

------------------------------------------------------------------------

## Logic Definition

For inputs A, B, C:

Output = 1 if:

-   A and B are HIGH
-   B and C are HIGH
-   A and C are HIGH

Boolean Expression:

    Y = AB + BC + AC

This is also called a voting logic circuit.

------------------------------------------------------------------------

## Truth Table

  A   B   C   Y
  --- --- --- ---
  0   0   0   0
  0   0   1   0
  0   1   0   0
  0   1   1   1
  1   0   0   0
  1   0   1   1
  1   1   0   1
  1   1   1   1

Output is HIGH when two or more inputs are HIGH.

------------------------------------------------------------------------

## Hardware Structure

The majority function can be implemented using:

-   Three 2-input AND gates
-   One 3-input OR gate

Synthesis tools may further optimize the structure.

------------------------------------------------------------------------

## Key Characteristics

-   Pure combinational logic
-   No clock required
-   No memory elements
-   Fully synthesizable
-   Deterministic output

------------------------------------------------------------------------

## Advantages

### 1. Fault Tolerance (Voting Systems)

Used in:

-   Triple Modular Redundancy (TMR)
-   Safety-critical systems
-   Error correction voting

If one input fails, correct output can still be determined.

------------------------------------------------------------------------

### 2. Minimal Logic Depth

Only two logic levels:

-   AND stage
-   OR stage

Provides low propagation delay and fast response.

------------------------------------------------------------------------

### 3. Symmetry

All inputs have equal priority. No weighted dependency.

------------------------------------------------------------------------

### 4. Hardware Efficient

Requires only basic gates. Area efficient in FPGA/ASIC implementation.

------------------------------------------------------------------------

### 5. Useful in Control Systems

Applications include:

-   Arbitration logic
-   Sensor fusion systems
-   Voting mechanisms
-   Distributed control systems
-   Decision logic blocks

------------------------------------------------------------------------

### 6. Scalable Concept

The majority concept can be extended to:

-   5-input majority
-   N-input voting systems

Useful in redundant hardware architectures.

------------------------------------------------------------------------

## Design Considerations

-   Ensure stable inputs before sampling
-   Avoid glitches in high-speed combinational paths
-   Use full testbench coverage

------------------------------------------------------------------------

## Applications

-   Triple Modular Redundancy (TMR)
-   Digital decision circuits
-   Safety systems
-   Fault-tolerant processors
-   Sensor validation logic

------------------------------------------------------------------------

## Learning Outcomes

-   Combinational Boolean design
-   Majority logic simplification
-   Fault-tolerant design principles
-   Efficient decision logic implementation

------------------------------------------------------------------------

**Project:** 100 Days RTL Design Challenge\
**Day:** 10\
**Module Type:** Combinational Logic\
**Design Level:** Fundamental Decision Logic Block
