# machine and assembly languages, registers, math

## machine and assembly languages

programming languages today are built on top of many layers of abstraction. they
are usually categorized from high-level to low-level. a language like
[applescript](https://en.wikipedia.org/wiki/AppleScript) would be considered
high-level, since it is closer to human language; and an assembly/machine
language would usually be on the lowest level.

### machine language

a **machine _instruction_** is a single command to a computer. it says what
things to do and what to do it to. for example:

- "add X to Y"
- "go to step X"
- "put the result of instruction X to Y"

a **machine _language_**, on the other hand, is the binary encoding of these
instructions. it is a compact representation that makes it easy for the computer
to read and evaluate.

### assembly language

an **assembly language** is a human-readable, textual representation of machine
language. its _almost_ an one-to-one mapping between machine instructions and
assembly instructions; and the **assembler** tool does the actual translation
between assembly and machine instruction.

## risc-v

### architecture

risc-v uses a load-compute-store model. it can only do things like:

- load code out of memory
- take data out of memory
- put data into memory
- do math or logic conditions
- jump
- jump with condition

even though this seems miniscule, it is turing-complete; meaning it can solve any computationally solvable problem.

### registers

registers are small, extremely fast temporary storage inside the cpu. in this
course, we learn the RV32I instruction set, which have 32 registers, each 32
bits wide. think of registers like hands, and the memory is a box of blocks.
hands are technically a variable, and they move fast -- however, they can't hold
much (or large) items.

| register | abi name | description                      | saver  |
| -------- | -------- | -------------------------------- | ------ |
| `x0`     | `zero`   | hand-wired zero                  | n/a    |
| `x1`     | `ra`     | return address                   | caller |
| `x2`     | `sp`     | stack pointer                    | callee |
| `x3`     | `gp`     | global pointer                   | n/a    |
| `x4`     | `tp`     | thread pointer                   | n/a    |
| `x5-7`   | `t0-2`   | temporaries                      | caller |
| `x8`     | `s0/fp`  | saved register/frame pointer     | callee |
| `x9`     | `s1`     | saved register                   | callee |
| `x10-11` | `a0-1`   | function arguments/return values | caller |
| `x12-17` | `a2-7`   | function arguments               | caller |
| `x18-27` | `s2-11`  | saved registers                  | callee |
| `x28-31` | `t3-6`   | temporaries                      | caller |

#### common registers

out of all those registers listed above, we commonly use these ones:

- `a0, a1, ..., a7`: these are arguments. example: `foo(1, 2, 3, 4)`
- `a0, a1`: results. example: `return 42;`
- `t0, t1, ..., t6`: temporaries
- `s0, s1, ..., s11`: saved temporaries

#### using the registers

take the **load immediate** (`li`) instruction for example:

```riscv
li t0, 3    # t0 = 3
li t1, 5    # t1 = 5
```

the _load immediate_ instruction changes the value that the register hold.

in risc instructions, we put the destination of the register on the left.

another example is the `mv` instruction.

```riscv
li t0, 100    # t0 = 100
mv t1, t0     # t1 = 100
```

the `mv` instruction copies the value from one register to another. it does _not_ change the source register; the value is still the same in `t0`.

### math operations

in risc-v, instead of using common math symbols like `+ - * /`, we have their corresponding instructions:

```riscv
add t2, t0, t1    # t2 = t0 + t1
sub t2, t0, t1    # t2 = t0 - t1
mul t2, t0, t1    # t2 = t0 * t1
div t2, t0, t1    # t2 = t0 / t1
rem t2, t2, t1    # t2 = t2 % t1
```