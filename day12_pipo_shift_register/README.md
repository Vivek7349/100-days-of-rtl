
# 260226-pipo-shift-register

## PIPO Shift Register

### Description
A **Parallel In Parallel Out (PIPO)** shift register is a simple digital storage element that allows parallel input and parallel output of data. It captures input data in parallel (multiple bits at once) and outputs the data simultaneously, making it ideal for high-speed applications where parallel processing is required.

#### Parameters:
- `N`: Width of the shift register (default is 4 bits, but can be customized)

#### Inputs:
- `clk`: Clock signal
- `reset`: Reset signal to clear the register
- `in`: Parallel input data (width is `N`)

#### Outputs:
- `out`: Parallel output data (width is `N`)

#### Functionality:
The register captures the input data on each rising edge of the clock. When the `reset` signal is active, the output is cleared. Otherwise, the output will hold the value of the parallel input.

### Code:

```verilog
module pipo_shift_register (clk, reset, in, out);
    parameter N = 4;
    input clk;
    input reset;
    input [N-1:0] in;
    output out;

    reg [N-1:0] out;

    always @(posedge clk) begin
        if (reset)
            out <= {N{1'b0}};  // Reset the output
        else
            out <= in;  // Load input to output
    end

endmodule
```

## SIPO Shift Register

### What is a SIPO Shift Register?
A **Serial-In Parallel-Out (SIPO) Shift Register** is a sequential digital circuit that:
- Accepts data **one bit at a time** (serial input)
- Shifts the data on every clock pulse
- Produces the stored data simultaneously on multiple output lines (parallel output)

It is used to convert serial data streams into parallel data format.

### Working Principle:
1. On every rising clock edge:
    - The incoming serial bit enters the first flip-flop.
    - Previously stored bits shift to the next stage.
2. After N clock cycles:
    - The N-bit register contains the complete parallel word.

Example (4-bit SIPO):

| Clock Cycle | Serial In | Register Content (Q3 Q2 Q1 Q0) |
|-------------|-----------|--------------------------------|
| 1           | 1         | 0001                           |
| 2           | 0         | 0010                           |
| 3           | 1         | 0101                           |
| 4           | 1         | 1011                           |

After 4 cycles, parallel output = 1011

### RTL Design Concept:
A SIPO register is implemented using:
- N D Flip-Flops
- Connected in cascade
- Driven by a common clock
- Optional reset logic

Core idea:
```verilog
Q <= {Q[N-2:0], serial_in};
```

This shifts left and inserts new data at LSB.

### Key Features:
- Sequential circuit (clock dependent)
- Data moves one stage per clock
- Output available in parallel
- Simple scalable architecture

### Advantages:
1. **Serial to Parallel Conversion**: Used when receiving serial communication data (UART, SPI, etc.)
2. **Hardware Efficiency**: Reduces the number of input wires (only 1 serial line needed).
3. **Scalable**: Can be parameterized for any width.
4. **Synchronous Operation**: Fully controlled by clock, ensuring predictable timing behavior.

### Applications:
- Communication receivers
- Data buffering
- LED drivers
- IO expansion
- Embedded systems interfaces

### Timing Considerations:
- Maximum clock frequency depends on flip-flop setup and hold times.
- Shift operation completes in N clock cycles for an N-bit word.
- Registering outputs ensures glitch-free behavior.

## Conclusion:
Shift registers, both PIPO and SIPO, are fundamental components in digital logic design. PIPO registers are used for parallel data input and output, while SIPO registers are essential for serial to parallel data conversion. Both are widely applicable in digital communication, buffering, and interface logic systems.
