# Course notes

## Lecture 1: Introduction and Proofs

Proofs are sometimes made in the mathematical sense, but often get made based on appeals to authority:
  * Experiment & observation
  * Sampling & counter examples
  * judge, jury
  * Word of God
  * inner conviction

In mathematics, a proof is a verification of a *proposition* by a chain of *logical deductions* from a set of *axioms*.

### Propositions
*Proposition* is a statement that is either true or false
  * contains the universe of discourse (the domain) and a predicate (the true/false statement dependent on a variable)
  * $\forall n$ in $\Bbb{N}$, $n^2 + n + 41$ is prime. (Not really.)
    - Obviously $n=41$ violates that.
  * $a^4 + b^4 + c^4 = d^4$ has no integer solutions
    - Euler proposed, a Harvard man disproved.
    - written $\exists (a,b,c,d) \in \Bbb{N}^+$, $a^4 + b^4 + c^4 = d^4$
  * $313(x^3 + y^3) = z^3$ has no positive integer solutions
    - It does but the smallest is 6-digits long!
  * The regions in any map can be colored in 4 colors so that the adjacent regions have different colors.
  * Every positive integer (but 2) is the sum of two primes (e.g., 24 = 11 + 13) [Golbach's conjecture]
  * Poincare conjecture was proved true in 2003
  * $\forall n$ in $\Bbb{Z}$, $n \geq 2 \Rightarrow n^4 \geq 4$

An implication $p \Rightarrow q$ is true if $p$ false or $q$ true. In other words, if $p$ doesn't hold, it doesn't matter (defined as true); if $q$ holds it doesn't matter (defined as true); if both don't hold, it doesn't matter; it only matter if $p$ holds but $q$ doesn't.

| p | q | $p \Rightarrow q$ | $p \Leftrightarrow q$ |
|---|---|-------------------|-------------|
| T | T | T | T |
| F | T | T | F |
| T | F | F | F |
| F | F | T | T |

#### From the reading
  * The statement $\neg Q \rightarrow \neg P$ is logically equivalent to $P \rightarrow Q$, and is called the *contrapositive*. The truth table bears this out.
  * The statement $Q \rightarrow P$ is the *converse*, and the truth table shows that the two are *not* logically equivalent.
  * The statement $(P \rightarrow Q) \wedge (Q \rightarrow P)$ is equivalent to $P \leftrightarrow Q$.
  * Moving a $\neg$ across a quantifier ($\forall, \exists$) swaps the quantifier ($\exists, \forall$).

### Axioms
An axiom is a proposition that is assumed to be true. They are problem-specific. They should be
  * Consistent: if no proposition following from the axiom can be proved to be both true and false
  * Complete: if it can be used to prove every proposition is either true or false
  * Kurt Godel proved there is no such thing as a set of axioms that is both consistent and complete. I.e., there will always be some propositions that can never be proved.

#### From the reading
  * Important propositions are *theorems*
  * A preliminary proposition used to prove later propositions is a *lemma*
  * A *corollary* follows from another proposition in just a few logical steps.

The *axiomatic method* is the basis of all math, and all math can be derived from (it seems) the Zermelo-Frankel set theory with Choice (ZFC).

## Lecture 2

### Indirect proofs  
Proof by contradiction: start by assuming $\neg p$ is true, and then use that to derive a contradiction. If $\neg p$ is False is true, then this is the last line in the table above, and $\neg p$ must be false and therefore $p$ is True. (???) A contradiction is labeled $\#$.
  * The irrationality of $\sqrt 2$ is proven by contradiction: assume it is expressed as a ratio $a/b$ of integers in lowest form, and then show that both $a$ and $b$ are even, and therefore $a/b$ is not lowest form. $\#$

#### From the reading
Proof by contradiction is often used in conjunction with the Well-Ordering Principle, which states that for any set, there is a smallest member of that set; the typical proof then goes on to show that assuming the opposite of the proposition leads to a contradiction in which a smaller member of the set exists.

### Proof by Induction
Most powerful proof technique (important in CS because of recursion, as I understand...)

Induction axiom:
> Let $P(n)$ be a predicate. If $P(0)$ is true, and $\forall n \in \Bbb{N}$ $P(n) \Rightarrow P(n+1)$ is true, then $\forall n \in \Bbb{N}$ $P(n)$ is true.

#### Prove $\forall n \geq 0$, $1 + 2 + .. + n = \frac{n(n+1)}{2}$
Proof by induction:
  * Let $P(n)$ be $\sum_1^n = \frac{n(n+1)}{2}$
  * Base case: $P(0) \rightarrow 0 = 0$ is true.
  * Inductive step: for $n \geq 0$, $P(n) \Rightarrow P(n+1)$ is true.
    - Assume $P(n)$ is true.
    - $1+2+...+n+(n+1) = \frac{n(n+1)}{2} + (n+1) = \frac{(n+1)(n+2)}{2}$ $\Box$

#### Prove $\forall n \in \Bbb{N}$, $3 | (n^3 - n)$
  * Let $P(n)$ be $3|(n^3-n)$.
  * Base case: $P(0) \rightarrow 3|0$ is true.
  * Inductive step: $3|(n^3-n) \rightarrow 3|((n+1)^3 - (n+1))$
    - $(n+1)^3 - (n+1) = n^3 + 3n^2 + 3n + 1 - n - 1 = (n^3 - n) + 3(n^2 + n)$
    - $3 | (n^3 - n)$ by assumption; $3|3(n^2 + n)$ by definition.
    - $P(n) \Rightarrow P(n+1)$

There were more examples, but I think we get the idea.

A false proof example shows that just looking at the $...$ part of a predicate definition doesn't trip you up. (The "all horses are the same color" proof, where $P(1) \not \Rightarrow P(2)$.)

Then the "tiling the courtyard" (a $2^n \times 2^n$ region) using L-shaped tiles proof. Base case was $P(0) = 1$ tile, where the statue went. Solution discussion at video `1:09:00` (about). What this demonstrated: if you can't prove something simpler, it may be easier to prove something harder.

#### From the reading
The Invariant Method is used to demonstrate that certain propositions are invariant, and is important for the verification of software. It is essentially inductive, as long as $P(t)$ is chosen such that it is the invariant to be demonstrated.

There is a lovely proof of the (un)solvability of the 8-puzzle ending on p. 64 of the notes. The 15-puzzle, which is left as an exercise for readers, is solved by the same method: working out the parity of the number of *inversions* in the puzzle. Where for the 8-puzzle the number was always $0, \pm 2$, in the 15-puzzle it's always $\pm 1, \pm 3$. The parity of inversions is conserved in the 8-puzzle case. In the 15-puzzle case, the inversion parity is added to the parity of the empty square row position, and the total parity is conserved in all moves. So if the inversion parity is odd, and the empty square is on the bottom row (4th, even parity), then there is no solution (this is the example shown in the text). [This last bit I had to do some research to find...it hadn't occurred to me to use the row parity in conjunction with the inversion parity.]

