
# 090326-mod-n-down-counter

## Overview
A **Mod-N Down Counter** is a digital counter that counts **downwards from N-1 to 0** and then wraps back to **N-1**.  
This process repeats continuously with every clock cycle.

In this design:

- The counter **starts from N-1**
- Counts down to **0**
- When it reaches **0**, it **reloads N-1**
- Uses **$clog2(N)** to automatically determine the register width

This makes the counter **parameterized and scalable**.

---

# Design Parameters

The counter uses the following parameters:

| Parameter | Description |
|-----------|-------------|
| N | Number of counter states |
| count | Initial value (N-1) |
| len | Register width calculated using $clog2(N) |

Example:

If `N = 8`

count = 7  
len = $clog2(8) = 3  

The counter sequence becomes:

7 → 6 → 5 → 4 → 3 → 2 → 1 → 0 → 7 → ...

---

# Verilog Implementation (Your Design)

```verilog
module mod_n_down_counter (clk, reset, out);

parameter N = 3;
parameter count = N-1;
parameter len = $clog2(N);

input clk;
input reset;
output reg [len-1:0] out;

always @(posedge clk) begin
    if(reset)
        out <= count;
    else if (out == 0)
        out <= count;
    else
        out <= out - 1;
end

endmodule
```

---

# How the Counter Works

1. **Reset Condition**
   - When `reset = 1`, the counter loads **N-1**.

2. **Counting Operation**
   - On each **positive clock edge**, the counter decrements.

3. **Wrap Condition**
   - When the counter reaches **0**, the next clock cycle reloads **N-1**.

---

# Example Operation

Example for `N = 5`

Clock Cycle | Counter Output
------------|---------------
1 | 4
2 | 3
3 | 2
4 | 1
5 | 0
6 | 4
7 | 3

Sequence repeats continuously.

---

# Hardware Interpretation

This counter synthesizes into:

• Flip-flops (to store the count value)  
• Comparator (to detect zero)  
• Subtractor logic (for decrement operation)  

Structure:

Clock → Register → Subtractor → Comparator → Reload Logic

---

# Applications of Mod-N Down Counters

## 1. Frequency Division
Counters can divide clock frequencies in digital circuits.

Example:
- Mod-2 → divide by 2
- Mod-10 → decimal counters

---

## 2. Digital Timers

Used in:

• countdown timers  
• watchdog timers  
• delay generators  

---

## 3. State Sequencing
Down counters generate **reverse state sequences** for control logic.

---

## 4. Address Generation
Used for:

• circular buffers  
• memory traversal  
• stack pointer logic  

---

## 5. PWM Controllers
Counters help generate **pulse width modulation signals**.

---

# Advantages of This Design

✔ Parameterized design  
✔ Automatic register sizing using `$clog2`  
✔ Reusable RTL module  
✔ Synthesizable for FPGA and ASIC  
✔ Simple hardware implementation  

---

# Example Values

| N | Counter Range | Register Bits |
|---|---------------|---------------|
| 2 | 1 → 0 | 1 |
| 4 | 3 → 0 | 2 |
| 8 | 7 → 0 | 3 |
| 10 | 9 → 0 | 4 |
| 16 | 15 → 0 | 4 |

---

# Summary

The **Mod-N Down Counter**:

• Counts from **N-1 to 0**  
• Reloads automatically  
• Uses `$clog2` for scalable register width  
• Is widely used in **timers, frequency dividers, and control logic**  

It is a **fundamental digital design building block** used in FPGA and ASIC systems.
