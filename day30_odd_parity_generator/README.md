# 280326-odd-parity-generator

## Overview

An **odd parity generator** is a combinational digital circuit that appends a **parity bit** to a block of data so that the **total number of logic 1s becomes odd**.

It is commonly used in digital systems for **basic error detection** during:

- data transmission
- memory transfers
- serial communication
- bus communication
- embedded and hardware interface designs

This repository/module implements an odd parity generator in **Verilog HDL**.

---

## What Is Parity?

Parity is a simple technique used to detect errors in binary data.

A parity system adds **one extra bit** to the data.

There are two common types:

- **Even parity**: total number of 1s in the transmitted word must be even
- **Odd parity**: total number of 1s in the transmitted word must be odd

This project uses **odd parity**.

---

## Why Odd Parity Is Used

When a bit changes accidentally during transmission or storage, the total number of 1s may also change.

For odd parity:

- if the received total number of 1s is **odd**, the word is assumed valid
- if the received total number of 1s is **even**, an error is detected

This is useful because a **single-bit error** always changes the parity.

### Important limitation

Parity is only a **simple error detection method**.

It can reliably detect:

- most **single-bit errors**
- in general, any **odd number of bit flips**

It may fail to detect:

- **two-bit errors**
- in general, any **even number of bit flips**

So parity helps **detect** errors, but it does **not locate** the wrong bit and does **not correct** the data.

---

## Working Principle of an Odd Parity Generator

Given an input data word:

- count the number of 1s in the input
- generate one parity bit
- append that parity bit to the data
- make sure the final transmitted word contains an **odd** number of 1s

### Rule

- if input already has an **odd** number of 1s, parity bit = `0`
- if input has an **even** number of 1s, parity bit = `1`

---

## XOR Logic Behind Odd Parity

The XOR of all bits in a binary word has an important property:

- XOR result is `1` when the number of 1s is **odd**
- XOR result is `0` when the number of 1s is **even**

So for a data word `data_in`:

- `^data_in` gives the **even parity result**
- `~(^data_in)` gives the **odd parity bit**

That is why odd parity generation is often implemented as:

```verilog
~(^data_in)
```

This is compact, synthesizable, and the standard way to do it in Verilog.

---

## Verilog Module

### Source Code

```verilog
module odd_parity_generator (data_in, data_out);
    parameter N = 8;
    input [N-1:0] data_in;
    output [N:0] data_out;
    
    assign data_out = { (data_in), (~(^data_in))};
endmodule
```

---

## Code Explanation

### Module name

```verilog
module odd_parity_generator (data_in, data_out);
```

Defines a module named `odd_parity_generator`.

### Parameter

```verilog
parameter N = 8;
```

This makes the design **parameterized**.

- default input width is 8 bits
- you can change `N` to any required width

Examples:

- `N = 4` for 4-bit data
- `N = 8` for 8-bit data
- `N = 16` for 16-bit data

### Input

```verilog
input [N-1:0] data_in;
```

This is the input data bus.

If `N = 8`, then `data_in` is an 8-bit signal.

### Output

```verilog
output [N:0] data_out;
```

This output is `N+1` bits wide.

It contains:

- original `N` data bits
- 1 odd parity bit

### Assignment

```verilog
assign data_out = { (data_in), (~(^data_in))};
```

This concatenates:

1. the original input data
2. the generated odd parity bit

#### Important note about bit ordering

In this design:

```verilog
{data_in, parity_bit}
```

means:

- `data_in` occupies the **upper N bits**
- the parity bit becomes the **least significant bit (LSB)** of `data_out`

So if `N = 8`, then:

- `data_out[8:1] = data_in`
- `data_out[0]   = parity_bit`

This is valid, but you must keep this ordering consistent with the receiver or checker.

---

## Example

Assume:

```text
data_in = 8'b10110010
```

Count the number of 1s:

- `10110010` has 4 ones
- 4 is even

For odd parity, parity bit must be `1`.

So:

```text
data_out = 101100101
```

Now the total number of 1s is 5, which is odd.

---

## More Examples

