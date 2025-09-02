# 32-bit CPU Instruction Set Documentation

## Standard Command Format
Each instruction consists of **32 bits**.  
- **First 8 bits** → **Command ID**  
- **Next fields** → Command-specific parameters (register indexes, immediate values, etc.)  

> All registers are addressed using **8-bit register IDs** (`xxxxxxxx`), allowing up to **256 registers**.  

---

## Legend
- `x` → Register index (8 bits)  
- `y` → Register index (8 bits)  
- `iiiiiiii` → Immediate value (8 bits unless specified)  
- `[IMM32]` → Extra 32-bit immediate word following the instruction  
- `AAAAAAAAAAAAAAAA` → Address (16 bits unless specified)  

---

## Instructions

### 0x00 — `jmp` — Jump to Address in Register
**Format:**  
```
00000000 xxxxxxxx ||||||||||||||||  
```
- **x:** Source register holding the address.  

**Operation:**  
Jumps to the address stored in register `x`.

---

### 0x01 — `jmpc` — Conditional Jump
**Format:**  
```
00000001 xxxxxxxx yyyyyyyy ||||||||||||||||  
```
- **x:** Condition register (first bit is checked).  
- **y:** Address register (holds jump destination).  

**Operation:**  
If the **first bit** of register `x` is `1`, jumps to the address in register `y`.

---

### 0x02 — `init` — Initialize Thread
**Format:**  
```
00000010 xxxxxxxx yyyyyyyy ||||||||||||||||  
```
- **x:** Thread index (from register `x`).  
- **y:** Start address (from register `y`).  

**Operation:**  
Starts a new thread with ID from `x` and begins execution at address in `y`.

---

### 0x03 — `intr` — Interrupt Thread
**Format:**  
```
00000011 xxxxxxxx yyyyyyyy ||||||||||||||||||  
```
- **x:** Thread index to interrupt.  
- **y:** interrupt id.  

**Operation:**  
Sends an interrupt to the specified thread.

---

### 0x04 — `idt` — Set Interrupt Descriptor Table
**Format:**  
```
00000100 xxxxxxxx ||||||||||||||||||||||||||  
```
- **x:** Register holding address of IDT.  
 
**Operation:**  
Sets the CPU's IDT pointer to the address in `x` and enables interrupts on this thread.

---

### 0x05 — `phrp` — Peripheral Command
**Format:**  
```
00000101 xxxxxxxx yyyyyyyy ||||||||||||||||  
```
- **x:** Data register.  
- **y:** Peripheral ID (8 bits).  

**Peripheral IDs:**  
```
0000 → Serial Output  
0001 → Serial Input  
0010 → Timer  
... (extend as needed)
```

---

### 0x06 — `read` — Memory Read
**Format:**  
```
00000110 xxxxxxxx yyyyyyyy ||||||||||||||||  
```
- **x:** Destination register.  
- **y:** Register containing source address.  

**Operation:**  
Reads value from memory at address in `x` into `y`.

---

### 0x07 — `write` — Memory Write
**Format:**  
```
00000111 xxxxxxxx yyyyyyyy ||||||||||||||||  
```
- **x:** Register containing destination address.  
- **y:** Source register.  

**Operation:**  
Writes value from `y` to memory at address in `x`.

---

### 0x08 — `cp` — Copy Register
**Format:**  
```
00001000 xxxxxxxx yyyyyyyy ||||||||||||||||  
```
- **x:** Destination register.  
- **y:** Source register.  

**Operation:**  
Copies value from `x` registry into `y` registry.

---

### 0x09 — `clr` — Clear Register
**Format:**  
```
00001001 xxxxxxxx ||||||||||||||||||||||||||  
```
- **x:** Target register.  

**Operation:**  
Sets the value of register `x` to `0`.

---

### 0x0A — `set` — Load Immediate 32-bit Value
**Format:**  
```
00001010 xxxxxxxx [IMM32]  
```
- **x:** Target register.  
- **[IMM32]:** 32-bit constant to store.  

**Operation:**  
Loads a full 32-bit constant into register `x`. This instruction uses an extra 32-bit word after the opcode.

---

