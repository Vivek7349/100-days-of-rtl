
# 020326-subtractor_8_bit

---

#  Overview

Subtraction in digital systems is not performed using a dedicated subtraction circuit in most processors.  
Instead, subtraction is implemented using **2's complement arithmetic and adders**.

This README explains:

- Basics of Binary Subtraction
- What is 2's Complement
- How 2's Complement enables subtraction
- Hardware implementation concept
- Practical applications in digital systems

---

#  1. Basics of Binary Subtraction

Binary subtraction follows similar rules to decimal subtraction.

Basic rules:

0 − 0 = 0  
1 − 0 = 1  
1 − 1 = 0  
0 − 1 = 1 (with borrow)

Because borrow logic increases hardware complexity, designers prefer using complement-based subtraction.

---

#  2. What is 2's Complement?

2's Complement is a method to represent negative numbers in binary.

To calculate 2's complement of a number:

Step 1: Take 1's complement (invert all bits)  
Step 2: Add 1 to the result

Example:

Binary:      0101  (5)
1's comp:    1010
Add 1:       1011  (−5 in 2's complement)

---

#  3. Why 2's Complement is Powerful

The main advantage:

A − B  can be written as:

A + (2's complement of B)

This means:

Subtraction = Addition

So instead of building separate subtractor hardware, we use:

- Adder
- Inverter
- Control bit

This simplifies hardware drastically.

---

#  4. Hardware Concept of Subtractor

For A − B:

1. Invert B bits
2. Add 1 (through carry-in)
3. Add with A using full adders

So internally:

Result = A + (~B + 1)

This is implemented using:

- XOR gates (for conditional inversion)
- Full adders
- Control signal (SUB)

If SUB = 0 → Addition  
If SUB = 1 → Subtraction

---

#  5. Example

Let:

A = 8 (00001000)  
B = 3 (00000011)

Step 1: 1's complement of B  
11111100

Step 2: Add 1  
11111101

Step 3: Add with A  

00001000  
+11111101  
-----------  
00000101  (5)

Correct result: 8 − 3 = 5

---

#  6. Advantages of Using 2's Complement

1️ Only one arithmetic circuit needed (Adder)  
2️ No separate borrow hardware required  
3️ Simplifies ALU design  
4️ Fast arithmetic operations  
5️ Easy negative number representation  
6️ Hardware efficient  
7️ Widely standardized in processors  

---

#  7. Applications

###  Arithmetic Logic Units (ALU)
All CPUs use 2's complement for subtraction.

###  Digital Signal Processing (DSP)
Used in signed arithmetic calculations.

###  Microprocessors & Microcontrollers
Signed integer operations.

###  Embedded Systems
Sensor data processing.

###  FPGA/ASIC Arithmetic Blocks
Adder-subtractor implementations.

###  Computer Architecture
Register operations and branching comparisons.

---

#  8. Overflow in 2's Complement

Overflow occurs when:

- Adding two positive numbers gives negative result
- Adding two negative numbers gives positive result

Overflow detection logic:

Overflow = Carry into MSB XOR Carry out of MSB

---

#  9. Borrow vs 2's Complement

Traditional Borrow Subtraction:
- Complex borrow propagation
- Slower hardware

2's Complement Method:
- Uses simple adder
- Faster
- Cleaner design
- Standard in modern systems

---

#  Summary

2's complement transforms subtraction into addition.

Modern processors reuse adder hardware with controlled inversion and carry-in to perform subtraction efficiently.

This approach:

- Reduces hardware area
- Increases speed
- Simplifies digital design
- Scales easily to large bit-width systems

---

### Learning Topic: Subtractor & 2's Complement Arithmetic
