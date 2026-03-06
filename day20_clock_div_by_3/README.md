# 060326-clock-div-by-3

## 1. Introduction

A **frequency divider** (also called a clock divider) is a digital
circuit that reduces the frequency of an input clock signal. It is
widely used in digital systems where different modules require different
clock speeds.

Example: If the input clock is 300 MHz and the divider is **3**, the
output clock becomes:

Output Frequency = Input Frequency / 3

Frequency dividers are commonly used in:

-   Microprocessors
-   PLL and clock generation circuits
-   Digital communication systems
-   Counters and timers
-   FPGA clock management

------------------------------------------------------------------------

# 2. Types of Frequency Dividers

## Even Dividers

Even dividers (÷2, ÷4, ÷8...) are easy to design because a flip‑flop
naturally divides the clock by 2.

Example:

Divide by 2 using T flip‑flop: Each clock edge toggles the output.

## Odd Dividers

Odd dividers (÷3, ÷5, ÷7...) are more complex because a simple counter
does not produce a **50% duty cycle** output.

To achieve a near‑50% duty cycle we use:

• Both **positive edge logic** • **Negative edge logic** • Combine
signals using logic gates

------------------------------------------------------------------------

# 3. Divide‑by‑3 Clock Divider Concept

A simple counter produces the sequence:

0 → 1 → 2 → 0 → 1 → 2 → ...

However this output has an **uneven duty cycle**.

To fix this we use two signals:

a : generated on the **positive edge** d : delayed version of a
generated on the **negative edge**

Then we combine them:

out = a \| d

This extends the high time by half a clock cycle and produces
approximately **50% duty cycle**.

------------------------------------------------------------------------

# 4. Design Architecture

Components used:

• 2‑bit counter\
• Positive edge register (a)\
• Negative edge register (d)\
• OR gate for final output

Counter states:

  Count   Meaning
  ------- ---------
  00      Start
  01      Step
  10      Reset

Sequence:

0 → 1 → 2 → 0 → ...

------------------------------------------------------------------------

# 5. Verilog Implementation

``` verilog
module clock_div_by_3 (clk, out, reset);

    input clk, reset;
    output out;

    reg [1:0] count;
    reg a,d;

    always @(posedge clk) begin
        if (reset)
            count <= 2'b00;
        else if(count == 2'b10)
            count <= 2'b00;
        else
            count <= count + 1;
    end

    always @(posedge clk) begin 
        if(count == 2'b00)
            a <= 1'b1;
        else 
            a <= 1'b0;
    end

    always @(negedge clk) begin
        d <= a;
    end

    assign out = (a | d);

endmodule
```

------------------------------------------------------------------------

# 6. How the Circuit Works

Step‑by‑step operation:

1.  Counter counts from **0 → 1 → 2 → 0**
2.  When counter equals **0**, signal **a becomes 1**
3.  Signal **d** captures **a** on the **negative edge**
4.  Output is produced by:

out = a OR d

This makes the output stay high for **1.5 clock cycles**, creating a
balanced duty cycle.

------------------------------------------------------------------------

# 7. Timing Behavior

Example waveform:

Clock:

    ┌─┐ ┌─┐ ┌─┐ ┌─┐
    └─┘ └─┘ └─┘ └─┘

Output:

    ┌─────┐     ┌─────┐
    │     │     │     │
    └─────┴─────┘

Output period = **3 input clocks**

------------------------------------------------------------------------

# 8. Applications

Divide‑by‑3 clock generators are used in:

• PLL clock synthesis\
• Serial communication timing\
• Digital counters\
• Frequency scaling circuits\
• FPGA clock management

------------------------------------------------------------------------

# 9. Key Design Insights

Important concepts demonstrated in this design:

1.  **Odd frequency division**
2.  **Duty cycle correction**
3.  Using **posedge and negedge logic**
4.  Counter‑based clock division
5.  Register timing control

This technique is commonly used when designing **high‑speed clock
generation circuits**.

------------------------------------------------------------------------

# 10. Summary

A divide‑by‑3 clock divider requires:

• A modulo‑3 counter\
• Edge‑triggered registers\
• Logic combination for duty cycle control

The presented Verilog design efficiently generates a **divide‑by‑3 clock
with near 50% duty cycle**, making it useful for digital clock
distribution systems.
