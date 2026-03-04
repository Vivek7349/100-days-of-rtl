# 040326-multiplier-4-bit

## Overview

A **4-bit multiplier** multiplies two 4-bit binary numbers and produces
an **8-bit result**.

If: - A = 4-bit input - B = 4-bit input

Then:

Result = A × B

Because the maximum value of a 4-bit number is **15**, the maximum
multiplication result is:

15 × 15 = 225

225 in binary requires **8 bits**, which is why the output width is 8
bits.

------------------------------------------------------------------------

# Binary Multiplication Concept

Binary multiplication works exactly like decimal multiplication but uses
only **0 and 1**.

Example:

A = 1011 (11)\
B = 0101 (5)

Binary multiplication:

      1011

  × 0101
  -----------------------
  1011 (A × B0)
  0000 (A × B1 shifted)
  1011 (A × B2 shifted)
  0000 (A × B3 shifted)

    110111

Result = 55

------------------------------------------------------------------------

# Partial Product Method

Multiplication is performed using **partial products**.

Each bit of B multiplies the entire number A.

Partial products:

P0 = A × B0\
P1 = A × B1\
P2 = A × B2\
P3 = A × B3

Then each product is **shifted** according to its position.

Final result:

M = P0 + (P1 \<\< 1) + (P2 \<\< 2) + (P3 \<\< 3)

------------------------------------------------------------------------

# Verilog Implementation

Example Verilog implementation:

``` verilog
module multiplier_4_bit (a, b, m);

input  [3:0] a;
input  [3:0] b;
output [7:0] m;

wire [3:0] m0, m1, m2, m3;

assign m0 = a & {4{b[0]}};
assign m1 = a & {4{b[1]}};
assign m2 = a & {4{b[2]}};
assign m3 = a & {4{b[3]}};

assign m = ({4'b0000,m0}) +
           ({3'b000,m1,1'b0}) +
           ({2'b00,m2,2'b00}) +
           ({1'b0,m3,3'b000});

endmodule
```

------------------------------------------------------------------------

# Hardware Representation

The multiplier hardware contains:

-   **16 AND gates** (for partial products)
-   **Adders** to combine results
-   **Shift wiring** to align partial products

Architecture:

A × B0 → Partial Product 0\
A × B1 → Shift left 1\
A × B2 → Shift left 2\
A × B3 → Shift left 3

All products are added together.

------------------------------------------------------------------------

# Types of Multipliers

Different multiplier architectures exist:

### Array Multiplier

Simple and easy to implement.

### Wallace Tree Multiplier

Reduces addition delay using parallel adders.

### Dadda Multiplier

Optimized for fewer adders.

### Booth Multiplier

Reduces number of partial products.

------------------------------------------------------------------------

# Applications

Multipliers are used in many digital systems:

-   Digital Signal Processing (DSP)
-   Image Processing
-   Microprocessors
-   Cryptography
-   Machine Learning accelerators
-   Communication systems

------------------------------------------------------------------------

# Advantages of 4-bit Multiplier Design

-   Simple architecture
-   Easy to understand
-   Good for learning digital design
-   Demonstrates shift-add multiplication

------------------------------------------------------------------------

# Simulation Test Cases

Example tests:

3 × 5 = 15\
7 × 9 = 63\
12 × 11 = 132\
15 × 15 = 225

These test cases help verify correct operation.

------------------------------------------------------------------------

# Conclusion

The 4-bit multiplier demonstrates the fundamental idea of **binary
multiplication using partial products and addition**.

Understanding this design helps in learning:

-   Digital arithmetic
-   RTL design
-   Hardware implementation of mathematical operations