## Lecture 3
### Seven characteristics of good proofs
  1. Correct
  2. Complete
  3. Clear
  4. Brief   - Not always there...
  5. Elegant - This is not my strength, so far
  6. Well-organized - using lemmas, etc.
  7. In order

1/3 of all published proofs have errors, according to one estimate!

Gauss published the first proof of the Fundamental Theorem of Algebra.

### Top-10 bad proof methods
  1. Proof by kitchen sink
  2. Proof by example
  3. Proof by vigorous hand waving
  4. Proof by cumbersome notation
  5. Proof by exhaustion
  6. Proof by omission
  7. Proof by picture
  8. Proof by vehement assertion
  9. Proof by appeal to intuition
  10. Proof by reference to eminent authority

Fermat's last theorem: $\forall n > 2$, $\neg \exists x,y,z \in \Bbb{N}^+ |  x^n + y^n = z^n$. The proof does not fit in the margins of a book.

...Most of this lecture was dedicated to the 8-puzzle, which I did the reading about last night, so no detailed notes.

Invariants are an important notion for verifying that certain states can't occur in software.

### Strong Induction
#### Strong Induction axiom
Let $P(n)$ be a predicate. If $P(0)$ is true, and $\forall n$ $P(0) \wedge P(1) \wedge P(2) ... \wedge P(n) \Rightarrow P(n+1)$ is true, then $\forall n$ $P(n)$ is true.

#### 8-block game
Stack of 8 blocks. Separated into 2 stacks, $8 \rightarrow (5,3)$ gives 15 points. Then $5 \rightarrow (4,1)$ gives 4 points. Continue until 8 stacks of 1. Goal is to maximize number of points gotten during process. No matter how the game is played, the final score is 28.

Strong induction was used to demonstrate not that the score is invariant, but that the score is $S(n)=\frac{n(n-1)}{2}$...the stronger hypothesis was necessary to make the induction do-able.

