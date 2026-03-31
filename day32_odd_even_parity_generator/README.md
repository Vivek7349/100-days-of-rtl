# 310326-odd-even-parity-generator

## Overview
This project implements a **parameterized odd/even parity generator** in Verilog. The module takes an `N`-bit input data word and appends **one parity bit** to produce an `(N+1)`-bit output word.

The parity mode is selected using the `odd` control input:

- `odd = 1` -> generate **odd parity**
- `odd = 0` -> generate **even parity**

This makes the design more reusable than writing two separate modules.

---

## What Parity Means
Parity is a simple error-detection technique used in digital systems and communication links.

A parity bit is an extra bit added to the data so that the **total number of 1s** in the transmitted word follows a rule.

### Even parity
The parity bit is chosen so that the total number of 1s becomes **even**.

### Odd parity
The parity bit is chosen so that the total number of 1s becomes **odd**.

---

## Why This Is Useful
Parity helps detect transmission or storage errors.

If one bit flips during transfer:
- `0` becomes `1`, or
- `1` becomes `0`

then the total number of 1s changes by one, which changes the parity. A receiver can check the parity rule and detect that an error likely happened.

### Important limitation
Parity is a **basic error-detection method only**.

It can reliably detect:
- all **single-bit errors**
- any **odd number of bit errors**

It may fail to detect:
- **two-bit errors**
- in general, any **even number of bit errors**

So parity is cheap and fast, but not strong.

---

## Verilog Module
```verilog
module odd_even_parity_generator(data_in, data_out, odd);
    parameter N = 8;
    input [N-1:0] data_in;
    output [N:0] data_out;
    input odd;

    assign data_out = odd ? {data_in, ~(^data_in)} : {data_in, (^data_in)};
endmodule
```

---

## Port Description
| Port | Width | Direction | Description |
|------|-------|-----------|-------------|
| `data_in` | `N` | Input | Input data word |
| `odd` | `1` | Input | Parity mode select: `1` for odd parity, `0` for even parity |
| `data_out` | `N+1` | Output | Output data with appended parity bit |

---

## Parameter Description
| Parameter | Default | Description |
|-----------|---------|-------------|
| `N` | `8` | Width of the input data bus |

This means the same module can be used for 4-bit, 8-bit, 16-bit, or other bus sizes without rewriting the logic.

---

## How the Logic Works
The design uses the **reduction XOR** operator:

```verilog
^data_in
```

This produces:
- `1` when the number of 1s in `data_in` is **odd**
- `0` when the number of 1s in `data_in` is **even**

### Even parity case
```verilog
{data_in, (^data_in)}
```
- If `data_in` has an odd number of 1s, parity bit becomes `1`
- If `data_in` has an even number of 1s, parity bit becomes `0`
- Result: total number of 1s in `data_out` becomes **even**

### Odd parity case
```verilog
{data_in, ~(^data_in)}
```
- If `data_in` has an odd number of 1s, parity bit becomes `0`
- If `data_in` has an even number of 1s, parity bit becomes `1`
- Result: total number of 1s in `data_out` becomes **odd**

---

## Output Format
The parity bit is appended as the **least significant bit (LSB)** of `data_out`:

```verilog
{data_in, parity_bit}
```

That means:
- upper `N` bits = original data
- lowest bit = parity bit

### Example for `N = 4`
If:
```verilog
data_in = 4'b1011
```
then:
- number of 1s = 3
- even parity bit = `1`
- odd parity bit = `0`

So:
- even parity output = `5'b10111`
- odd parity output = `5'b10110`

This bit ordering must be understood by the receiver or checker.

---

## Truth Table Example for 4-bit Input
| `data_in` | Number of 1s | Even parity bit | Odd parity bit | Even output | Odd output |
|----------|----------------|-----------------|----------------|-------------|------------|
| `0000` | 0 | `0` | `1` | `00000` | `00001` |
| `0001` | 1 | `1` | `0` | `00011` | `00010` |
| `0011` | 2 | `0` | `1` | `00110` | `00111` |
| `0111` | 3 | `1` | `0` | `01111` | `01110` |
| `1111` | 4 | `0` | `1` | `11110` | `11111` |

