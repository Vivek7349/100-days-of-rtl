# 050326-alu-8bit

## Overview

This project implements a **combinational 8‑bit Arithmetic Logic Unit
(ALU)** written in Verilog.\
The ALU performs arithmetic, logical, and shift operations based on a
3‑bit operation code.

The design also generates basic **status flags** used in digital
processors.

------------------------------------------------------------------------

# ALU Features

-   8‑bit operands
-   8 operations
-   Carry flag
-   Zero flag
-   Synthesizable RTL design
-   Compatible with FPGA tools like Quartus / Vivado

------------------------------------------------------------------------

# Supported Operations

  Opcode   Operation     Description
  -------- ------------- -----------------------------
  000      ADD           Addition of A and B
  001      SUB           Subtraction A − B
  010      AND           Bitwise AND
  011      OR            Bitwise OR
  100      XOR           Bitwise XOR
  101      NOT           Bitwise NOT of A
  110      SHIFT LEFT    A shifted left by B\[2:0\]
  111      SHIFT RIGHT   A shifted right by B\[2:0\]

------------------------------------------------------------------------

# ALU Inputs

  Signal   Width   Description
  -------- ------- --------------------
  a        8 bit   Operand A
  b        8 bit   Operand B
  op       3 bit   Operation selector

------------------------------------------------------------------------

# ALU Outputs

  Signal   Width   Description
  -------- ------- ---------------------------------
  x        8 bit   Result of operation
  carry    1 bit   Carry from arithmetic operation
  zero     1 bit   High when result is zero

------------------------------------------------------------------------

# Verilog Implementation

``` verilog
module alu_8bit (a, b, x, op, carry, zero);

input [7:0] a;
input [7:0] b;
input [2:0] op;

output reg [7:0] x;
output reg carry;
output zero;

parameter ad_op  = 3'b000,
          sub_op = 3'b001,
          and_op = 3'b010,
          or_op  = 3'b011,
          xor_op = 3'b100,
          not_op = 3'b101,
          ls_op  = 3'b110,
          rs_op  = 3'b111;

always @(*) begin
    x = 8'd0;
    carry = 1'b0;

    case (op)

        ad_op  : {carry,x} = a + b;
        sub_op : {carry,x} = a + (~b + 1);
        and_op : x = a & b;
        or_op  : x = a | b;
        xor_op : x = a ^ b;
        not_op : x = ~a;
        ls_op  : x = a << b[2:0];
        rs_op  : x = a >> b[2:0];

        default: x = 8'd0;

    endcase
end

assign zero = (x == 8'd0);

endmodule
```

------------------------------------------------------------------------

# Hardware Architecture

Internally the ALU consists of multiple functional blocks:

    ADD
    SUB
    AND
    OR
    XOR
    NOT
    SHIFT LEFT
    SHIFT RIGHT
          │
          ▼
       8‑to‑1 Multiplexer
          │
          ▼
         Result

The operation selector (`op`) controls which block output reaches the
final result.

------------------------------------------------------------------------

# Flags

## Carry Flag

Generated from arithmetic operations.

Example:

    11111111 + 00000001
    -------------------
    1 00000000

Carry = 1

------------------------------------------------------------------------

## Zero Flag

    zero = 1 when result = 0

Example:

    5 - 5 = 0

------------------------------------------------------------------------

# Testbench

A Verilog testbench is used to verify functionality.

Example operations tested:

-   Addition
-   Subtraction
-   Logical operations
-   Bit shifting

Simulation verifies:

-   Correct result
-   Carry generation
-   Zero detection

------------------------------------------------------------------------

# Example Simulation Output

    a=00001010 b=00000101 op=000 x=00001111 carry=0 zero=0
    a=00001010 b=00000101 op=001 x=00000101 carry=0 zero=0
    a=10101010 b=11001100 op=010 x=10001000 carry=0 zero=0
    a=10101010 b=11001100 op=011 x=11101110 carry=0 zero=0

------------------------------------------------------------------------

# Applications

ALUs are fundamental components used in:

-   CPUs
-   Microcontrollers
-   Digital signal processors
-   FPGA designs
-   Arithmetic accelerators

------------------------------------------------------------------------

# Possible Improvements

Future enhancements may include:

-   Overflow flag
-   Comparison operations
-   Pipeline registers
-   Support for multiplication or division

------------------------------------------------------------------------

# Author

Verilog ALU design for digital logic learning and experimentation.
