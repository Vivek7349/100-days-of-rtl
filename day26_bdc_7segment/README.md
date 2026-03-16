# 160326-bcd-7segment

## Overview

A **7-segment display** is a commonly used electronic display device for
showing decimal numbers (0--9).\
It is widely used in digital clocks, calculators, meters, and embedded
systems.

A 7-segment display consists of **seven LED segments** arranged to form
digits. By turning ON or OFF different segments, numbers can be
displayed.

This project implements a **BCD (Binary Coded Decimal) to 7‑Segment
Decoder using Verilog HDL**.

------------------------------------------------------------------------

# Structure of a 7-Segment Display

The display contains seven LED segments labeled:

       a
    f     b
       g
    e     c
       d

Each segment is an LED. Turning on specific segments forms digits.

Example:

  Digit   Segments ON
  ------- ---------------
  0       a b c d e f
  1       b c
  2       a b d e g
  3       a b c d g
  4       b c f g
  5       a c d f g
  6       a c d e f g
  7       a b c
  8       a b c d e f g
  9       a b c d f g

------------------------------------------------------------------------

# Types of 7-Segment Displays

## Common Cathode

-   All cathodes connected together
-   Segment turns ON when logic **1** is applied

## Common Anode

-   All anodes connected together
-   Segment turns ON when logic **0** is applied

------------------------------------------------------------------------

# BCD to 7-Segment Decoder

A **BCD to 7‑segment decoder** converts a **4‑bit BCD input** into seven
signals that control the display segments.

Input:

    4-bit BCD number

Output:

    7-bit signal controlling segments a–g

Example mapping:

  BCD    Decimal   Output
  ------ --------- ---------
  0000   0         1111110
  0001   1         0110000
  0010   2         1101101
  0011   3         1111001
  0100   4         0110011
  0101   5         1011011
  0110   6         1011111
  0111   7         1110000
  1000   8         1111111
  1001   9         1111011

------------------------------------------------------------------------

# Verilog Implementation

``` verilog
module bcd_7segment (in, out, reset);

input [3:0] in;
input reset;
output reg [6:0] out;

always @(*) begin
    if(reset)
        out = 7'b1111111;
    else begin
        case(in)
            4'b0000 : out = 7'b1111110;
            4'b0001 : out = 7'b0110000;
            4'b0010 : out = 7'b1101101;
            4'b0011 : out = 7'b1111001;
            4'b0100 : out = 7'b0110011;
            4'b0101 : out = 7'b1011011;
            4'b0110 : out = 7'b1011111;
            4'b0111 : out = 7'b1110000;
            4'b1000 : out = 7'b1111111;
            4'b1001 : out = 7'b1111011;
            default : out = 7'b1111111;
        endcase
    end
end

endmodule
```

------------------------------------------------------------------------

# Applications of 7-Segment Displays

1.  Digital clocks\
2.  Calculators\
3.  Electronic meters (voltmeter, ammeter)\
4.  Industrial control panels\
5.  Elevator floor indicators\
6.  Embedded system interfaces\
7.  Counters and timers

------------------------------------------------------------------------

# Advantages

-   Low cost
-   Easy to interface with digital circuits
-   Good visibility for numbers
-   Low power consumption

------------------------------------------------------------------------

# Limitations

-   Limited character display
-   Not suitable for complex graphics
-   Requires multiple control pins

------------------------------------------------------------------------

# Possible Improvements

Future extensions for this design:

-   Support hexadecimal characters (A--F)
-   Multi‑digit multiplexed display
-   Integration with BCD counters
-   FPGA based display controller

------------------------------------------------------------------------

# Summary

A **7‑segment display** is a simple and effective way to display numeric
information in digital systems.

This project demonstrates: - BCD to 7‑segment decoding - Combinational
logic design using Verilog - Practical interfacing with display hardware