| `data_in` | Number of 1s | Odd parity bit | `data_out` |
|---|---:|---:|---|
| `0000` | 0 | `1` | `00001` |
| `0001` | 1 | `0` | `00010` |
| `0110` | 2 | `1` | `01101` |
| `1111` | 4 | `1` | `11111` |
| `1011` | 3 | `0` | `10110` |

> Note: In the table above, the parity bit is shown appended on the right, matching the provided Verilog implementation.

---

## Logic Diagram Idea

An odd parity generator can be built by:

1. XORing all input bits together
2. inverting the XOR result
3. appending that value as the parity bit

For a 4-bit input `A, B, C, D`:

```text
Parity = ~(A ^ B ^ C ^ D)
```

---

## Truth Table for 3-Bit Odd Parity

| A | B | C | XOR (`A^B^C`) | Odd parity bit |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 1 |
| 0 | 0 | 1 | 1 | 0 |
| 0 | 1 | 0 | 1 | 0 |
| 0 | 1 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 | 0 |
| 1 | 0 | 1 | 0 | 1 |
| 1 | 1 | 0 | 0 | 1 |
| 1 | 1 | 1 | 1 | 0 |

---

## Applications of Odd Parity Generator

Odd parity generators are used in systems where a lightweight error-detection mechanism is needed.

### 1. Serial Communication

Used in communication protocols and UART-style data transmission where an extra parity bit is appended to each transmitted word.

### 2. Embedded Systems

Useful in microcontroller-based systems for basic data integrity checks between peripherals and controllers.

### 3. Memory and Register Transfers

Can be used while moving data between registers, buffers, or memory blocks to detect accidental corruption.

### 4. Digital Communication Links

Helps verify that transmitted data has not changed during transfer over a bus, channel, or physical link.

### 5. Educational and Laboratory Designs

Widely used in:

- FPGA labs
- digital electronics projects
- Verilog/VHDL learning exercises
- communication system experiments

### 6. Interface Protection in Simple Designs

In low-cost systems where full CRC or ECC is not needed, parity offers a simple first-level check.

---

## Advantages

- very simple to implement
- requires very little hardware
- fast combinational logic
- easy to synthesize in FPGA/ASIC flows
- parameterized design allows reuse for different word widths
- useful for detecting single-bit errors

---

## Limitations

- cannot correct errors
- cannot identify which bit is wrong
- cannot detect all multi-bit errors
- weak compared to CRC, checksum, or ECC for strong reliability needs

So parity is good for **simple detection**, not for robust fault tolerance.

---

## Synthesis Notes

This implementation is:

- **combinational**
- **continuous assignment based**
- **fully synthesizable**
- suitable for **FPGA** and **ASIC** workflows

Using reduction XOR is the preferred implementation style because it maps cleanly into hardware.

---

## Possible Companion Modules

In practical designs, an odd parity generator is usually used together with:

- **odd parity checker**
- **even parity generator**
- **even parity checker**
- **UART transmitter/receiver**
- **bus integrity monitor**

---

## Example Testbench Cases to Verify

A good testbench should check:

1. all zeros input
2. all ones input
3. alternating patterns
4. random patterns
5. correct parity output width
6. correct bit ordering

Example vectors:

- `0000`
- `0001`
- `0101`
- `1111`
- `10101010`

---

## Expected Behavior Summary

For an odd parity generator:

- input with even number of 1s -> parity bit is `1`
- input with odd number of 1s -> parity bit is `0`

Mathematically:

```text
odd_parity_bit = NOT(XOR of all input bits)
```

---

## Real-World Comparison

Think of parity as a quick seal on a data packet.

It does not fully protect the data, but it gives a cheap and fast way to detect many common errors.

If stronger protection is needed, engineers usually move to:

- checksum
- CRC
- Hamming code
- ECC memory techniques

---

## Conclusion

The odd parity generator is a small but important digital design block used for **basic error detection**.

This Verilog implementation is efficient because it uses:

- parameterization for flexibility
- reduction XOR for compact logic
- concatenation for generating the output word

It is a useful building block for students, FPGA developers, embedded designers, and anyone learning digital communication or hardware description languages.

---

## File Information

Provided source file:

- `odd_parity_generator.v`

