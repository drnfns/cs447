# signed integers, extension and truncation, operations

## signed vs unsigned integers

there are two types of integers that computers store: signed and unsigned. an
**unsigned integer** stores non-negative values (natural numbers). as seen in
the previous lecture, the range is from $n$ to $2^n - 1$, inclusive. a **signed
integer**, on the other hand, can be positive _and_ negative. we usually use the
**most significant bit (msb)** -- the left-most bit -- to tell if a number is
negative.

## representing signed integers

we cover two ways to represent signed integers with bit: sign-magnitude(s-m),
and two's complement.

### sign-magnitude

this is the naive approach; we use the _msb_ as a flag. when the _msb_ is $0$,
it is a positive number; and when the flag is $1$, it is a negative number.

for a

however, as a result, there would be 2 zeros ($+0$ and $-0$). for example, we
want to use 3 bits to represent signed base-10 integers with sign-magnitude:

| binary | decimal |
| ------ | ------- |
| `000`  | $+0$    |
| `001`  | $+1$    |
| `010`  | $+2$    |
| `011`  | $+3$    |
| `100`  | $-0$    |
| `101`  | $-1$    |
| `110`  | $-2$    |
| `111`  | $-3$    |

we can imagine this table as a circle. eventually, this table loops back to the
beginning. because of the two zeros that exist in this method of representation,
it adds additional complexity to cpu arithmetic, and, it is not really quite an
efficient use of a bit.

### two's complement

this is the most common way to represent signed integers currently. instead of
using the _msb_ as a flag, it carries a _negative weight_. for a 8-bit number,
the _msb_ represents $-2^7 = -128$, and the range of it would be $-2^{n-1}$ to
$2^{n-1} - 1$, inclusive.

let's look at an example: a 8-bit signed integer `10010110` with two's
complement:

```
binary:      1     0     0     1    0    1    1    0
decimal:  -128    64    32    16    8    4    2    1
```

to convert it to decimal, we multiply the binary with its corresponding decimal,
and find the sum: $-128 + 64 + 16 + 4 + 2 = -106$.

you might have realized we only have one zero: `0000 0000`. comparing to
sign-magnitude, when the _msb_ is one and all the rest bits are zero, we do not
have a zero, but an additional negative number.

#### negation

to negate a number in two's complement, we _flip all bits_ and _add one_.

for example, given $+6$ and its binary code `0110` in two's complement, what is
the code for $-6$?

1. **flip all bits** and get `1001`.
2. **add one** to get `1010`.

**note**: the number `1000` (or the most negative number possible for $n$ bits)
is special and does not have a positive counterpart; since as shown above, we
have one additional negative number.

## extension and truncation

computer's arent infinitely large, and they can only store up to so much. to
save memory, sometimes we move a smaller value to a smaller type, like `byte`,
`short`, etc. and sometimes, we need more memories to store larger values, like
`long`.

### extension

there are two types of extensions. zero extension, which only works for natural
(non-negative) numbers, and sign extension, which works for both.

#### zero extension

**note**: it only works for _unsigned numbers_!

to move a smaller value (for example, a 8-bit integer) to a larger container
(for example, 16-bit of memory), we simply pad the left with `0`s.

for example: a 8-bit number `0110 0000` in 16-bit would be
`0000 0000 0110 0000`.

#### sign extension

for signed numbers, we copy the sign bit (usually _msb_) before the number. if
the _msb_ is `1`, pad the left with `1`s; and if the _msb_ is `0`, pad the left
with `0`s.

for example: a signed 8-bit number in two's complement `1001 0110` in 16-bit
would be `1111 1111 1001 0110`.

### truncation

to truncate a number is to cut the (bit representation of the) value short from
the left. essentially, it is modular arithmetic. to cut a value to n-bits, it
would be: $x \pmod{2^n}$.

## operations

### addition

it works like how we add normal numbers. if there is a carry-out from the _msb_,
we just truncate (ignore) it.

### subtraction

there is no distinction between addition and subtraction; to subtraction, we
simply add the negated value. so, the formula would be: $A + (flip(B) + 1)$.
