## No Data Forwarding — The Hazard Problem

### What forwarding would do
In a processor with forwarding, the ALU result from EX is **fed directly back** to the next instruction's ALU input, without waiting for it to reach the register file.

### What happens without it (uP16)
Consider the two consecutive adds at PC=0x0015:

```
Instruction 1:  add r3, r1     → RF[3] = RF[3] + RF[1]  (= 0x0002 + 0x0001 = 0x0003)
Instruction 2:  add r5, r3     → RF[5] = RF[5] + RF[3]  (should use 0x0003)
```

Cycle-by-cycle breakdown:

```
Cycle:       1     2     3     4     5     6
Inst 1:     [IF]  [ID]  [EX]  [Mem] [WB -> RF[3]=0x0003 written HERE]
Inst 2:            [IF]  [ID]  [EX]  [Mem] [WB]
                          ^
                   ID reads RF[3] HERE -> still sees OLD value 0x0002!
```

- Inst 2 reads RF[3] in its **ID stage** (cycle 3)
- Inst 1 doesn't write RF[3] until its **WB** (cycle 5)
- So Inst 2's ALU uses the **stale 0x0002** instead of the correct **0x0003**
- Result: RF[5] = 0xFFFF + 0x0002 = **0x0001** instead of the correct 0x0002

### Observing this in simulation
- RF[5] changes to **0x0001** (wrong) instead of 0x0002
- Adding `ALUData1` and `ALUData2` to the simulation directly shows the stale value being fed into the ALU
- Earlier errors also exist — check PC=12 and PC=13 for more examples

### Real-world solutions
| Solution | Description |
|----------|-------------|
| Data forwarding/bypassing | Extra wires routing results back to the ALU before writeback |
| Pipeline stalls (bubbles) | Hardware inserts NOPs automatically to wait for writeback |
| Out-of-order execution | Instructions reordered to avoid the conflict entirely |

The uP16 implements none of these, making the RAW (Read After Write) hazard directly visible in simulation.