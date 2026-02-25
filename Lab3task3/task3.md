# Lab 3 Task 3: Pipelining & Optimization

## Objective
Replace `array_mult_6bit` with two sub-modules (`multA.v` and `multB.v`), insert pipeline registers to partition the critical path, and achieve a shorter clock period of **5.5ns** (181.8 MHz vs 111.1 MHz — a 64% improvement).

---

## Why Pipelining is Needed

The `array_mult_6bit` has a critical path of **15 full-adder delays** running diagonally through all 5 adder rows (top-right FA to P11 at bottom-left). This limits the clock to 9ns.

The fix: split the multiplier into two halves and insert a register between them. Each half's critical path fits within 5.5ns.

```
multA: ~10 FA delays (rows for a[3:0])
multB: ~9  FA delays (rows for a[5:4])
```

---

## New Pipeline Structure

```
a, b ──[FF stage 1]──► a_r1, b_r1 ──► multA ──► Pa[9:0]
                                                      │
                                              [FF stage 2]
                                                      │
              a_r2, b_r2, Pin[9:0] ◄──────────────────
                        │
                        ▼
                      multB ──► Pb[11:0] ──[FF output]──► result
```

- **Stage 1 regs:** `a_r1`, `b_r1` — sample raw inputs
- **Stage 2 regs:** `a_r2`, `b_r2`, `Pin` — hold stage 1 data and multA's output
- **Output reg:** `result` — holds multB's output

---

## Understanding multA and multB

### `multA.v` — handles `a[3:0]`, outputs `[9:0] P`

Computes partial products PP0–PP3 and stops after 3 adder stages:
```
Isum1 = PP1 + PP0
Isum2 = PP2 + Isum1[6:1]
P[9:3] = PP3 + Isum2[6:1]     ← upper bits passed to next stage
P[2:0] = {Isum2[0], Isum1[0], pp0[0]}  ← LSBs passed straight through
```

Note: `multA` only uses `a[3:0]` — `a[5:4]` are unused (explains the synthesis warning).

### `multB.v` — handles `a[5:4]`, takes `[9:0] Pin` from multA, outputs `[11:0] P`

Picks up where multA left off:
```
Isum4   = PP4 + Pin[9:4]       ← Pin's upper bits are the carry-in from multA
P[11:5] = PP5 + Isum4[6:1]
P[4:0]  = {Isum4[0], Pin[3:0]} ← Pin's lower bits pass straight through
```

Note: `multB` only uses `a[5:4]` — `a[3:0]` are unused (explains the synthesis warning).

---

## Vivado Setup

1. Create a **new project** in Vivado with the same Basys 3 settings (`xc7a35tcpg236-1`)
2. Add design sources: `multA.v`, `multB.v`, and the modified `AM_top.v` (renamed to `AMP_top`)
3. Add constraints: `Lab3.xdc`

---

## Code Changes: AM_top.v → AMP_top

### 1. Rename the module
```verilog
module AMP_top (input clk, rst, input [5:0] a, b, output reg [11:0] result);
```
The testbench uses `AMP_top uut (` for Task 3.

### 2. Replace declarations
Remove the old `array_mult_6bit` wire and instance. Add:
```verilog
// Stage 1 pipeline registers (inputs to multA)
reg  [5:0]  a_r1, b_r1;

// Stage 2 pipeline registers (inputs to multB)
reg  [5:0]  a_r2, b_r2;
reg  [9:0]  Pin;          // holds multA output between pipeline stages

// Module outputs — declared as wire (combinational)
wire [9:0]  Pa;           // multA combinational output
wire [11:0] Pb;           // multB combinational output
```

### 3. Instantiate both modules
```verilog
multA uA (.a(a_r1), .b(b_r1), .P(Pa));
multB uB (.a(a_r2), .b(b_r2), .Pin(Pin), .P(Pb));
```

