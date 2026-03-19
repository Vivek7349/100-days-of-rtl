# 190326-single-port-ram

## Overview

A **Single Port RAM** is a memory module that allows **one operation at
a time** (either read or write) using a single access port.

It is widely used in FPGA and ASIC designs for buffering, temporary
storage, and data handling.

------------------------------------------------------------------------

# What is RAM?

**RAM (Random Access Memory)** allows: - Access to any memory location
directly - Constant access time - Both read and write operations

------------------------------------------------------------------------

# Single Port RAM Concept

A Single Port RAM includes: - One address bus - One data input - One
data output - One clock - One write enable signal

Only one operation is possible per clock cycle: - Read OR Write

------------------------------------------------------------------------

# Key Signals

  Signal   Description
  -------- --------------
  clk      Clock signal
  we       Write enable
  addr     Address
  din      Data input
  dout     Data output

------------------------------------------------------------------------

# Operation

## Write Operation

When: we = 1

memory\[addr\] \<= din

## Read Operation

When: we = 0

dout \<= memory\[addr\]

------------------------------------------------------------------------

# Verilog Implementation

``` verilog
module single_port_ram #(parameter DATA_WIDTH = 8, ADDR_WIDTH = 4)
(
    input clk,
    input we,
    input [ADDR_WIDTH-1:0] addr,
    input [DATA_WIDTH-1:0] din,
    output reg [DATA_WIDTH-1:0] dout
);

reg [DATA_WIDTH-1:0] memory [0:(1<<ADDR_WIDTH)-1];

always @(posedge clk) begin
    if (we)
        memory[addr] <= din;
    else
        dout <= memory[addr];
end

endmodule
```

------------------------------------------------------------------------

# How It Works

1.  Memory is modeled as an array.
2.  Address selects memory location.
3.  Write occurs when `we = 1`.
4.  Read occurs when `we = 0`.
5.  All operations are clock synchronized.

------------------------------------------------------------------------

# Applications

### 1. Data Buffers

Temporary storage in pipelines.

### 2. Embedded Systems

Used in microcontrollers and FPGA designs.

### 3. Cache Memory

Small on-chip storage.

### 4. FIFOs

Data streaming systems.

### 5. DSP Systems

Signal storage and processing.

### 6. Communication Systems

Packet buffering.

------------------------------------------------------------------------

# Advantages

-   Simple design
-   Low resource usage
-   Easy to implement
-   Good for small memory needs

------------------------------------------------------------------------

# Limitations

-   Cannot read and write simultaneously
-   Limited throughput
-   Not suitable for high-speed parallel access

------------------------------------------------------------------------

# Possible Improvements

-   Dual-port RAM design
-   Add byte enable
-   Add initialization logic
-   Pipeline the design

------------------------------------------------------------------------

# Summary

Single Port RAM is a fundamental memory block in digital design.

Key points: - One operation per cycle - Easy Verilog implementation -
Widely used in FPGA and ASIC systems