---

## Step-by-Step Example
Assume:
```verilog
data_in = 8'b11010010
```

Number of 1s = 4, which is even.

### Case 1: `odd = 0` (even parity)
- parity bit = `0`
- output = `{11010010, 0}`
- `data_out = 9'b110100100`

### Case 2: `odd = 1` (odd parity)
- parity bit = `1`
- output = `{11010010, 1}`
- `data_out = 9'b110100101`

---

## Design Advantages
- **Parameterized width** using `N`
- Supports **both odd and even parity** in one module
- Uses **simple combinational logic**
- Easy to synthesize on FPGA or ASIC flows
- Clean and scalable implementation
- No clock required
- No unnecessary `always` block

---

## Applications
This type of design is commonly used in:

### 1. Digital communication systems
Used when sending data between devices so the receiver can perform a parity check.

### 2. UART and serial interfaces
Many serial protocols use parity bits as an optional basic error-detection feature.

### 3. Memory systems
Parity may be stored alongside data to detect bit corruption in RAM or storage paths.

### 4. Microprocessor and microcontroller interfaces
Useful in buses and low-cost integrity checks where full ECC is not required.

### 5. Embedded systems
Helps monitor basic transmission reliability in resource-constrained hardware.

### 6. Educational digital design projects
A standard building block used to understand combinational logic, XOR reduction, and error detection.

---

## Synthesis Notes
This module is purely **combinational**.

That means:
- output changes immediately when inputs change
- no flip-flops are inferred
- hardware cost is very small

A synthesis tool will implement the parity logic using XOR gates and a small multiplexer structure for selecting odd or even mode.

---

## Verification Ideas
You should test at least these cases:

1. `data_in = all zeros`
2. `data_in = all ones`
3. alternating patterns like `10101010`
4. random data patterns
5. both control modes: `odd = 0` and `odd = 1`
6. different values of parameter `N`

### What to verify
- for `odd = 0`, total number of 1s in `data_out` is always even
- for `odd = 1`, total number of 1s in `data_out` is always odd
- parity bit is always placed at the LSB

---

## Example Test Cases
| `data_in` | `odd` | Expected parity bit | Expected `data_out` |
|----------|------:|--------------------:|---------------------|
| `8'b00000000` | 0 | `0` | `9'b000000000` |
| `8'b00000000` | 1 | `1` | `9'b000000001` |
| `8'b11111111` | 0 | `0` | `9'b111111110` |
| `8'b11111111` | 1 | `1` | `9'b111111111` |
| `8'b10110010` | 0 | `0` | `9'b101100100` |
| `8'b10110010` | 1 | `1` | `9'b101100101` |

---

## How to Instantiate
```verilog
odd_even_parity_generator #(.N(8)) uut (
    .data_in(data_in),
    .data_out(data_out),
    .odd(odd)
);
```

---

## Practical Design Notes
- This module **generates** parity, it does not **check** parity.
- A receiver must use a separate **parity checker**.
- Both sender and receiver must agree on:
  - odd or even mode
  - where the parity bit is located
  - data width

If they do not agree, the whole scheme breaks.

---

## Possible Improvements
This design is already clean, but you could extend it by adding:

- a parity checker module
- a combined generator/checker testbench
- support for selectable parity bit position
- enable signal for conditional generation
- integration into UART-style framing

---

## Conclusion
This module is a compact and efficient Verilog implementation of an **odd/even parity generator**. It uses reduction XOR to generate the parity bit and appends it to the data output. The design is parameterized, reusable, synthesizable, and useful in many digital communication and embedded system applications.

It is a strong example of how a very small piece of combinational logic can provide practical error-detection support with minimal hardware cost.
