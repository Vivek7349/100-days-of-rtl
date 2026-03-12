# 120326-bcd-adder

## Overview

A **BCD Adder** is a digital circuit that adds two decimal digits
represented in **Binary Coded Decimal (BCD)** format. Each decimal digit
(0--9) is encoded using a 4‑bit binary number.

Since valid BCD values range only from **0000 (0) to 1001 (9)**, any
binary result greater than 9 must be corrected. The correction is done
by **adding 6 (0110)** to the intermediate sum.

This repository contains a simple Verilog implementation of a
**single-digit BCD adder**.

------------------------------------------------------------------------

## BCD Number Representation

  Decimal   BCD
  --------- ------
  0         0000
  1         0001
  2         0010
  3         0011
  4         0100
  5         0101
  6         0110
  7         0111
  8         1000
  9         1001

Values **1010--1111 are invalid in BCD**.

------------------------------------------------------------------------

# Verilog Design

## Module Code

``` verilog
module bcd_adder (x, y, c, sum);
    input [3:0]x;
    input [3:0]y;
    output reg c;
    output reg [3:0]sum;

    reg [4:0] temp;

    always @(*) begin 
        temp = x + y;

        if(temp > 9) begin 
            {c,sum}=temp + 5'b00110;
        end
        else
            {c,sum}=temp;
    end
endmodule
```

------------------------------------------------------------------------

# How the Circuit Works

### Step 1: Binary Addition

The inputs `x` and `y` are first added as normal binary numbers.

    temp = x + y

The result is stored in a **5-bit register (`temp`)** to accommodate
carry.

------------------------------------------------------------------------

### Step 2: Check for Invalid BCD Result

If the result is **greater than 9**, it is not a valid BCD number.

Example:

    7 + 8 = 15 (1111)

This must be corrected.

------------------------------------------------------------------------

### Step 3: BCD Correction

If the sum is greater than 9:

    Add 6 (0110)

This converts the result into a valid BCD format.

Example:

    1111 + 0110 = 1 0101

Result: - Carry = 1 - Sum = 0101 (5)

Which correctly represents **15 in BCD**.

------------------------------------------------------------------------

# Truth Table Example

  X   Y   Binary Sum   Correction   BCD Output   Carry
  --- --- ------------ ------------ ------------ -------
  3   4   7            No           7            0
  5   6   11           Yes          1 0001       1
  8   7   15           Yes          1 0101       1

------------------------------------------------------------------------

# Hardware Blocks Used

A BCD Adder internally consists of:

1.  **4-bit Binary Adder**
2.  **Comparator (sum \> 9 detection)**
3.  **Correction Logic**
4.  **Second Adder (adds 6 when needed)**

------------------------------------------------------------------------

# Applications of BCD Adders

### 1. Digital Calculators

Used to perform decimal arithmetic operations.

### 2. Digital Clocks

Time digits are stored in BCD format.

### 3. Financial Systems

Banking systems require **exact decimal representation**.

### 4. Seven Segment Displays

Most display drivers expect BCD input.

### 5. Embedded Systems

Used when decimal numbers must be processed without conversion errors.

### 6. Microprocessor Arithmetic Units

Older processors used BCD arithmetic instructions.

------------------------------------------------------------------------

# Advantages of BCD Arithmetic

-   Exact decimal representation
-   No rounding errors in financial calculations
-   Easy conversion to human-readable numbers

------------------------------------------------------------------------

# Limitations

-   Requires more hardware than pure binary arithmetic
-   Less efficient in terms of storage
-   Slower compared to binary adders

------------------------------------------------------------------------

# Multi-Digit BCD Addition Concept

For numbers with multiple digits:

    Digit0 → Digit1 → Digit2 → Digit3

Carry propagates to the next stage just like ripple carry adders.

------------------------------------------------------------------------

# Simulation Tips

Test with cases such as:

    4 + 3
    8 + 7
    9 + 9
    5 + 5

Check that: - Sum remains valid BCD - Carry is generated correctly

------------------------------------------------------------------------

# Summary

A **BCD Adder** is a specialized adder used to add decimal digits
encoded in BCD format. The design works by:

1.  Performing binary addition
2.  Detecting invalid BCD results (\>9)
3.  Correcting the result by adding **6**

This ensures the final output always remains a valid decimal
representation.

------------------------------------------------------------------------

# Author

Designed using **Verilog HDL**
