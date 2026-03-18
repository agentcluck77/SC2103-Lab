# ID Stage (`ID_stage.v`)

The ID (Instruction Decode) stage contains three components:
1. **Reg_File** — the 8-entry register file
2. **Control** — the combinational control signal generator
3. **Sign extension** — a single-line immediate sign extender

---

## Reg_File Module (line 90)

```verilog
reg [DSIZE-1:0] RegFile[0:7];  // 8 registers, each 16-bit
```

### Read (Combinational)
```verilog
assign ReadData1_Out = RegFile[ReadReg1_In];
assign ReadData2_Out = RegFile[ReadReg2_In];
```
- Both reads are **pure wires** — no clock involved
- The moment `ReadReg1_In` or `ReadReg2_In` changes, the output changes instantly
- This is why the ID stage can read registers and pass them to EX in the same cycle

### Write (Sequential)
```verilog
always @ (posedge Clk)
    if(Rst) // reset all registers to 0
    else
        RegFile[WriteReg_In] <= ((Write_Enab == 1) && (WriteReg_In != 0)) ? WriteData_In : RegFile[WriteReg_In];
```
- Write only happens on a **rising clock edge**
- Two guards before writing:
  1. `Write_Enab == 1` — control signal must permit it
  2. `WriteReg_In != 0` — **enforces R0 = 0** (writing to R0 is silently ignored)
- If either guard fails, the register retains its current value

### How the address wires connect (lines 78–80)
```verilog
assign RR1_rd      = inst[13:11];   // Rd → read port 1
assign RR2_rs      = inst[10:8];    // Rs → read port 2
assign WB_dest_rd  = inst[13:11];   // Rd → forwarded to WB stage for writeback
```
Both the read address and the eventual write-back destination come from `inst[13:11]` (the Rd field of the instruction).

---

## Control Module (line 124)

A **purely combinational** block (`always @*`) that decodes the opcode and drives all control signals for the rest of the pipeline.

### Default values (set at the top of every evaluation)

| Signal | Default | Meaning |
|--------|---------|---------|
| `ALUop` | `4'b0000` | NOP |
| `PC_select` | `0` | PC = PC+1 (no branch) |
| `sel_ALUsrc1` | `0` | ALU input from register |
| `mem2Reg` | `0` | Writeback from ALU result |
| `RFwriteEnab` | `1` | Write to register file (default ON) |
| `memWriteEnab` | `0` | No memory write |
| `memEnab` | `0` | Memory disabled |

Everything defaults to a normal ALU instruction that writes back to the register file. The case statement then overrides only what needs to change.

### Case statement — opcode by opcode

**OP0 (0x00) — ALU instructions** (`add`, `sub`, `and`, `or`, etc.)
```verilog
ALUop = inst[3:0];   // function field directly becomes ALU opcode
```
All defaults remain. The 4-bit function field at the bottom of the instruction selects the ALU operation.

---

**LW (0x01) — Load Word**
```verilog
ALUop       = 4'b0001;  // ALU adds Rs + immed to compute memory address
sel_ALUsrc1 = 1'b1;     // use sign-extended immediate as ALU input
mem2Reg     = 1'b1;     // writeback comes from memory output, not ALU
memEnab     = 1'b1;     // enable memory read
```
`RFwriteEnab` stays 1 — the loaded value is written back to Rd.

---

**SW (0x02) — Store Word**
```verilog
ALUop        = 4'b0001;  // ALU adds Rs + immed to compute memory address
sel_ALUsrc1  = 1'b1;     // use immediate
memWriteEnab = 1'b1;     // write to memory
memEnab      = 1'b1;     // enable memory
RFwriteEnab  = 1'b0;     // NO register writeback (store does not update RF)
```

---

**LLI (0x03) — Load Lower Immediate**
```verilog
ALUop       = 4'b1011;  // ALU flows the immediate value straight through
sel_ALUsrc1 = 1'b1;     // immediate is the ALU input
```
The sign-extended 8-bit immediate passes through the ALU unchanged into Rd.

---

