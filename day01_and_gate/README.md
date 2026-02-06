# 040226-day01-and-gate

## Overview
This project implements and verifies a **2-input AND gate** using Verilog HDL.
The AND gate is a fundamental **combinational logic circuit** widely used in
digital systems for control logic, masking, and logical decision-making.

---

## Functional Description
An AND gate produces a logic HIGH (`1`) output **only when all inputs are HIGH**.
If any input is LOW (`0`), the output will be LOW.

Logical expression:
Y = A · B

---

## Truth Table

| A | B | Y |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

---

## RTL Design Details
- Implemented using **pure combinational logic**
- No clock, no delays, no sequential elements
- Written using **synthesizable Verilog**
- Continuous assignment is used for logic realization

**RTL File**
- `rtl/and_gate.v`

---

## Verification Strategy
- A **self-checking exhaustive testbench** is used
- All possible input combinations (00, 01, 10, 11) are applied
- Output is monitored for correctness
- Simulation terminates using `$finish`

**Testbench File**
- `tb/tb_and_gate.v`

---

## Directory Structure
day01_and_gate/
├── rtl/
│   └── and_gate.v
├── tb/
│   └── tb_and_gate.v
├── sim/
└── README.md

---