#### To do at this stage
~~Recitation 4~~ and Homework 2 will be due before the start of next lecture (#4, on Number Theory). (I may put off Recitation 4 until the start of Lecture 5. When I did Recitation 3, I hadn't yet gotten to strong induction, but the solution of one of those problems was best done by strong induction. So I may need to introduce a lag.

#### From the reading
**Structural Induction** is used to prove properties of recursively-defined data types in computer science. Arithmetic expressions are examples of recursively-defined data types, as are sequences of brackets.

If a data type is *ambiguous* (where an element can be constructed in more than one way) then (recursively-defined) function definitions must be careful not to be ill-defined (producing more than one value for the same element constructed two different ways). Example from matching brackets is given.

Some examples of ill-defined recursive function definitions are given. In general, anything where $f(n)$ is defined in terms of $f(n>m)$ is suspect, though in pathological cases it can work out if there is another part of the definition pointing to an $f(k<n)$.

#### This ends the lecture and reading notes on proofs and induction.
Homework through 2 and Recitations through 3 should be done now.

## Lecture 4
Number theory is one of the oldest mathematical sciences: it is the study of integers.

The class starts with the jug demonstration from Die Hard 3.

$m | a$: "m divides a", which means that $mk = a$ for some $k$.

Any amount of water in the jug game that can be created from two jugs of capacity $a,b$ is a multiple of the greatest common divisor of $a,b$.

**Definition.** $a,b$ are relatively prime if their GCD is $1$.

### Euclid's Algorithm (or The Pulverizer)
$\forall b > a \exists$ unique $q$ and $r$ (quotient and remainder) such that $b=qa + r$ with $0 \geq r < a$.

**Lemma.** $\text{gcd}(a,b) = \text{gcd}(\text{rem}(b,a),a)$.

Now the algorithm: $\text{gcd}(a,b) = \text{gcd}(\text{rem}(b,a),a)$ and do this with the result until the process stops changing the answer.

$\text{gcd}(a,b)$ is a linear combination of $a,b$.

Notes really sparse here because I was distracted while watching and needed to watch it quickly. I also had already read most of the relevant reading and so not much was surprising to me.

### From the reading
The Pulverizer is the same as Euclid's algorithm, except the methods of forming each remainder are kept track of during the procedure. In that way, the linear combination that forms the GCD can be easily computed at the end. The Pulverizer is an Indian name (*kuttak*), since it was developed in ancient India.

## Lecture 5
Encryption: keys are exchange, then
  * $m' = E_e(m)$
  * $m = E_d(m')$

### Turing's code V1
Now to encrypt "victory". $m = 220903201515182513$ is the concatenation of all the integers representing the letter positions in the alphabet. A $13$ is added on the end to make the number prime (how we know that is not given in lecture).

Beforehand, exchange keys (secret primes $k$). $m' = E_k(m) = mk$. Decryption is the reverse (this is obviously not public-key crypto that's being described). But anyway, now $m'$ is the product of two very large prime numbers. It's hard to factor a product of two large prime numbers.

In this scheme, if someone intercepts two messages with the same key, they can find the GCD of the two messages and that is the key. $k = \gcd(m'_1,m'_2)$. This is not secure.

### Turing's code V2
Beforehand, exchange a public prime $p$ and a secret prime $k$.

#### Encryption
The message is represented as a number $m \in {0,1,...p+1}$ and $m' = \text{rem}(mk,p)$.

#### Decryption
$a,b$ are relatively prime iff $\gcd (a,b)$ iff $\exists sa + tb = 1$

**Definition.** $x$ is congruent to $y$ modulo $n$: $x\equiv y \mod n \iff n | (x-y)$.

*Ex. 1* $31 \equiv 16 \mod 5$

**Definition.** Multiplicative inverse of $x \mod n$ is a number $x^{-1} \in {0,1,...n-1}$ such that $x x^{-1} \equiv 1 \mod n$

*Ex. 2* $2\cdot 3 \eqiv 1 \mod 5$, or $2 \equiv 3^{-1} \mod 5$, or $3\equiv 2^{-1} \mod 5$.

$$5 \cdot 5 \equiv 1 \mod 6 \Rightarrow 5 \equiv 5^{-1} \mod 6$$

Now back to the Turing code...

$$m' = \text{rem}(mk,p) \equiv mk \mod p$$

If $k k^{-1} \equiv 1 \mod p$, then $m' k^{-1} \equiv mk k^{-1} \equiv m \mod p. Since $m \in {0,1,..p-1}$, then $m \text{rem}(m' k^{-1},p)$.

How to attack this? The known-plaintext attack. Assume $m$ and $m'$ are known. Since $m' = \text{rem}(mk,p)$ or $m' \equiv mk \mod p$, and both are prime, $\gcd (m,p) = 1$.

