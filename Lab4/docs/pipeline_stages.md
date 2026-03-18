# uP16 Pipeline Stages

## Overview

The uP16 processor has a **5-stage pipeline**, each separated by a pipeline register (a buffer that holds values between clock cycles):

```
IF → [IF/ID reg] → ID → [ID/EX reg] → EX → [EX/Mem reg] → Mem → (WB at Mem's clock edge)
```

There is no separate Write-Back stage — register writeback happens at the clock edge at the end of the **Mem stage**.

---

## Stage 1: IF (Instruction Fetch)
- Uses the **PC** to address the Instruction Memory (ROM)
- Reads the 18-bit instruction out
- Increments PC by 1 for the next cycle
- In simulation: `IF_currPC` increments from 0x0000 each cycle, and `IF_inst_d` appears **one cycle later** (it comes from the IF/ID pipeline register, not directly from memory)

## Stage 2: ID (Instruction Decode)
- Decodes the instruction's opcode and generates **control signals**
- Reads two source registers (Rd, Rs) from the Register File (combinational read)
- Computes the **sign-extended immediate** value
- In `ID_stage.v`: the control module handles instruction decoding; the regfile does combinational reads and sequential writes

## Stage 3: EX (Execute)
- The **ALU** performs the operation (add, sub, branch comparison, address calculation, etc.)
- Selects ALU inputs via muxes (S2: register vs immediate)
- Computes branch target addresses
- Memory enable/address/data signals are generated here and **bypass** the EX/Mem pipeline register directly to memory — this is why `sw`/`lw` effects appear only **2 cycles** after the instruction, not 3

## Stage 4: Mem (Memory Access)
- Executes `lw` (reads from Data Memory) or `sw` (writes to Data Memory)
- Memory is **synchronous**, so a write initiated in EX appears on `Data_out` one clock later
- Register writeback happens here on the clock edge (no separate WB stage)
- For `lw r6, r1, #0` at PC=0x0012: `Data_out` is valid at the **4th cycle** after the instruction, and RF6 updates at the **5th cycle**

---

## The 5-Cycle Result Delay

For any instruction at cycle N, the result appears in the register file at cycle **N+4** (the 5th cycle):

```
Cycle:  1    2    3    4    5
Stage: [IF] [ID] [EX] [Mem][WB <- happens here]
```

---
