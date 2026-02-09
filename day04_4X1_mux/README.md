# 090226-day04-4X1-mux

## Overview
This project implements a **4x1 multiplexer** using Verilog HDL.  
A multiplexer selects **one of multiple input signals** and forwards it to a single output based on the value of select lines.

In a 4x1 MUX:
- There are **four data inputs**
- **Two select lines** determine which input is routed to the output

The design is written using **combinational RTL** with an `always @(*)` block, following industry-standard coding practices.

---

## Functional Description

### Inputs
- **d0** : Data input 0  
- **d1** : Data input 1  
- **d2** : Data input 2  
- **d3** : Data input 3  
- **sel[1:0]** : 2-bit select input  

### Output
- **y** : MUX output  

---

## Selection Logic

The output `y` depends on the value of `sel` as shown below:

| sel | Output |
|----|--------|
| 00 | d0 |
| 01 | d1 |
| 10 | d2 |
| 11 | d3 |

Only one input is selected at a time.

---

## RTL Design Details
- Fully combinational logic  
- Implemented using `always @(*)` block  
- Uses `case` statement for selection  
- Default assignment included to prevent latch inference  
- Synthesizable and simulation-safe  

### RTL File
- rtl/mux_4x1.v  

---

## Verification

The design is verified using a testbench that applies all possible combinations of select lines and input values.

The testbench ensures:
- Correct input selection for every `sel` value
- Output changes immediately with input or select changes
- No unintended latch behavior

### Testbench File
- tb/tb_mux_4x1.v  

---

## Example Simulation Behavior

- When `sel = 00`, output follows `d0`
- When `sel = 01`, output follows `d1`
- When `sel = 10`, output follows `d2`
- When `sel = 11`, output follows `d3`

Waveform inspection confirms correct 4x1 multiplexing behavior.

---

## Directory Structure
- rtl  
  - mux_4x1.v  
- tb  
  - tb_mux_4x1.v  
- sim  
- project (ignored by git)  
- README.md  

---

## Tools Used
- Verilog HDL  
- Intel Quartus Prime  
- ModelSim / QuestaSim  

---

## Status
- RTL Design: Completed  
- Testbench: Completed  
- Simulation: Verified  

---

## Notes
- The design can be extended to wider data buses by parameterization.
- This 4x1 MUX forms a basic building block for datapaths, ALUs, and control logic.
