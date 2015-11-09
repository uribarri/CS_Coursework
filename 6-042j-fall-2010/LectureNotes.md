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
  * $313(x^2 + y^2) = z^2$ has no positive integer solutions
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

### Axioms
An axiom is a proposition that is assumed to be true. They are problem-specific. They should be
  * Consistent: if no proposition following from the axiom can be proved to be both true and false
  * Complete: if it can be used to prove every proposition is either true or false
  * Kurt Godel proved there is no such thing as a set of axioms that is both consistent and complete. I.e., there will always be some propositions that can never be proved.

## Lecture 2

### Indirect proofs  
Proof by contradiction: start by assuming $\neg p$ is true, and then use that to derive a contradiction. If $\neg p$ is False is true, then this is the last line in the table above, and $\neg p$ must be false and therefore $p$ is True. (???) A contradiction is labeled $\#$.
  * The irrationality of $\sqrt 2$ is proven by contradiction: assume it is expressed as a ratio $a/b$ of integers in lowest form, and then show that both $a$ and $b$ are even, and therefore $a/b$ is not lowest form. $\#$

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
