# 020426-parity-based-error-detection
## Overview
This project implements a **parity-based error detection design** in Verilog. The module supports both **even parity** and **odd parity** using a single control input. It generates the required parity bit for the input data and then checks whether the complete word satisfies the selected parity rule.

This makes the design useful for understanding how a simple digital system can detect transmission or storage errors using parity logic.

---

## What This Design Does
The module performs two related jobs:

1. **Parity generation**: It calculates the parity bit for the input data.
2. **Parity checking**: It verifies whether the complete word follows the selected parity rule.

Because both tasks are included, this design is best described as a:

> **Parity-based error detection system**

More specifically, it can operate as either:
- an **even parity error detection system**, or
- an **odd parity error detection system**

depending on the `odd` control input.

---

## Verilog Module
```verilog
module parity_based_error_detection( data_in, error, odd);
    parameter N = 8;
    input odd;
    input [N-1:0] data_in;
    output error;
    
    wire [N:0] connect;
    
    assign connect = odd ? {(data_in),(~(^data_in))}: {(data_in),(^data_in)};
    
    assign error = odd ? ~(^connect) : ^connect;
    
endmodule
```

---

## Port Description
| Port | Direction | Width | Description |
|------|-----------|-------|-------------|
| `data_in` | Input | `N` bits | Input data word |
| `odd` | Input | 1 bit | Selects parity type: `1` for odd parity, `0` for even parity |
| `error` | Output | 1 bit | Error indication output |

### Internal Signal
| Signal | Width | Description |
|--------|-------|-------------|
| `connect` | `N+1` bits | Combines `data_in` with the generated parity bit |

---

## Parameter
```verilog
parameter N = 8;
```
This parameter defines the width of the input data.

- If `N = 8`, the input data is 8 bits wide.
- The internal signal `connect` becomes 9 bits wide.

This makes the design reusable for different data widths.

---

## Core Logic

### 1. Parity Generation
```verilog
assign connect = odd ? {(data_in),(~(^data_in))}: {(data_in),(^data_in)};
```

This line generates the parity bit and appends it to the input data.

#### When `odd = 0`
- The design uses **even parity**.
- The parity bit is `^data_in`.
- This makes the total number of `1`s in `connect` **even**.

#### When `odd = 1`
- The design uses **odd parity**.
- The parity bit is `~(^data_in)`.
- This makes the total number of `1`s in `connect` **odd**.

### Why XOR is used
The reduction XOR operator:
```verilog
^data_in
```
produces:
- `1` if the number of `1`s in `data_in` is odd
- `0` if the number of `1`s in `data_in` is even

So:
- **Even parity bit** = `^data_in`
- **Odd parity bit** = `~(^data_in)`

---

## 2. Error Checking
```verilog
assign error = odd ? ~(^connect) : ^connect;
```

This line checks whether the combined data word follows the selected parity rule.

### Even parity mode (`odd = 0`)
```verilog
assign error = ^connect;
```
- If total number of `1`s in `connect` is even, `^connect = 0`
- If total number of `1`s in `connect` is odd, `^connect = 1`

So:
- `error = 0` → no error
- `error = 1` → error detected

### Odd parity mode (`odd = 1`)
```verilog
assign error = ~(^connect);
```
- If total number of `1`s in `connect` is odd, `^connect = 1`, so `error = 0`
- If total number of `1`s in `connect` is even, `^connect = 0`, so `error = 1`

So again:
- `error = 0` → no error
- `error = 1` → error detected

---

## Important Functional Note
This module **internally generates the parity bit and immediately checks it** using the same data word.

That means:
- under normal conditions, the module will produce the correct parity bit,
- and the checker will validate that same word,
- so `error` should normally remain **0**.

This is useful for learning and for verifying parity logic, but it is **not a full transmitter-channel-receiver model** by itself.

If you want to simulate actual communication errors, you would normally:
1. generate the parity bit,
2. send the full word through a channel,
3. optionally flip one or more bits,
4. then check the received word in a separate checker module.

