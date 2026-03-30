# 300326-even-parity-generator

## Overview

This project implements an **Even Parity Generator** in Verilog. The design takes an `N`-bit input data word and appends **one parity bit** so that the **total number of 1s in the output becomes even**.

Parity generation is a basic but widely used error-detection technique in digital systems, communication links, memory interfaces, and embedded hardware.

---

## What is Even Parity?

A parity bit is an extra bit added to a binary word.

In **even parity**:

- If the input data contains an **odd** number of `1`s, the parity bit is set to `1`
- If the input data contains an **even** number of `1`s, the parity bit is set to `0`

This guarantees that the final transmitted or stored word has an **even** number of `1`s.

### Examples

| Input Data | Number of 1s | Even Parity Bit | Output Word |
|------------|--------------|-----------------|-------------|
| `0000`     | 0            | `0`             | `00000`     |
| `0001`     | 1            | `1`             | `00011`     |
| `1010`     | 2            | `0`             | `10100`     |
| `1110`     | 3            | `1`             | `11101`     |

---

## Design File

### Verilog Module

```verilog
module even_parity_generator (data_in, data_out);
	parameter N = 8;
	input [N-1:0] data_in;
	output [N:0] data_out;
	
	assign data_out = {(data_in), (^data_in)};
endmodule
```

---

## How the Design Works

The design uses the **reduction XOR** operator:

```verilog
^data_in
```

This performs XOR across all bits of `data_in`.

### Reduction XOR behavior

- Result is `1` when the number of `1`s in `data_in` is **odd**
- Result is `0` when the number of `1`s in `data_in` is **even**

That behavior matches exactly what is needed for **even parity generation**.

So this line:

```verilog
assign data_out = {(data_in), (^data_in)};
```

means:

- keep the original input data
- append the parity bit at the **least significant bit (LSB)** side

So the output width becomes `N+1` bits.

---

## Input and Output Description

### Inputs

- `data_in [N-1:0]` : Input data word

### Outputs

- `data_out [N:0]` : Output data with appended parity bit

### Parameter

- `N` : Width of input data
- Default value: `8`

---

## Bit Arrangement

The module generates:

```verilog
data_out = {data_in, parity_bit}
```

So if `N = 8`:

- `data_in[7:0]` occupies `data_out[8:1]`
- parity bit occupies `data_out[0]`

This is important.

Your checker or receiver must know that the parity bit is appended at the **rightmost side**.

---

## Worked Examples

### Example 1

Input:

```text
data_in = 8'b10110010
```

Number of 1s = 4

Since 4 is even:

```text
parity = 0
```

Output:

```text
data_out = 9'b101100100
```

---

### Example 2

Input:

```text
data_in = 8'b10110011
```

Number of 1s = 5

Since 5 is odd:

```text
parity = 1
```

Output:

```text
data_out = 9'b101100111
```

Now total number of 1s in the output is 6, which is even.

---

## Truth Table for 4-Bit Example

| `data_in` | Number of 1s | Parity Bit | `data_out` |
|----------|---------------|------------|------------|
| `0000`   | 0             | `0`        | `00000`    |
| `0001`   | 1             | `1`        | `00011`    |
| `0010`   | 1             | `1`        | `00101`    |
| `0011`   | 2             | `0`        | `00110`    |
| `0101`   | 2             | `0`        | `01010`    |
| `0111`   | 3             | `1`        | `01111`    |
| `1110`   | 3             | `1`        | `11101`    |
| `1111`   | 4             | `0`        | `11110`    |

---

## Why Even Parity is Used

Even parity is used as a **simple error-detection mechanism**.

When the data is transmitted or stored, the receiver can count the number of `1`s again.

- If total number of `1`s is still even, the data is likely correct
- If total number of `1`s becomes odd, an error is detected

### What parity can detect

- Most **single-bit errors**
- Any error pattern that changes parity from even to odd

### What parity cannot reliably detect

- Many **two-bit errors**
- In general, parity misses errors when an **even number of bits flip**

So parity is cheap and useful, but it is not strong error correction.

---

## Applications

Even parity generators are commonly used in:

### 1. Data Communication
- UART-style serial communication
- Basic communication protocols
- Low-cost digital links

### 2. Memory Systems
- RAM data validation
- Register storage checking
- Simple memory protection schemes

### 3. Embedded Systems
- Sensor data transfer
- Microcontroller communication
- Peripheral interfaces

### 4. Digital Design Labs and FPGA Projects
- Introductory digital design experiments
- Error-detection demonstrations
- Verilog training projects

### 5. Network and Bus Systems
- Internal data buses
- Legacy communication buses
- Low-overhead integrity checks

---

## Advantages

- Very simple hardware
- Low area cost
- Easy to implement in Verilog
- Fast combinational logic
- Useful for basic error detection
- Parameterized design supports multiple widths

---

## Limitations

- Does not correct errors
- Cannot identify which bit is wrong
- Misses many multi-bit errors
- Not suitable alone for high-reliability systems

For stronger protection, designers use:

- checksum
- CRC
- Hamming code
- ECC memory

---

## Why This Verilog Style is Good

This implementation is clean because it:

- uses a **parameter** for scalable width
- uses **continuous assignment** for simple combinational logic
- uses the **reduction XOR** operator directly
- avoids unnecessary `always` blocks and loops

That is the right engineering approach for a small combinational module.

---

## Synthesis Notes

This module is:

- **combinational**
- **synthesizable**
- suitable for FPGA and ASIC learning projects

Synthesis tools will map the reduction XOR into XOR gate logic.

---

## Suggested Verification Cases

To verify the module, test these cases:

1. all zeros
2. all ones
3. alternating bit patterns
4. odd number of 1s
5. even number of 1s
6. different values of parameter `N`

Example test inputs:

```text
00000000
00000001
01010101
11111111
10101010
11100001
```

---

## Related Concepts

This module is closely related to:

- **Odd Parity Generator**
- **Even Parity Checker**
- **Odd Parity Checker**
- **Error Detection Codes**
- **Reduction Operators in Verilog**

---

## Key Takeaway

An even parity generator appends one extra bit so that the total number of `1`s in the output word becomes even. It is a simple and efficient hardware method for basic error detection.

---

## License

This README can be freely used for academic, personal, and learning purposes.
