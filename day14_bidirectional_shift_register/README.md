
# 280226-bidirectional-shift-register

##  Overview

A **Bidirectional Shift Register** is a sequential digital circuit capable of shifting data either to the left or to the right depending on a control signal. It is an advanced form of shift register that supports two-way data movement.

This design is parameterized and written in Verilog HDL, making it scalable and synthesizable for FPGA and ASIC implementations.

---

##  Module Description

### Parameters:
- `N` : Width of the shift register (default = 3 bits)

### Inputs:
- `clk`    : Clock signal (positive edge triggered)
- `d`      : Serial data input
- `rshift` : Direction control signal  
              - `1` → Right shift  
              - `0` → Left shift
- `reset`  : Synchronous reset

### Output:
- `out` : Serial output (depends on shift direction)

---

##  Working Principle

On every rising edge of the clock:

1. **If reset is HIGH**
   - The register is cleared to all zeros.

2. **If rshift = 1 (Right Shift)**
   - Data shifts right.
   - New serial bit `d` enters MSB.
   - LSB is shifted out.

   Operation:
   ```verilog
   y <= {d, y[N-1:1]};
   ```

3. **If rshift = 0 (Left Shift)**
   - Data shifts left.
   - New serial bit `d` enters LSB.
   - MSB is shifted out.

   Operation:
   ```verilog
   y <= {y[N-2:0], d};
   ```

### Serial Output Logic

- If shifting right → output = LSB (`y[0]`)
- If shifting left  → output = MSB (`y[N-1]`)

---

##  RTL Implementation

```verilog
module bidirectional_shift_register(clk, d, out, rshift, reset);
    parameter N = 3;
    input clk;
    input d;
    input rshift;
    input reset;
    output out;
    
    reg [N-1:0] y;
    
    always @(posedge clk) begin
        if (reset)
            y <= {N{1'b0}};
        else if (rshift)
            y <= {d, y[N-1:1]};     // Right shift
        else
            y <= {y[N-2:0], d};     // Left shift
    end

    assign out = (rshift) ? y[0] : y[N-1];
endmodule
```

---

##  Key Features

- Bidirectional shifting (left and right)
- Parameterized width
- Synchronous reset
- Synthesizable RTL
- Compact hardware structure

---

##  Advantages

### 1️ Flexibility
Allows both left and right shifting in a single hardware block.

### 2️ Hardware Efficient
Uses a single register bank with multiplexing logic for direction control.

### 3️ Scalable Architecture
Width can be increased easily by modifying parameter `N`.

### 4️ Clean Timing Behavior
Synchronous design ensures predictable timing.

### 5️ Useful in Data Manipulation
Enables dynamic bit movement inside digital systems.

---

##  Applications

- Serial communication systems
- Data buffering
- Barrel shifter foundation
- Arithmetic shift operations
- Bit rotation logic
- Digital signal processing
- Cryptographic hardware
- Sequence generators
- LED pattern generators
- IO expansion interfaces

---

##  Timing Considerations

- Shift completes in N clock cycles.
- Maximum frequency depends on flip-flop timing constraints.
- Direction control should be stable before clock edge.

---

##  Hardware Interpretation

The bidirectional shift register consists of:

- N D Flip-Flops
- Multiplexer logic to control shift direction
- Serial input insertion logic
- Direction-based serial output selection

This structure is commonly implemented in FPGA LUT fabric or ASIC standard cells.

---

##  Summary

A Bidirectional Shift Register is a powerful sequential circuit capable of shifting data left or right based on a control signal. It is widely used in digital communication, data manipulation, arithmetic logic units, and embedded systems.

It serves as a foundation block for more advanced digital architectures such as barrel shifters and rotating registers.

---

### Challenge Day: 14
This implementation strengthens understanding of:
- Sequential logic
- Parameterized RTL
- Data movement operations
- Synthesis-aware coding
