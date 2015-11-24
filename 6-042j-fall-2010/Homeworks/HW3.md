# Homework 3

## Problem 1
A selection of problems for calculating fun.

### Find $s$ and $t$ such that $135s + 59t = \gcd(135,59)$  
Use the Pulverizer.

| $a$ | $b$ | remainder | Equation |
|:-:|:-:|:---------:|:--------:|
|$135$|$59$| $17$ |$135 - 59\cdot 2 = 17$ |
|$59$|$17$|$8$|$59 - 17 \cdot 3 = 8$|
|.|.|.|$59 - (135-59 \cdot 2) \cdot 3 = 8$|
|.|.|.|$135 \cdot (-3) + 59 \cdot 7 = 8$
|$17$|$8$|$1$|$17 - 8 \cdot 2 = 1$|
|.|.|.|$(135 - 59 \cdot 2) - (135 \cdot (-3) + 59 \cdot 7)\cdot 2 = 1$|
|.|.|.|$135 \cdot 7 - 59\cdot 16 = 1$|
|$8$|$1$|$0$|$8 - 1 \cdot 8 = 0$|

Therefore $s = 7$, $t=16$, and $\gcd = 1$.

### Find $59^{-1} \mod 135$.
$59^{-1} \mod 135$ is the value of $t$ found above: $-16$.

### Find $17^{-1} \mod 31$ using Euler's theorem
Euler's totient function $\phi(31) = 30$ since $31$ is prime and therefore every number from $1..30$ is coprime with $31$. $17^{30} \mod 31 = 1$. Therefore $17^{30-1}$ is an inverse, and $17^{29} \mod 31 = 11$ is an inverse as well.

### Find the remainder of $34^{82248} \div 83$
Euler's totient function $\phi(83) = 82$ because $83$ is prime. Because $34^{82} \equiv 1 \mod 83$, any power of this is also $\equiv 1 \mod 83$. The remainder of $82248$ and $82$ is $2$, so that $34^{82248} \equiv 34^2 \equiv 77 \mod 83$. The cancellation of the ones from the equivalence is possible because $83$ is prime.

## Problem 2
### Prove that if $a | b$, then $a | bc$, $\forall c$.
I think this is self-evident, but what the heck. If $a | b$, then $\exists k$ such that $ak = b$. Then $bc=akc$, and $a | akc$ by definition.

### Prove that if $a|b$ and $a | c$, then $a | sb + tc$.
As above, $a | b \implies b = ak$ for some $k$, and $a | c \implies c = a j$ for some $j$. Then $sb + tc = sak + taj$, which is divisible by $a$ by definition.

### Prove that $\forall c$, $a | b \iff ca|cb$.
As above, $a|b \implies b = ak$ for some $k$. Then $cb = cak$, and $ca | cak$ by definition.

### Prove $\gcd(ka,kb) = k \gcd(a,b)$
The $\gcd$ is the smallest natural number $n>0$ such that $sa + tb = n$, for any $s$ and $t$. Multiply both sides of that equation by $k$, to get $s(ka) + t(kb) = k(n)$, and this proves the assertion. That this is true is more clear if it's done this way: the GCD of $ka$ and $kb$ is the smallest $m$ such that $ska + tkb = m$. Factoring, $k(sa + tb) = m$. The smallest possible $m$ is found when $sa + tb$ is minimum; the minimum $sa + tb = n = \gcd(a,b)$ by the definition of GCD. Therefore $m = kn$.

## Problem 3
### (a) Show that $x^2 \equiv y^2 \mod p \iff x \equiv y \mod p$ or $x \equiv -y \mod p$.
Forward first.
$$x^2 - y^2 \equiv 0 \mod p$$
$$(x+y)(x-y) \equiv 0 \mod p$$
The only numbers that $\equiv 0 \mod p$ are $0$ and multiples of $p$. If $x+y=p$ or $x-y = p$, the assertion is easily proved. If $x+y = kp$, where $k$ is some integer, then $x + y \equiv 0 \mod p$ and the same for $x - y = kp$. The forward assertion is proved.

Backward.
If $x \equiv y \mod p$, then because $p$ is prime both sides can be multiplied by the same factor (opposite of cancellation). So $x^2 \equiv xy = \mod p$, and since $x \equiv y \mod p$, $x^2 \equiv y^2 \mod p$. The same holds for $x \equiv -y \mod p$.

### (b) Prove that if $n$ is a square modulo $p$, then $n^{\frac{p-1}{2}} \equiv 1 \mod p$.
Fermat's Little Theorem states that $k^{p-1} \equiv 1 \mod p$ if $k$ is not a multiple of $p$. If $n$ is a square, then there exists $x$ such that $n = x^2 \mod p$. So

$$n^{\frac{p-1}{2}} = (x^2)^{\frac{p-1}{2}} = x^{p-1} \equiv 1\mod p$$

It should be noted that the assertion is not $\iff$, it is just $\implies$. There are abundant counterexamples to $\iff$ in this case.