Compute $m^{-1} \mod p$. Knowing $m$ and $p$ allows calculation of $m^{-1}$ which gives $k m m^{-1} \equiv k \mod p$. Compute then $k^{-1} \mod p$; that can be used to decrypt any other message.

So Turing code is too simple. Next, move on to RSA.

### RSA

#### Euler' Totient Function.
$\phi(n)$ denotes the number of integers $\in {1,2,...n-1}$ that are relatively prime to $n$.

Example: $n=12$. The relatively prime numbers are $(1,5,7,11)$, so $\phi(12)=4$. $\phi(15) = 8$ (not all of which are prime!)

#### Euler's Theorem
If $\gcd(n,k)=1$, then $k^{\phi(n)} \equiv 1 \mod n$.

**Lemma 1.** If $\gcd (n,k) = 1$ then $ak \equiv bk \mod n \Rightarrow a \equiv b \mod n$.

$\gcd (n,k)=1 \iff k$ has a multiplicative inverse. [There is a ton of back and forth in this proof. Better to try to follow it in the reading later.]

**Lemma 2.** Suppose $\gcd (n,k) =1 $, then let $k1...kr$ be the integers relatively prime to $n$ ($r = \phi(n)$). Then set of remainders of ${kk_r}$ with $n$ is the set $k_r$. Cardinality of set of ${k_r}$ is $r$.

[That theorem was incredibly complicated. I may have to watch this over after doing the reading.]

#### Fermat's Little Theorem
Suppose $p$ is prime. If $k \in {1,2,...p-1}$ then $k^{p-1} \equiv 1 \mod n$. Then $k^{-1} \equiv k^{p-2} \mod p$.

#### RSA algorithm
Receiver creates public and private keys.
  1. Generate distinct primes $p$, $q$.
  2. Let $n=pq$
  3. Select e, $\gcd (e,(p-1)(q-1)) = 1$. Public key is $(e,n)$
  4. Secret key is $d$, $de \equiv 1 \mod (p-1)(q-1)$.
  5. Secret key is $(d,n)$.

Encryption: $m' = rem(m^e,n)$.

Decryption: $m = rem((m')^d,n)$.

### From the reading

**Fundamental theorem of Arithmetic**:
A number $n$ can be built up in one unique way as a product of primes $p_1p_2...p_j$.

`The Prime Number Theorem:` $\lim_{x\rightarrow\infty} \pi(x) = x/ \ln x$.

In $a \equiv b \mod n$ a new congruence is found every $n$ integers. It's like equality on a number line that folds back onto itself and is $n$ long. Another way to think of it is that the $\mod n$ operation partitions the number line into $n$ sets of congruent numbers.

Did the [Polish Cipher Bureau](http://en.wikipedia.org/wiki/Polish_Cipher_Bureau) actually exist?

In public-key crypto, the message must be shorter than the public key (that is, $0 \leq m < p$). The private key is also shorter: $0 \leq k < p$...and the message $m$ no longer needs to be a prime.

Generally, cancellation does not work in congruences in modulo arithmetic. On the other hand, they do work in the special case of modulo a prime.

The Turing encryption algorithm discussed in the text *permutes* all possible messages; that is, the procedure shuffles the set of all messages $0 \leq m < p$. The original message still exists somewhere in the shuffling; but only knowledge of the secret key $k$ reveals where it is.

Turing's last public project was a mechanical device to test the Riemann Hypothesis.

Arithmetic on with arbitrary modulus $n$ is still tractable if considering terms $k$ that are *relatively prime* to $n$. In particular, the note above about permutation of messages still holds true if the only values of $k$ in the sequence considered are *relatively prime* to one another.

Just as $k^{p-1} \equiv 1 \mod p$ for a prime $p$, for an arbitrary $n$ $k^{\phi(n)} \equiv 1 \mod n$ where $\phi(n)$ is the Euler totient function, $\phi(n) = \prod_0^r (p_j-1)$ is the number of relative primes to $n$ less than $n$. The prime case is just a special case of the general.

When $n$ is a product of large primes, factorization becomes difficult and the Pulverizer is a better bet for finding the inverse of a key.

THe RSA algorithm cleverly chooses its definitions for the public and private keys so that the decryption process works out. The important point is that everything can be derived from the large primes $p$ and $q$ that are chosen; $p$ and $q$ are hard to derive from $e$ and $n$ but are easy to derive from $d$ and $n$, which is why the secret key must be kept secret.