### 0x0B — `pgt` — Set Page Table Address
**Format:**  
```
00001011 xxxxxxxx ||||||||||||||||||||||||||  
```
- **x:** Register holding base address of page table.  

**Operation:**  
Sets the CPU's page table base to the address in `x`.

---

## Math Operations

| Command | ID   | Format                                         | Description |
|---------|------|------------------------------------------------|-------------|
| `add`   | 0x10 | `00010000 xxxxxxxx yyyyyyyy`                    | `x = x + y` |
| `sub`   | 0x11 | `00010001 xxxxxxxx yyyyyyyy`                    | `x = x - y` |
| `div`   | 0x12 | `00010010 xxxxxxxx yyyyyyyy`                    | `x = x / y` |
| `mul`   | 0x13 | `00010011 xxxxxxxx yyyyyyyy`                    | `x = x * y` |
| `mod`   | 0x14 | `00010100 xxxxxxxx yyyyyyyy`                    | `x = x % y` |
| `abs`   | 0x16 | `00010110 xxxxxxxx`                             | `x = abs(x)`   |
| `neg`   | 0x15 | `00010101 xxxxxxxx`                             | `x = -x`    |

---

## Bitwise Operations

| Command | ID   | Format                                         | Description |
|---------|------|------------------------------------------------|-------------|
| `and`   | 0x20 | `00100000 xxxxxxxx yyyyyyyy`                    | `x = x & y` |
| `or`    | 0x21 | `00100001 xxxxxxxx yyyyyyyy`                    | `x = x \| y` |
| `xor`   | 0x22 | `00100010 xxxxxxxx yyyyyyyy`                    | `x = x ^ y` |
| `not`   | 0x23 | `00100011 xxxxxxxx`                             | `x = ~x`    |
| `shr`   | 0x24 | `00100100 xxxxxxxx yyyyyyyy`                    | `x = x >> y`|
| `shl`   | 0x25 | `00100101 xxxxxxxx yyyyyyyy`                    | `x = x << y`|

---

## Comparison Operations
> All comparisons store the result (`0` or `1`) into register `z`.

| Command | ID   | Format                                         | Description |
|---------|------|------------------------------------------------|-------------|
| `eq`    | 0x30 | `00110000 xxxxxxxx yyyyyyyy zzzzzzzz`                 | `z = (x == y)` |
| `gte`   | 0x31 | `00110001 xxxxxxxx yyyyyyyy zzzzzzzz`                   | `z = (x >= y)` |
| `lte`   | 0x32 | `00110010 xxxxxxxx yyyyyyyy zzzzzzzz`                    | `z = (x <= y)` |
| `lt`    | 0x33 | `00110011 xxxxxxxx yyyyyyyy zzzzzzzz`                    | `z = (x < y)`  |
| `gt`    | 0x34 | `00110100 xxxxxxxx yyyyyyyy zzzzzzzz`                    | `z = (x > y)`  |

---

## CPU Waiting

### 0x35 — `halt` — Halt CPU Until Interrupt
**Format:**  
```
00110101 ||||||||||||||||||||||||||||||||||  
```
- **No operands**  

**Operation:**  
Stops CPU execution until the next interrupt is received.

---

### 0x36 — `sleep` — Wait for Fixed Number of Cycles
**Format:**  
```
00110110 xxxxxxxx ||||||||||||||||||||||||||  
```
- **x:** Register containing number of cycles to wait.  

**Operation:**  
Suspends execution for the number of cycles specified in `x`.

---

## Special

### 0x37 — `rng` —  Random Number Generation
**Format:**  
```
00110111 xxxxxxxx yyyyyyyy zzzzzzzz ||  
```
- **x:** Destination register.  

- **y:** min value register.  


- **z:** max value register.  

**Operation:**  
Generates a random 32-bit number in range `y` - `z` and stores it in `x`.


### 0x38 — `syscall` — Perform System Call
**Format:**  
00111000 xxxxxxxx yyyyyyyy ||||||||||||||||  

- **x:** Register containing system call index.  
- **y:** Register containing pointer to argument block (optional, OS-defined).  

---

## Special registers:
255 -> Stack frame pointer
254 -> Stack head pointer





