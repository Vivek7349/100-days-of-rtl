
# 070326-mod-n-up-counter

## Overview
A **Mod-N Up Counter** is a digital counter that counts from **0 to N-1** and then resets back to **0**, repeating the cycle continuously.  
It is widely used in digital systems for **frequency division, timing control, event counting, and state sequencing**.

The term **Mod-N** means the counter has **N unique states**.

Example:
- Mod-10 counter → counts 0–9
- Mod-8 counter → counts 0–7
- Mod-16 counter → counts 0–15

---

## Key Concept

A counter requires a number of flip‑flops equal to:

bits = ceil(log2(N))

In Verilog we typically use:

$clog2(N)

to automatically determine the required register width.

Example:
- N = 10
- log2(10) = 3.32
- ceil → 4 bits required

---

## Verilog Implementation

```verilog
module mod_n_counter #(parameter N = 10)(
    input clk,
    input reset,
    output reg [$clog2(N)-1:0] count
);

always @(posedge clk or posedge reset) begin
    if (reset)
        count <= 0;
    else if (count == N-1)
        count <= 0;
    else
        count <= count + 1;
end

endmodule
```

---

## How the Counter Works

1. On every **clock edge**, the counter increments.
2. When the counter reaches **N-1**, it resets to **0**.
3. The cycle repeats continuously.

Example for **Mod-5 Counter**

Clock Cycles | Counter Value
-------------|---------------
1 | 0
2 | 1
3 | 2
4 | 3
5 | 4
6 | 0
7 | 1

---

## Hardware Structure

A Mod-N counter consists of:

• Flip-flops (to store count value)  
• Combinational logic (to detect terminal count)  
• Clock input  
• Reset logic

Typical implementation:

Clock → Flip‑Flops → Increment Logic → Compare with (N‑1)

---

## Applications

### 1. Frequency Division
Counters divide clock frequencies.

Example:
- Mod‑2 → divide by 2
- Mod‑4 → divide by 4
- Mod‑10 → used in digital clocks

### 2. Digital Clocks
Used for:
- seconds counters
- minute counters
- hour counters

Example:
- seconds → Mod‑60 counter

### 3. Event Counting
Counts occurrences of events such as:
- pulses
- packets
- interrupts

### 4. State Machines
Counters can act as simple **finite state machines**.

### 5. Address Generation
Used in:
- memory scanning
- buffer indexing
- circular buffers

### 6. PWM Controllers
Counters help generate **duty cycle signals**.

### 7. Frequency Measurement
Used in digital frequency meters.

---

## Advantages of Parameterized Counters

Using parameters makes the design scalable.

Example:

```verilog
parameter N = 256;
```

Now the same counter becomes a **Mod‑256 counter** automatically.

Benefits:
- reusable RTL
- easy scalability
- less design errors

---

## Example Values

N | Counter Type | Required Bits
--|--------------|--------------
2 | Mod‑2 | 1
4 | Mod‑4 | 2
8 | Mod‑8 | 3
10 | Mod‑10 | 4
16 | Mod‑16 | 4
32 | Mod‑32 | 5

---

## Summary

A **Mod‑N Up Counter**:

• counts from **0 to N‑1**  
• resets automatically  
• is widely used in **digital systems**  
• can be easily implemented using **Verilog parameters and $clog2**  

It is one of the most fundamental building blocks in **digital design and FPGA/ASIC systems**.

---
