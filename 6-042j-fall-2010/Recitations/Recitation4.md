# Recitation 4

## Problem 1
### (a)
The frog hopping over $n$ rocks in a circle, $k$ at a time, will never reach the worm that starts 1 rock away if $n$ is a multiple of $k>1$, or if $k|n$, or if $n\equiv 0 \mod k$. Also, the frog will never reach the worm if $\gcd(n,k) \neq 1$.

### (b)
If the frog is to reach the worm in $s$ steps, then $sk \equiv 1 \mod n$, since this will plant him on the rock with the worm.

The Pulverizer finds the GCD, and in the process keeps track of the linear combination of $n$ and $k$ that gives the GCD, $sk + tn$. In this particular case, since the "effective" hop that we want is $k=1$, the GCD of $n$ and $k$ is going to have to be $=1$, or the frog will never reach the worm.

I had thought it, but forgotten to write down, that since $sk + tn = 1$ in order for the frog to reach the worm, the GCD can be immediately inferred to be 1, since the GCD is the smallest integer that can be written as a linear combination of $k$ and $n$.

### ( c )

With $k=21$ and $n=50$, the Pulverizer produces:

| $x$ | $y$ | $\text{rem}(x,y) = x - q\cdot y$ |
|:---:|:---:|:--------------------------------:|
|$50$ |$21$ | $8 =-2\cdot 21 + 50$ |
|$21$ | $8$ | $5 =5\cdot 21 - 2\cdot 50$ |
|$8$ |$5$ | $3 =-7\cdot 21 + 3\cdot 50$ |
|$5$ |$3$ | $2 =12\cdot 21 - 5\cdot 50$ |
|$3$ |$2$ | $1 =-19\cdot 21 + 8\cdot 50$ |

So $\gcd = 1$, as it should. But the number of jumps is negative. No worries: the smallest linear combination with positive number of jumps is found (as in the reading) by adding $50\cdot 21 - 21 \cdot 50$ to the final expression, to get $31\cdot 21 - 13\cdot 50$. This procedure will be needed whenever the number of Pulverizer steps is odd (see the sign shifting in the table above). The number of jumps needed is 31 in this case.

The solutions here suggest that it is equivalent to make $s$ positive in the way that I said, and to something crazy involving 931 jumps. I could have created any number of jump amounts that would have worked; the smallest is what I infer us to be after.

## Problem 2
Show that all Fibonacci numbers $F_n$ and $F_{n+1}$ are relatively prime.

**Proof.** By induction.

Base case: $F_0 = 0$, $F_1 = 1$, $F_2 = 1$, $F_3 = 2$. $F_3$ and $F_2$ are relatively prime.

Inductive case: $\forall n > 2$:

$$\gcd(F_{n+1},F_n) = \gcd(F_n,\text{rem}(F_{n+1},F_n))$$
$$\frac{F_{n+1}}{F_n} = \frac{F_n + F_{n-1}}{F_n} = 1 + \frac{F_{n-1}}{F_n}$$
$$\text{rem}(F_{n+1},F_n)=F_{n-1}$$
$$\gcd(F_{n+1},F_n) = \gcd(F_n,F_{n-1})=1$$
$$\Box$$

The solutions did this by contradiction. I like my solution better, because it illustrates use of the GCD relations.


## Problem 3
The problem states that $N$ is a number whose digits are all the same, and there are $3^n$ of them, for any $n$. The instructions are to show by induction that $3^n | N$.

A number is divisible by 3 if the sum of its digits are divisible by 3. Let $x$ be the digits that make up the number $0 \leq x \leq 9$, so that the sum of the digits is

$$\sum_{i=1}^{3^n} x = 3^n x$$

This number is divisible by 3.

**Proof.** By induction.

Base case: $n=0 \Rightarrow N=x, 3^n=1$, and $1|x, \forall x$.

Inductive step: Assume $3^n|N$. Define $N^+ = (xxx \cdot 10^{3n}) + N$ to be the number when the number of digits is $3^{n+1}$.

$$(xxx \cdot 10^{3n}) \equiv 0 \mod 3$$
because the sum of the digits is $3x$, which is divisible by 3, $\forall x$.
$$N \equiv 0 \mod 3$$
because, by assumption, $N \equiv 0 \mod 3^n$, $\forall n > 0$.

By the following fact of congruences: $a \equiv b \mod n, c \equiv d \mod n \Rightarrow a+c\equiv b+d \mod n$:
$$N^+ = (xxx \cdot 10^{3n}) + N \equiv 0 \mod 3$$
which means that $3 | N^+$.

Based on the way this question is worded, and the well-known fact that 9 has an analogous rule to 3, but other powers of 3 don't...I'm left wondering if this is a trick question and I will go to the solutions to find out.

No, it wasn't a trick. The solutions just figured out a way to express the $3^{n+1}$ digits as a multiplication of the $3^n$ digits and something else. And the something else was something like $1000...1000..1$, so that one is left with the $3^{n+1}$ digits. And that second number, having 3 $1$'s, is divisible by 3. Clever. Perhaps I would have gotten there if I hadn't been suspicious that I was wasting my time.
