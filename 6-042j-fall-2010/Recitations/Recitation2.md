# Recitation 2 notes

## Problems

### Problem 1
Prove by induction the geometric sum formula

$$ 1 + r + r^2 + ... + r^n = \frac{1-r^{n+1}}{1-r} $$

I started out assuming that it was supposed to be proven for all $r$. Then I realized that it needed to be proven for all $n$. Much easier.

The above statement is the predicate $P(n)$.

Steps:
  1. Base case: $n = 0$
  * LHS: $1$
  * RHS: $\frac{1-r}{1-r} = 1$
  2. Inductive step: $n + 1$
  * LHS: $1 + r + ... r^n + r^{n+1} = (1 + r + ... r^n) + r^{n+1}$
    * $\frac{1-r^{n+1}}{1-r} + r^{n+1} = \frac{1-r^{n+1}}{1-r} + \frac{(1-r)r^{n+1}}{1-r} = \frac{1-r^{n+2}}{1-r}$
  * RHS: $\frac{1-r^{n+2}}{1-r}$

The proof is complete. $\Box$

Note from the solutions: they also provide a proof by contradiction. It wasn't clear to me that the instructions were to prepare two proofs...so I didn't. There is also a derivation in the solutions.


### Problem 2
This is a variant of the green-eyed dragon problem, sometimes said to be the most difficult logic puzzle in the world.

There is at least one purple eye $p \geq 1$. The contestants don't know this.

**Proof by induction**

#### Predicate
Let $P(n)$ be:
  * If p > n, nothing happens
  * if p = n, all $x \in \Bbb{P}$ leave the island.
  * if p < n, nothing happens.

#### Base case
Assume that $p = 1$. Then everyone sees one person with a purple eye, and that one person sees only red eyes.

On the day the producer reveals that at least one purple eye exists (day 1), $x$ knows he has a purple eye by elimination. He leaves that night $n=1$. Everyone else remains.

$P(n)$ is true for $n=1$.

#### Inductive step

Assume that $P(n)$ is true for $n$. Then, if $p = n + 1$, nothing happens on night $n$, the contestants will conclude that $p = n + 1$ and disappear on night $n + 1$. In any case, nothing happens before or after $p = n + 1$.

$\Box$

The official solutions are a bit more eloquent and systematic on this, but have the same reasoning and conclusion.
