# numerical representation

numbers in computers are represented using number systems; and
understanding these systems are helpful when we with numbers on a lower
level in the future. there are few numeral systems that exist; but the
ones that are worth noting are the positional and non-positional
systems.

## positional vs non-positional

### positional number systems

in positional number systems, digits have _different_ meanings depends
on the _position_. a common positional number system is the decimal (or
base-10) system. in decimal (and similar base-n systems), each digit $n$
in its position $p$ is multiplied by $n^p$, and finally added together.
the position $p$ usually starts from $0$, and increases from right to
left.

for example:

$$(1234)_{10} = 1 \times 10^3 + 2 \times 10^2 + 3 \times 10^1 + 4 \times 10^0$$

to indicate the base system for a number, we usually put the number in
parenthesis, and the base system in subscript, as shown above.

## non-positional number systems

there are a multitude of non-positional number systems. take the unary
system for example. it is simple to represent, and there are usually no
math operations involved, since each digit has the _same_ weight.
however, it is very inefficient.

one example is the
[tally marks](https://en.wikipedia.org/wiki/Tally_marks) system. we draw
4 lines top down, and one cross to indicate the number $5$ in base 10,
and repeat the same process two more times to represent the number $15$.

to convert this system to base 10, we consider the size of each cluster.
since each cluster have a size of $5$, we count the amount of clusters,
and multiply it by $5$.

## base-n systems

### weights

in a positional number system like base-n, each position have a weight
assigned to them: $n^p$, as described
[above](#positional-number-systems).

### radix

the base, or the **radix** determines how many digit symbols exist. for
example, for a base-10 (decimal) system, there would be 10 digits: from
$0$ to $9$. for a base-16 (hexadecimal) system, there are 16 digits:
from $0$ to $F$ (`0-9`, `A-F`).

### range

for a base-n integer system, the _lowest_ possible value is 0, while the
largest _possible_ value is $n^p - 1$; where $p$ is the amount of
digits.

for example, on a 4-digit display (usually used on clocks), the range
would be from $0000$ to $10^4 - 1 = 9999$.

## base-2

base-2 (binary) is special because it is the ubiquitous number system
when it comes to circuits and computers. in binary, each $n$ bit binary
number contains $n$ binary digits, and each position is either $0$ or
$1$, indicating on or off.

### sizes

- 1 **bit**: binary digit; `0` or `1`.
- 1 **nybble**: 4 bits
- 1 **byte**: 8 bits
  - most things are measured and manipulated in multiples of this unit
- 1 **word**: natural integer size of the CPU.
  - a 64-bit cpu implies that 1 word is 64 bits.

## base-16

base-16 (hexadecimal) was created because binary is long and difficult to read. it is way more compact, and it also maps cleanly to binary.

instead of using only `0` and `1`, hex digits range from `0-9`, and `A-F`, which represents $10$ to $15$ in base 10.

## conversions

### binary -> decimal

to convert binary to decimal, we ignore the $0$'s and add up the
position values $n^p$ where we see a $1$.

### decimal -> base-n

to convert decimal to base-n, we repeatedly (integer) divide the number
by the base ($n$). we discard the quotients and read the remainders from
end to the first.

example: convert $(1345)_{10}$ to base-16.

- $1345 / 16 = 84 ... \mathbf{1}$
- $84 / 16 = 5 ... \mathbf{4}$
- $5 / 16 = 0 ... \mathbf{5}$
- $0 / 16 = 0$

reading the remainders from bottom to top, we have $(541)_{16}$.

### binary <-> hexadecimal

to convert binary to hexadecimal, we regroup the bits by groups of 4, and pad the leading zeros if needed.

for example:
```
binary: 0011 1011 1110 1110 0111 0000
hex:       3    B    E    E    7    0 = 0x3bee70
```

to convert hexadecimal to binary, we simply replace each hex digit with its 4-bit binary equivalent.

```
hex:    0    1    2    3    4 ...
bin: 0000 0001 0010 0011 0100 ...
```
