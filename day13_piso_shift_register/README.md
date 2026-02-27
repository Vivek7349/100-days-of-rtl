
# 270226-piso-shift-register

## Description

A **Parallel-In Serial-Out (PISO) Shift Register** is a sequential digital circuit used to convert parallel data into a serial data stream. This shift register is commonly used for data transmission and communication where parallel data needs to be transmitted serially.

### Parameters:
- `N`: Width of the shift register (default is 3 bits, but can be customized)

### Inputs:
- `in`: Parallel input data (width is `N` bits)
- `clk`: Clock signal to synchronize the shifting process
- `reset`: Reset signal to clear the register
- `load`: Control signal to load the parallel data into the register

### Outputs:
- `out`: Serial output (bit-by-bit), corresponding to the least significant bit (LSB) of the register

### Functionality:
1. On every rising edge of the clock signal (`clk`):
    - **If `reset` is high**, the shift register is cleared (`y` is set to all zeros).
    - **If `load` is high**, the input data `in` is loaded into the shift register `y`.
    - **Otherwise**, the data in the register `y` is shifted left by one bit, with a `0` being inserted at the MSB (most significant bit), and the LSB (least significant bit) being shifted out to the `out` signal.

## Advantages of PISO Shift Registers:

1. **Serial-to-Parallel Conversion**: PISO registers are crucial in systems where parallel data must be transmitted serially. This is common in communication protocols such as UART, SPI, etc.
2. **Reduced Number of Wires**: Since data is transmitted serially, the number of transmission lines or wires needed is significantly reduced.
3. **Scalable**: The register width (`N`) can be adjusted according to the requirement, making it flexible for different data sizes.
4. **Simple and Efficient**: The PISO shift register allows simple, efficient handling of parallel-to-serial conversion, especially in FPGA and ASIC designs.

## Applications:
1. **Data Transmission**: Used in communication systems that require the conversion of parallel data into serial format (e.g., UART, SPI).
2. **Data Shifting**: Useful for shifting data in systems where you need to move bits from parallel to serial.
3. **Serial Communication Interfaces**: PISO shift registers are used in communication interfaces to send parallel data through serial lines.
4. **IO Expansion**: Helpful in applications where multiple devices communicate over a single serial line, expanding the number of outputs while using fewer lines.
5. **Signal Processing**: Can be used in digital signal processing (DSP) systems to serialize parallel data for more efficient transmission.

## Timing Considerations:
- The timing of the `load`, `reset`, and shifting operations are controlled by the clock signal (`clk`).
- The shifting operation completes in `N` clock cycles for an `N`-bit input.
- Ensure the clock frequency is within the limits of your system to avoid timing violations.

## Conclusion:
The PISO Shift Register is a fundamental component for parallel-to-serial data conversion in many digital communication systems. Its simplicity, efficiency, and scalability make it a key building block in FPGA designs, communication interfaces, and signal processing applications.
