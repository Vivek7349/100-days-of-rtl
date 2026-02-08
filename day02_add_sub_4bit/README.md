# 070226-day02-add-sub-4bit

## Overview
This project implements a **4-bit adder–subtractor circuit** using Verilog HDL.  
The circuit performs either addition or subtraction on two 4-bit unsigned numbers depending on a control signal.

- **Addition**: a + b  
- **Subtraction**: a − b (using two’s complement)

The design uses a ripple-carry architecture built from full adders.

---

## Functional Description

### Inputs
- **a[3:0]** : 4-bit input operand A  
- **b[3:0]** : 4-bit input operand B  
- **mode** : Operation select  
  - mode = 0 → Addition  
  - mode = 1 → Subtraction  

### Outputs
- **sum[3:0]** : 4-bit result  
- **cout** : Carry-out / No-borrow flag  

---

## Working Principle

### Addition
When `mode = 0`, the circuit performs standard binary addition of inputs **a** and **b**.

### Subtraction
When `mode = 1`, subtraction is implemented using **two’s complement arithmetic**.

a − b is computed as a + (~b + 1)

This is achieved by:
- XOR-ing each bit of **b** with the `mode` signal  
- Applying `mode` as the initial carry-in  

---

## RTL Design Details
- Fully combinational design  
- Ripple-carry architecture  
- Implemented using four full adders  
- Synthesizable RTL (no delays or behavioral constructs)  

### RTL Files
- rtl/full_adder.v  
- rtl/add_sub_4bit.v  

---

## Verification

A simple sanity testbench is used to verify the functionality of the design.

### Test Cases
- **Addition**: 1 + 1 = 2  
- **Subtraction**: 1 − 1 = 0  

The testbench uses:
- `$monitor` for real-time signal observation  
- `$finish` to terminate the simulation  

### Testbench File
- tb/tb_add_sub_4bit_simple.v  

---

## Example Simulation Output
TIME=0   mode=0 a=0001 b=0001 sum=0010 cout=0  
TIME=10  mode=1 a=0001 b=0001 sum=0000 cout=1  

In subtraction mode, `cout = 1` indicates **no borrow** for unsigned subtraction.

---

## Directory Structure
- rtl  
  - full_adder.v  
  - add_sub_4bit.v  
- tb  
  - tb_add_sub_4bit_simple.v  
- sim  
- project (ignored by git)  
- README.md  

---

## Tools Used
- Verilog HDL  
- Intel Quartus Prime  
- ModelSim / Icarus Verilog  

---

## Status
- RTL: Completed  
- Testbench: Completed  
- Simulation: Verified  
