# 140326-mux-n-to-1

## Overview

A **Multiplexer (MUX)** is a combinational digital circuit that selects
one of several input signals and forwards the selected input to a single
output line.

A multiplexer works like a **digital switch** controlled by select
lines.

This project demonstrates a **parameterized N‑to‑1 multiplexer
implemented in Verilog HDL**.

------------------------------------------------------------------------

# What is a Multiplexer?

A multiplexer selects **one input out of many inputs** based on the
value of **select lines**.

If a multiplexer has:

-   **N inputs**
-   **log₂(N) select lines**
-   **1 output**

Then the select lines determine which input appears at the output.

------------------------------------------------------------------------

# Example: 4‑to‑1 Multiplexer

Inputs:

I0 I1 I2 I3

Select lines:

S1 S0

Output:

Y

### Truth Table

  S1   S0   Output
  ---- ---- --------
  0    0    I0
  0    1    I1
  1    0    I2
  1    1    I3

------------------------------------------------------------------------

# Mathematical Representation

For a 4‑to‑1 multiplexer:

Y = I0·S1'·S0' + I1·S1'·S0 + I2·S1·S0' + I3·S1·S0

------------------------------------------------------------------------

# Parameterized Multiplexer Concept

Instead of writing separate modules for:

-   2:1 mux
-   4:1 mux
-   8:1 mux
-   16:1 mux

We design **one reusable module** using parameters.

The number of select bits is:

log₂(N)

In Verilog this is calculated using:

\$clog2(N)

------------------------------------------------------------------------

# Verilog Design

``` verilog
module mux_n_to_1 #(parameter N = 4)
(
    input  [N-1:0] in,
    input  [$clog2(N)-1:0] sel,
    output out
);

assign out = in[sel];

endmodule
```

------------------------------------------------------------------------

# How the Design Works

### Input Vector

    in[N-1:0]

This contains all multiplexer inputs.

### Select Lines

    sel

The select value determines which input is routed to the output.

### Output

    out = in[sel]

Example:

If

    in = 1010
    sel = 2

Then

    out = in[2] = 0

------------------------------------------------------------------------

# Advantages of Parameterized Design

1.  Reusable hardware block
2.  Easily scalable
3.  Cleaner code
4.  Less duplication
5.  Flexible for different input sizes

------------------------------------------------------------------------

# Applications of Multiplexers

Multiplexers are widely used in digital systems.

### 1. CPU Datapaths

Used to select ALU inputs and register outputs.

### 2. Memory Systems

Used for selecting memory addresses and data sources.

### 3. Communication Systems

Used to combine multiple signals onto one channel.

### 4. Digital Signal Processing

Used to route signals between processing blocks.

### 5. Bus Switching

Allows multiple devices to share a communication bus.

### 6. FPGA Logic Routing

MUX structures are heavily used inside FPGA routing fabrics.

------------------------------------------------------------------------

# Hardware Implementation

Large multiplexers are typically implemented using a **tree structure of
smaller multiplexers**.

Example: 8‑to‑1 mux

Stage 1 → four 2:1 mux\
Stage 2 → two 2:1 mux\
Stage 3 → one 2:1 mux

This reduces propagation delay and improves timing.

------------------------------------------------------------------------

# Limitations

1.  Delay increases with the number of inputs.
2.  Large multiplexers consume more hardware resources.
3.  Very large mux trees may increase power consumption.

------------------------------------------------------------------------

# Summary

A **Multiplexer (MUX)** is a key combinational building block used to
select one signal from many inputs.

Key concepts:

-   Uses select lines to control routing
-   Fundamental component in digital systems
-   Easy to implement in Verilog using vector indexing
-   Parameterized designs make hardware reusable

Multiplexers are essential components in **processors, memory systems,
communication devices, and FPGA designs**.