### 4. Rewrite the always block
```verilog
always @ (posedge clk)
    if (rst)
    begin
        a_r1   <= 0;
        b_r1   <= 0;
        a_r2   <= 0;
        b_r2   <= 0;
        Pin    <= 0;
        result <= 0;
    end
    else
    begin
        // Stage 1: load from inputs
        a_r1 <= a;
        b_r1 <= b;
        // Stage 2: shift stage-1 forward + capture multA output
        a_r2 <= a_r1;
        b_r2 <= b_r1;
        Pin  <= Pa;
        // Output: register multB result
        result <= Pb;
    end
```

---

## Update the Constraints File

Change the clock period in `Lab3.xdc`:
```
create_clock -add -name sys_clk_pin -period 5.5 -waveform {0 2.75} [get_ports clk]
```

---

## Synthesis

Run synthesis. You will see these warnings — **both are safe to ignore**:
```
WARNING: [Synth 8-3331] design multB has unconnected port a[3] (5 more like this)
WARNING: [Constraints 18-5210] No constraints selected for write.
```
These warnings exist because multA ignores `a[5:4]` and multB ignores `a[3:0]` by design.

Open **Report Timing Summary** → verify timing is met at 5.5ns.

### Timing Improvement

| Design | Clock Period | Frequency |
|--------|-------------|-----------|
| Non-pipelined (Task 1) | 9ns | 111.1 MHz |
| Pipelined (Task 3) | 5.5ns | 181.8 MHz |
| **Improvement** | | **+64%** |

> **IMPORTANT:** Screenshot the **Design Timing Summary** window — required for assessment.

---

## Simulation

Use the same `AM_top_tb.v` testbench — just change the instantiation line to:
```verilog
AMP_top uut (
```

### Add these signals to the waveform
- `a_r1`, `b_r1`, `a_r2`, `b_r2`, `Pin` (the 5 pipeline register outputs)
- Add a divider, then `Pa` and `Pb` below it
- Move `result[11:0]` to the bottom
- Set radix to **Signed Decimal**

---

## 2-Cycle Latency (vs 1-cycle in Task 2)

Result now takes **2 clock cycles** to appear after inputs are applied:

| Clock edge | a_r1 | b_r1 | a_r2 | b_r2 | result |
|-----------|------|------|------|------|--------|
| 1 | 0 | 0 | 0 | 0 | 0 |
| 2 | 7 | 14 | 0 | 0 | 0 |
| 3 | −2 | 14 | 7 | 14 | 0 |
| 4 | 21 | −28 | −2 | 14 | **98** (= 7×14) |
| 5 | −13 | −28 | 21 | −28 | **−28** (= −2×14) |

Compare to Task 2: result appeared at edge 3. Here it appears at edge 4 — one cycle later.

---

## Why is result non-zero just after reset?

This is a **trap** that tests whether you reset ALL pipeline registers.

In the `if (rst)` block you must clear **all 6 signals**:
`a_r1`, `b_r1`, `a_r2`, `b_r2`, `Pin`, and `result`.

If you forget any of the stage-2 registers (e.g., only reset `a_r1`, `b_r1`, `result` like the original `AM_top`), those forgotten registers start in an **undefined (`X`) state**. That X propagates through the combinational logic of multA/multB into `result`, displaying as an apparently non-zero value right after reset is de-asserted.

**The fix:** make sure every register declared is listed in the `if (rst)` block and set to 0.

---

## Done?
- [ ] New Vivado project created
- [ ] `multA.v`, `multB.v`, modified `AMP_top` added as sources
- [ ] Both modules instantiated under `AMP_top` in the hierarchy
- [ ] Synthesis passes (ignored warnings are expected)
- [ ] WNS > 0 at 5.5ns clock — timing constraints met
- [ ] Screenshot of Design Timing Summary saved
- [ ] Simulation shows correct results with 2-cycle latency
- [ ] All 5 pipeline register signals visible in waveform
- [ ] Can explain why result is non-zero after reset if regs aren't fully cleared

Show the pipelined simulation to your lab supervisor to complete the lab.