It should also be noted that if $x$ is a multiple of $p$, then $x^2 \equiv 0 \mod p$ and any $n \equiv 0 \mod p$ is a square modulo $p$ without meeting the above criterion. I'll have to come back and check on that...looking up on Wikipedia, the theorem is stated such that $n$ must be coprime with $p$. That fixes that problem.

The second part (which is not ours to prove here) is more interesting: it implies that almost all numbers are $\equiv -1 \mod p$ under the exponent, except the numbers that are squares. That must have a much more interesting proof.

### ( c ) Given $n$ and $p = 4k+3$, find an $x$ such that $n \equiv x^2 \mod p$.
It should first be noted that $p$ is not always prime here; $k=3\implies p=15$ for example. We may have to assume that $p$ is a prime number that happens to fit this form. Assume $n$ is not a multiple of $p$, in which case this would be trivial.

$$n^{\frac{p-1}{2}}  = n^{2k+1} = n^{2k} n\equiv 1 \mod p$$
$$n^{2(k+1)}\equiv n \equiv x^2 \mod p$$
$$x \equiv n^{k+1} \mod p$$

This was apparently way easier than I was making it out to be. I'd not properly applied the importance of part (a) above.

## Problem 4
Prove that $\phi(p^k) = p^k - p^{k-1}$ for prime $p$ and $k \geq 1$.

For all numbers up to $p^k$, those divisible by $p$ are $p$, $2p$, up to $p^{k-1}p$. There are $p^{k-1}$ of these, so all that are not divisible total (the totient function) $\phi(p^k) = p^k - p^{k-1}$. $\Box$

## Problem 5
Two numbers $x$ and $y$ are on the board. Each player takes turns writing a common divisor of any two numbers that are on the board. Last one who can play wins.

### (a)
Prove that at the end of the game all numbers on the board are divisors of $\gcd(x,y)$ or $x,y$ themselves.

By contradiction. Assume that there is some number $c$ on the board that is not a divisor of $f=\gcd(x,y)$. Then $c$ divides two numbers that themselves divide both $x,y$; $c | a | x,y$ and $c|b|x,y$. Therefore $c|x,y$.

The factorization of $x,y$ must therefore include both $c,f$; the factorization of $x,y$ must therefore include $cf$ as well. But $f$ is the GCD, but $cf > f$, and $c$ cannot exist. $\Box$.

### (b)
Show that every positive divisor of $f$ (as defined) is on the board at the end of the game (assume competent players).

By contradiction. Assume some divisor $c$ of $f$ is not on the board at the end of the game. Any divisor of $f$ is a common divisor of $x,y$. If $c$ is not yet on the board, then the game is not over. $\Box$

### ( c )
It's unclear what kind of strategy is being requested in this problem. For any two numbers, the number of divisors of $\gcd(x,y)$ is a set number, and the order in which they are written down is immaterial. There are no "blocking moves" in this game. If I have the freedom to choose $x,y$, and control over who goes first, then I just count the number of divisors and plan accordingly. But the wording of the question implies that I neither have nor need such control. So...yeah.

## Problem 6
### (a) Prove there are an infinite number of primes
By contradiction. Assume that the finite set $F = {p_1, p_2, ... p_k}$ contains all primes. Now let $n = p_1p_2p_3...p_k + 1$. Now since all primes $p_i > 1$, the addition of $1$ to the product of all primes in $F$ creates a number that is not divisible by any of the primes in $F$. This number therefore has no prime factors other than itself, and is therefore a prime. $\Box$

### (b) Prove that if $p$ is an odd prime, then $p \equiv 1,3 \mod 4$.
First, if $p\equiv 2 \mod 4$, then $p$ is even. If $p \equiv 0 \mod 4$, then it is not prime. Only $1$ and $3$ are left as possibilities for ANY odd number, prime or not.

### ( c ) Prove that if $n \equiv 3 \mod 4$, then $n$ has a prime factor $p \equiv 3 \mod 4$.
It is a fact of congruences that $a \equiv b \mod n$ and $c \equiv d \mod n$ implies that $ab \equiv cd \mod n$. Consider $\equiv 3 \mod 4$: the only options for $cd \equiv 3 \mod 4$ are for either one or both of $c,d \equiv 3 \mod 4$. This means if $n$ (in the problem statement) $\equiv 3 \mod 4$, then any factorization of $n$ must contain at least one number that is $\equiv 3 \mod 4$, and any other factor is either $\equiv 1,3 \mod 4$. If the largest such factor is not prime, this principle can be applied to that factor, until a prime is reached. Therefore at least one of the prime factors must be $p \equiv 3 \mod 4$.

### (d) Prove by contradiction that the set $F$ of primes $\equiv 3 \mod 4$ is infinite.
According to the hint, assume that $F$ is finite $\{p_1...p_k\}$, define $n = 4p_1...p_k - 1$. Here $n \equiv 3 \mod 4$ by definition. None of $\{p_1...p_k\}$ divides $n$, since all divide the first term and none divide $1$. But there must be a prime factor $p\equiv 3 \mod 4$ for $n$ (by part `(c)`); and it is not in $F$. This shows that $F$ is not finite. $\Box$