That is how parity is usually used in real systems.

---

## Bit Arrangement
The parity bit is appended to the **least significant side** of the concatenation:
```verilog
{data_in, parity_bit}
```

So if `N = 8`, then:
- `connect[8:1]` contains `data_in`
- `connect[0]` contains the parity bit

This matters when interfacing with other modules. Any external checker or receiver must know where the parity bit is located.

---

## Example 1: Even Parity
Assume:
```text
data_in = 8'b10110010
odd = 0
```

Count the number of `1`s in `data_in`:
- `10110010` has 4 ones
- 4 is even

So for even parity:
- parity bit = `0`
- `connect = 101100100`

Now the checker evaluates:
- total number of `1`s is still even
- `error = 0`

---

## Example 2: Odd Parity
Assume:
```text
data_in = 8'b10110010
odd = 1
```

Again, the input has 4 ones.

To make total count odd:
- parity bit = `1`
- `connect = 101100101`

Now the checker evaluates:
- total number of `1`s is 5, which is odd
- `error = 0`

---

## Example 3: What Happens if a Bit Changes?
Suppose an even-parity protected word is:
```text
101100100
```
If one bit flips during transmission, it might become:
```text
101000100
```
Now the number of `1`s changes from even to odd.

So the parity rule is broken and:
- the checker detects an error
- `error = 1`

This is the core purpose of parity.

---

## Truth Summary

### Even Parity Mode (`odd = 0`)
| Condition | `error` |
|-----------|---------|
| Total number of `1`s is even | `0` |
| Total number of `1`s is odd | `1` |

### Odd Parity Mode (`odd = 1`)
| Condition | `error` |
|-----------|---------|
| Total number of `1`s is odd | `0` |
| Total number of `1`s is even | `1` |

---

## Applications
This design is used in systems where simple and low-cost error detection is enough.

### Common applications
- **Digital communication systems**
- **Serial data transmission**
- **UART-style communication concepts**
- **Memory systems with basic error checking**
- **Embedded systems**
- **Microprocessor and digital logic education**
- **Laboratory experiments in Verilog and FPGA**
- **Data storage where lightweight checking is acceptable**

### Why it is useful
Parity is popular because it is:
- simple
- fast
- low-cost in hardware
- easy to implement using XOR logic

---

## Advantages
- Very simple hardware implementation
- Uses only XOR and NOT logic
- Easy to understand and verify
- Parameterized width makes it reusable
- Supports both odd and even parity in one module
- Good for teaching digital design concepts

---

## Limitations
This is where many people get confused.

Parity is only a **basic error detection technique**.

### It can detect:
- single-bit errors
- any odd number of bit flips

### It cannot reliably detect:
- all two-bit errors
- all even-numbered bit errors
- the location of the error
- how to correct the error

So this is an **error detection** design, not an **error correction** design.

---

## Why This Design Is Good for Learning
This module is useful because it teaches several important Verilog and digital design ideas:

- reduction XOR operator
- conditional operator `?:`
- parameterized module width
- concatenation operator `{}`
- parity generation logic
- parity checking logic
- relation between combinational logic and error detection

---


## Conclusion
This project demonstrates a compact and effective implementation of parity logic in Verilog. It combines parity generation and parity checking in one parameterized module and supports both odd and even parity modes. The design is simple, synthesizable, and useful for learning digital logic, Verilog operators, and basic error detection principles.

Although parity cannot correct errors and cannot detect all multi-bit faults, it remains one of the most important introductory techniques in digital communication and hardware design.

---

## File Information
**Design file:** `parity_based_error_detection.v`

This README is intended to help understand:
- the purpose of the module,
- the logic used in the implementation,
- the meaning of each line of code,
- where the design can be used,
- and what its limitations are.

---

## License / Usage
You may use this design and README for:
- academic projects
- lab reports
- FPGA practice
- digital design learning
- personal reference

