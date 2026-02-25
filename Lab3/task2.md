# Lab 3 Task 2: Non-Pipelined Simulation

## Objective
Run a behavioural simulation of `AM_top` using `AM_top_tb.v` to verify the multiplier produces correct 2's complement results, and observe the **1 clock cycle latency** in the waveform.

---

## Vivado Setup

1. **Close** the Synthesized Design window (if open)
2. **Add Sources → Add or create simulation sources → Next → Add Files**
   - Select `AM_top_tb.v` → OK → Finish
3. In **Simulation Sources**, confirm `AM_top_tb` is the top module
4. Click **Run Simulation → Run Behavioural Simulation**

---

## Adding Hidden Signals to the Waveform

`a_r` and `b_r` are internal registers inside `AM_top` — they won't appear in the waveform by default.

To add them:
1. In the **Scope** panel (left side), click on `uut` (the AM_top instance)
2. In the **Objects** panel, find `a_r` and `b_r`
3. Drag both into the waveform **Name** area
4. Drag `result[11:0]` to the **bottom** of the signal list
5. Click **Restart** then **Run All** (or **Relaunch**)
6. Right-click any value → set radix to **Signed Decimal**

---

## Understanding the 1 Clock Cycle Latency

All three registers in `AM_top.v` update on the **same clock edge**:

```verilog
always @ (posedge clk)
    begin
        a_r    <= a;   // registers the input
        b_r    <= b;   // registers the input
        result <= P;   // P is computed from the OLD a_r, b_r
    end
```

`P` is a combinational wire — it always equals `a_r × b_r`. But since `a_r` and `result` update on the **same edge**, `result` captures P **before** `a_r` and `b_r` have changed. So:

```
Clock edge N:    a_r ← a,  b_r ← b,  result ← (old a_r × old b_r)
                                       ↑ still the PREVIOUS product

Between edges:   P updates combinationally = new a_r × new b_r

Clock edge N+1:  result ← P = new a_r × new b_r  ✓
```

**Result is always 1 clock cycle behind a_r and b_r.**

---

## Expected Waveform Values

Testbench clock period = 10ns (`always #5 clk=~clk`). Inputs change every 10ns.

| Clock edge | a_r | b_r | result (= prev a_r × prev b_r) |
|------------|-----|-----|-------------------------------|
| 1 | 0 | 0 | 0 |
| 2 | 7 | 14 | 0 (= 0 × 0) |
| 3 | −2 | 14 | **98** (= 7 × 14) |
| 4 | 21 | −28 | **−28** (= −2 × 14) |
| 5 | −13 | −28 | **−588** (= 21 × −28) |
| 6 | 0 | 31 | **364** (= −13 × −28) |
| 7 | −32 | −32 | **0** (= 0 × 31) |
| 8 | −32 | 31 | **1024** (= −32 × −32) |
| 9 | 31 | 31 | **−992** (= −32 × 31) |
| 10 | −32 | 0 | **961** (= 31 × 31) |

These are the corner cases for a 6-bit signed multiplier (range −32 to +31).

---

## Why the `$display` Output Looks "Off"

The testbench prints `result` at the **same moment** it sets new `a` and `b` — no delay between them:

```verilog
#10; a=7; b=14;
$display("%b x %b is: %b", a, b, result);  // result still shows 0×0 = 0
```

So each printed line shows the result from the **previous** input pair. This is expected — the waveform makes the 1-cycle shift much easier to see than the console output.

---

## Done?
- [ ] Simulation runs without errors
- [ ] `a_r` and `b_r` added to waveform and aligned to clock edges
- [ ] `result[11:0]` moved to the bottom
- [ ] Radix set to Signed Decimal
- [ ] Waveform results match the expected values table above
- [ ] `result` is visibly delayed by 1 clock cycle relative to `a_r` / `b_r`

Close the simulation window and proceed to **Task 3** (pipelining).
