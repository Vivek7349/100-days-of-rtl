
# 010326-pseudo-bit-random-sequence
## RTL Design Documentation

---

##  Overview

A **Pseudo Random Bit Sequence (PRBS) Generator** is a sequential digital circuit that generates a deterministic but seemingly random binary sequence. 

It is commonly implemented using a **Linear Feedback Shift Register (LFSR)**.

The sequence produced:
- Appears random
- Repeats after a fixed number of cycles
- Is fully deterministic and reproducible

---

##  Module Description

### Inputs:
- `clk`   : Clock signal (positive edge triggered)
- `reset` : Synchronous reset

### Output:
- `out`   : 4-bit pseudo random sequence output

---

##  Working Principle

This design implements a 4-bit LFSR-based PRBS generator.

### Reset Condition:
When `reset = 1`  
The register initializes to a non-zero seed:

```verilog
out <= 4'b1001;
```

> A non-zero seed is mandatory.  
> If initialized to zero, the LFSR will remain stuck at zero forever.

---

### Feedback Logic:

On every rising clock edge (when reset is LOW):

```verilog
out <= { (out[1] ^ out[0]), out[3:0] };
```

Explanation:

- XOR of bit[1] and bit[0] generates the feedback bit.
- The feedback bit enters MSB.
- All bits shift right by one position.
- This creates a repeating pseudo-random pattern.

---

##  RTL Implementation

```verilog
module pseudo_bit_random_sequence (clk, reset, out);
    input clk;
    input reset;
    output out;
    
    reg [3:0] out;
    
    always @(posedge clk) begin 
        if (reset)
            out <= 4'b1001;
        else
            out <= { (out[1] ^ out[0]), out[3:0] };
    end
endmodule
```

---

##  Hardware Interpretation

This PRBS generator consists of:

- 4 D Flip-Flops
- XOR feedback logic
- Synchronous reset
- Shift register structure

It is essentially a 4-bit LFSR.

---

##  Sequence Behavior

For a 4-bit maximal LFSR:

- Maximum possible sequence length = 2^N − 1
- For N = 4 → 15 unique states
- After 15 cycles, sequence repeats

Note:
Actual sequence length depends on chosen feedback taps.

---

##  Advantages

### 1️⃣ Hardware Efficient
Requires only flip-flops and XOR gates.

### 2️⃣ Deterministic Randomness
Same seed produces same sequence → useful for testing.

### 3️⃣ High Speed
Very small combinational delay.

### 4️⃣ Low Area
Minimal logic resources in FPGA/ASIC.

### 5️⃣ Scalable
Can increase register width for longer sequences.

---

##  Applications

- Built-In Self Test (BIST)
- Digital communication testing
- Scrambling/descrambling
- Cryptography (basic forms)
- Spread spectrum systems
- Error detection testing
- Simulation stimulus generation
- Pattern generation in FPGA labs

---

##  Timing Considerations

- Operates at high clock frequencies
- Critical path includes XOR gate delay
- Ensure setup/hold timing constraints are met

---

##  Important Notes

- Never initialize LFSR with 0
- Choose proper feedback taps for maximal length
- Larger N gives longer pseudo-random sequence

---

##  Summary

The PRBS Generator is a fundamental digital building block based on LFSR architecture. 

It produces deterministic pseudo-random sequences used extensively in:
- Testing
- Communication systems
- Digital design verification

This design strengthens understanding of:
- Sequential logic
- Feedback systems
- XOR-based combinational logic
- LFSR theory
- Synthesizable RTL coding

---

### Challenge Day: PRBS Implementation
