# Memory Modeling Using Verilog

## Overview
This project demonstrates RAM and ROM modeling
using Verilog HDL.

## Features
- 16 x 8-bit RAM
- 16 x 8-bit ROM
- Synchronous RAM write and read
- Combinational ROM read
- Testbench for functional verification

## Tools
- Verilog HDL
- Icarus Verilog / ModelSim
- GTKWave (optional)

## Simulation
Compile the design and testbench using Icarus Verilog:

    iverilog -o memory_sim memory_model.v testbench.v

Run the simulation:

    vvp memory_sim

## Expected Results
RAM TEST PASSED
ROM TEST PASSED

## Learning Outcomes
- Memory modeling in Verilog
- Synchronous and combinational logic
- Testbench development
- Functional simulation