# 210226-clock-divider

## Overview

This module implements a **4-bit synchronous binary counter** and
exposes individual counter bits as frequency-divided outputs.

⚠ Important: This implementation generates divided clock signals using
counter bit taps. In professional FPGA/ASIC design, these signals should
NOT be used as clock sources for other modules. Prefer clock enable
signals or dedicated clock management resources (PLL/MMCM).

------------------------------------------------------------------------

## Architecture

Block-level structure:

    +-------+

Clk →\| \| Rst →\|Counter\|→ count\[3:0\] → Bit Taps → Divided Outputs
+-------+

-   Counter increments on every rising clock edge
-   Each successive bit divides frequency by 2

------------------------------------------------------------------------

## RTL Implementation

``` verilog
module clock_divider (
    input  wire Clk,
    input  wire Rst,
    output wire clk_divby2,
    output wire clk_divby4,
    output wire clk_divby8,
    output wire clk_divby16
);

    reg [3:0] count;

    always @(posedge Clk) begin
        if (Rst)
            count <= 4'd0;
        else
            count <= count + 4'd1;
    end

    assign clk_divby2  = count[0];
    assign clk_divby4  = count[1];
    assign clk_divby8  = count[2];
    assign clk_divby16 = count[3];

endmodule
```

------------------------------------------------------------------------

## Frequency Behavior

If input clock = 100 MHz:

  Output        Frequency
  ------------- -----------
  clk_divby2    50 MHz
  clk_divby4    25 MHz
  clk_divby8    12.5 MHz
  clk_divby16   6.25 MHz

Each stage naturally maintains \~50% duty cycle due to binary counter
behavior.

------------------------------------------------------------------------

## Reset Behavior

-   Synchronous reset
-   On reset assertion:
    -   Counter = 0
    -   All divided outputs = 0

------------------------------------------------------------------------

## Clock Domain Warning

Using `clk_divbyX` as clock inputs for other modules creates:

-   Multiple clock domains
-   Clock skew risk
-   Complex timing constraints
-   Potential metastability

Professional designs should:

-   Use clock enable pulses
-   Use PLL/MMCM for clock division
-   Maintain single clock domain when possible

------------------------------------------------------------------------

## Learning Outcomes

-   Binary counter design
-   Frequency division using flip-flops
-   Synchronous reset handling
-   Understanding derived clock risks
-   Introduction to clock-domain discipline

------------------------------------------------------------------------

## Repository Structure

    day07_clock_divider/
    │
    ├── rtl/
    │   └── clock_divider.v
    ├── tb/
    │   └── tb_clock_divider.v
    ├── sim/
    │   └── waveform_screenshot.png
    └── README.md

------------------------------------------------------------------------

**Project:** 100 Days RTL Design Challenge\
**Day:** 07\
