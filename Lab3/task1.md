# Lab 3 Task 1: Non-Pipelined Analysis

## Objective
Synthesize the 6-bit × 6-bit 2's complement array multiplier (`array_mult_6bit.v`) and perform static timing analysis with a **9ns clock period**.

---

## Vivado Setup

### 1. Create Project
- New Project → name it `Lab3`
- Target: **Basys 3** → Part: `xc7a35tcpg236-1`
- **Use a local drive, NOT a network drive**

### 2. Add Design Sources
Add both files via **Add Sources → Add or create design sources**:
- `AM_top.v`
- `array_mult_6bit.v`

### 3. Add Constraints File
Add via **Add Sources → Add or create constraints**:
- `Lab3.xdc`

Verify the clock line in `Lab3.xdc` reads:
```
create_clock -add -name sys_clk_pin -period 9 -waveform {0 4.5} [get_ports clk]
```

---

## Run Synthesis

In the **Flow Navigator**, click **Run Synthesis**. Once complete, select **Open Synthesized Design**.

### Verify Resources
Go to **Reports → Report Utilization** (or check the synthesis report). Expected resources:

| Resource | Expected Count | Source in Code |
|----------|---------------|----------------|
| 6-bit register | 2 | `a_r`, `b_r` in `AM_top.v:23` |
| 12-bit register | 1 | `result` in `AM_top.v:23` |
| 7-bit adder | 5 | `Isum1`–`Isum4` + final P in `array_mult_6bit.v:22-27` |

If numbers differ, check that only these two `.v` files are added as sources.

---

## Timing Analysis

In **Flow Navigator → Synthesis**, click **Report Timing Summary** → click **OK**.

In the bottom panel, select the **Timing** tab.

### What to check
- **WNS (Worst Negative Slack)** — must be **positive** → timing constraints are met
- **WHS (Worst Hold Slack)** — must be **positive** → hold timing is met
- Both values should be **small positive fractions of a ns**

---

### Understanding Slack

**Slack = Time Budget − Actual Delay**

It measures how much margin you have. Positive slack = timing met. Negative slack = timing violated.

#### WNS — Setup Timing (data arrives too late?)

Every flip-flop requires data to be **stable before the clock edge** so it can be captured correctly. WNS measures the margin on the **slowest (longest) combinational path** in the design.

```
Example:
  Clock period        = 9ns
  Path delay          = 8.3ns
  FF setup time       = 0.1ns
  Slack = 9 − 8.3 − 0.1 = +0.6ns  ✓
```

- **WNS > 0** → all paths meet timing; you have `WNS` ns of margin
- **WNS < 0** → at least one path is too slow; data arrives after the clock edge → **wrong value captured**
- **WNS ≈ 0** → barely meeting timing, can't run much faster

```
Longest combinational path delay ≈ 9ns − WNS
```

For Task 1: WNS is small and positive, meaning the 5-adder chain nearly fills the entire 9ns budget (~111 MHz limit).

#### WHS — Hold Timing (data changes too soon?)

This is the opposite concern: data must **not change too quickly after** the clock edge, or the flip-flop captures a corrupted value. WHS measures the margin on the **fastest (shortest) path**.

```
Example:
  FF hold time        = 0.1ns
  Minimum path delay  = 0.4ns
  Slack = 0.4 − 0.1  = +0.3ns  ✓
```

- **WHS > 0** → data holds stable long enough after the clock edge → safe
- **WHS < 0** → data changes too fast → **flip-flop captures corrupted value**

Hold violations are typically caused by very short paths (e.g., a wire going almost directly from one FF output to another FF input with little logic in between).

#### Summary table

| | Concern | Worst-case path | Fix if violated |
|--|---------|-----------------|-----------------|
| **WNS** | Data arrives *too late* | Slowest (longest) | Longer clock period, or pipeline |
| **WHS** | Data changes *too soon* | Fastest (shortest) | Add buffers/delays |

---

### Why the combinational path is slow
The critical path in `array_mult_6bit.v` runs through all **5 adder stages in series** (from the top-right full adder to `P[11]` at the bottom left) — a total of **15 full-adder delays**. This is the bottleneck Task 3 fixes with pipelining.

---

## Screenshot Required
> **IMPORTANT:** Use a snipping tool to save a copy of the **"Design Timing Summary"** window. This is required for assessment.

---

## Understanding the Code

### `AM_top.v` — the registered wrapper
```
inputs (a, b) → [registers a_r, b_r on clk] → array_mult_6bit → [register result on clk]
```
- Inputs are sampled on the rising clock edge into `a_r` and `b_r`
- The combinational multiplier computes `P` from `a_r`, `b_r`
- `result` captures `P` on the next rising edge
- **Net effect: 1 clock cycle of latency**

### `array_mult_6bit.v` — Baugh-Wooley multiplier
Implements 6×6 two's complement multiplication using the **Baugh-Wooley algorithm**. The partial products are manipulated to avoid sign extension:

| Row | Partial Product | Rule |
|-----|----------------|------|
| PP0 (a[0]) | `{1'b1, ~pp0[5], pp0[4:1]}` | Prepend 1, invert MSB; send `pp0[0]` → `P[0]` |
| PP1–PP4 (a[1]–a[4]) | `{~ppN[5], ppN[4:0]}` | Invert MSB only |
| PP5 (a[5], sign bit) | `{1'b1, pp5[5], ~pp5[4:0]}` | Invert lower bits, prepend 1 |

The prepended `1` bits and the inversions are correction terms that account for the **negative weight of the MSB** in two's complement — no separate sign extension needed.

---

## Done?
- [ ] Synthesis completed with no errors
- [ ] Resource counts match expected (2×6-bit reg, 1×12-bit reg, 5×7-bit adder)
- [ ] WNS > 0 and WHS > 0 in Timing Summary
- [ ] Screenshot of Design Timing Summary saved

Proceed to **Task 2** (behavioural simulation).