**LUI (0x04) — Load Upper Immediate**
```verilog
ALUop       = 4'b1100;  // special ALU op: {immed, RF[rs][7:0]}
sel_ALUsrc1 = 1'b1;
```
The ALU combines the immediate with the lower 8 bits of Rs. Used together with `lli` to load a full 16-bit constant: `lli` sets the lower byte, `lui` sets the upper byte.

---

**ADDI (0x05) — Add Immediate**
```verilog
ALUop       = 4'b0001;  // ADD
sel_ALUsrc1 = 1'b1;     // immediate as one input, Rs as the other
```

---

**Branch instructions (BEQ / BNE / BLT / BGT)**
```verilog
// Example: BEQ
PC_select   = (readData1 == readData2) ? 1'b1 : 1'b0;
RFwriteEnab = 1'b0;   // branches never write to RF
```
- The branch **decision is made right here in ID**, using register values that are already available combinationally from the RegFile
- `PC_select = 1` causes the IF stage to use the branch target (`PCplus1 + sign_ext(immed)`) instead of PC+1
- All four branches work the same way with different comparisons:

| Instruction | Condition |
|-------------|-----------|
| `beq` | `readData1 == readData2` |
| `bne` | `readData1 != readData2` |
| `blt` | `readData1 < readData2` |
| `bgt` | `readData1 > readData2` |

---

**Default (reserved opcodes 0x6–0x7, 0xC–0xF)**
```verilog
ALUop       = 4'b0000;
RFwriteEnab = 1'b0;   // reserved opcodes must NOT write back
```

---

## Sign Extension (line 76)

```verilog
assign signE_8immed = {{8{inst[7]}}, inst[7:0]};
```

### What it does

Takes the **8-bit immediate** from the instruction (`inst[7:0]`) and stretches it to a **16-bit value** by replicating the most significant bit (bit 7) into the upper 8 bits.

### Breaking down the syntax

```
{{8{inst[7]}}, inst[7:0]}
  ───────────  ─────────
  upper 8 bits  lower 8 bits
```

- `inst[7:0]` — the original 8-bit immediate, placed in the **lower byte**
- `inst[7]` — the **sign bit** (MSB) of the immediate
- `{8{inst[7]}}` — replicate that sign bit **8 times** to fill the upper byte
- The outer `{...}` **concatenates** the two parts into a 16-bit value

### Why replicate the sign bit?

Because the uP16 uses **signed arithmetic**. In two's complement:

| `inst[7]` | Meaning | Upper byte filled with |
|-----------|---------|----------------------|
| `0` | Positive number | `00000000` |
| `1` | Negative number | `11111111` |

This preserves the **numeric value** when widening the type. Examples:

```
inst[7:0] = 0x71  (0111 0001) → sign bit = 0 → signE_8immed = 0x0071  (+113)
inst[7:0] = 0xFF  (1111 1111) → sign bit = 1 → signE_8immed = 0xFFFF  (-1)
inst[7:0] = 0x80  (1000 0000) → sign bit = 1 → signE_8immed = 0xFF80  (-128)
```

This is exactly what the lab observes — `lli r3, 0xFF` loads `0xFFFF` into RF[3], not `0x00FF`.

### Where the result is used

```verilog
assign alt_PC_o = PCplus1 + signE_8immed;   // branch target address
```
And it is passed to the EX stage as the immediate input to the ALU (for `lw`, `sw`, `addi`, `lli`, `lui`).

---

## How the three components connect

```
Instruction bits [17:0]
        │
        ├─[17:14]──→ Control → generates all control signals
        │                 │
        │            reads readData1, readData2 for branch decisions
        │
        ├─[13:11]──→ Reg_File read port 1 (Rd) ──→ readData1 ──→ Control + EX
        ├─[10:8] ──→ Reg_File read port 2 (Rs) ──→ readData2 ──→ Control + EX
        ├─[13:11]──→ WB_dest_rd (forwarded through pipeline to WB)
        └─[7:0]  ──→ sign extender ──→ signE_8immed ──→ EX (as ALU immediate input)
                                                      ──→ branch target calc (PCplus1 + signE_8immed)
```

The key insight is that **branches are resolved in ID**, not EX. Because the RegFile reads are combinational, `readData1` and `readData2` are available immediately, allowing the Control module to set `PC_select` within the same cycle — so the branch target is known by the end of the ID stage, just one cycle after fetch.
