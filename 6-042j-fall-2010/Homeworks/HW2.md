# Homework 2

## Problem 1
These steps will prove that every sequence $a_1,a_2,a_3,a_4,a_5$ of five integers has somewhere in it a *3-chain*, or a monotonically increasing or decreasing chain of three numbers.


### (a)
**Lemma 1**. If $a_1 < a_2$, and there is no *3-chain* in the sequence $a_1,a_2,a_3,a_4,a_5$, then $a_3 < a_1$.

**Proof**. By direct argument. If $a_1 < a_2$, then if $\exists x \in [3..5], a_x > a_2$, a monotonically increasing *3-chain* ($a_1,a_2,a_x$) will exist. Therefore $a_3,a_4,a_5 < a_2$.

If $a_1 < a_3 < a_2$, then $a_4 > a_3 \Rightarrow a_1,a_3,a_4$ (increasing); $a_4 < a_3 \Rightarrow a_2,a_3,a_4$ (decreasing).

So $\neg (a_1 < a_3)$ is true, and $a_3 < a_1$. $\Box$


### (b)
**Lemma 2**. If $a_1 < a_2$, and there is no *3-chain*, then $a_3 < a_4 < a_2$.

**Proof.** If $a_1 < a_2$, then by Lemma 1 $a_3 < a_1 \Rightarrow a_3 < a_1 < a_2$. If $a_4 < a_3$ then $a_1,a_3,a_4$ (increasing); if $a_2 < a_4$, then $a_1,a_2,a_4$ (increasing). Therefore $a_3<a_4<a_2$. $\Box$.

### ( c )
**Lemma 3**. If $a_1 < a_2$ and $a_3<a_4<a_2$, then any value of $a_5$ results in a *3-chain*.

**Proof**. Direct.
  * $a_5 < a_3 \Rightarrow (a_1,a_3,a_5 \vee a_1,a_4,a_5)$
  * $a_4 < a_5 \Rightarrow (a_3,a_4,a_5)$ (increasing)
  * $a_3 < a_5 < a_4 \Rightarrow (a_2,a_4,a_5)$ (decreasing)

Therefore any value of $a_5$ produces a *3-chain* if $a_1 < a_2$. $\Box$

### (d)
**Theorem.** Any sequence of five distinct integers will contain a *3-chain*.

**Proof.** By contradiction. Suppose a sequence $a_1,a_2,a_3,a_4,a_5$ does not contain a *3-chain*. Then by Lemma 3 $a_1 > a_2$. The reverse sequence of integers $a_5,a_4,a_3,a_2,a_1$ must also not contain a *3-chain*, so $a_5 > a_4$. Now either $a_4 > a_2$, in which case $a_2,a_4,a_5$ (increasing), or $a_4 < a_2$, in which case $a_1,a_2,a_4$ (decreasing). Therefore the sequence has a *3-chain*, which contradicts the supposition. $\Box$


## Problem 2
Prove for all $n > 0$
$$\sum_0^n i^3 = \left(\frac{n(n+1)}{2}\right)^2$$

**Proof.** By contradiction and the well-ordering principle. Assume that the relation is not true on some set $\mathcal{C}$. Because $\mathcal{C}$ is not an empty set, it has some smallest member $c$. Now the formula is true for $n=0$, so $c > 0$. And since $c$ is the smallest member of $\mathcal{C}$, the formula is true for $c-1$.

$$\sum_0^{c-1} i^3 = \left(\frac{(c-1)c}{2}\right)^2$$
$$=\frac{c^4 - 2c^3 + c^2}{4}$$

If $c^3$ is added to both sides, the result is

$$\sum_0^{c} i^3 = \frac{c^4 - 2c^3 + c^2}{4} + \frac{4c^3}{4}$$
$$=\frac{c^4 + 2c^3 + c^2}{4} = \frac{(c^2 + c)^2}{4}$$
$$=\left(\frac{c(c+1)}{2}\right)^2$$

which contradicts the assertion that $c \in \mathcal{C}$; therefore $\mathcal{C}=\emptyset$ and the theorem is proved. $\Box$

## Problem 3
This is hard. The following reasoning works, but is not elegant, and does not proceed by finding an invariant.

**Proposition 1.** $i \geq n$ is not a sufficient condition for complete population infection.

**Proof.** Consider the initial distribution of all $i$ along a single row or column of the grid. In this case, no empty square is adjacent to two infected squares, and the infection does not spread. $\Box$

**Proposition 2.** The final infection area is bounded by set of rectangles.

**Proof.** Direct. A rectangle is drawn around an initial infection site. It is extended in one or two dimensions to encompass another infection site that is no further away than a Manhattan distance of 2. By the rules of infection, at least one non-infected square will be adjacent to two infected squares and will become infected. The infection will continue until the rectangle is full of infected squares.

The rectangle can now be extended in one or two dimensions to encompass another initial infection no further than Manhattan 2 away. All uninfected squares in this rectangle will be infected.

This process can be repeated for all initial infection sites, and the result will be a set of rectangles encompassing the full extent of the final infection.

**Proposition 3.** The full $n\times n$ area of the grid can be encompassed by the rectangles of infection only if all rectangles of infection are no greater distance than Manhattan 2 from any other rectangle of infection, and if each edge of the grid contains at least one infection.

**Proof.** By the algorithm of in the proof of Proposition 2, any rectangle of infection greater distance than Manhattan 2 from all other rectangles of infection will be isolated and will not form a connected region. Any edge that lacks at least one infection cannot become infected at all, as no square on that edge is ever adjacent to two infected squares.

**Theorem.** In a population of $n^2$ students sitting on an $n\times n$ grid, the beaver flu will never completely infect the entire population unless the initially infected number $i \geq n$.

**Proof.** By Proposition 3, the full grid can be infected only if all rectangles of infection are no greater than Manhattan 2 from all other rectangles of infection. To span an $n\times n$ grid in steps of Manhattan 2 requires at least $n/2$ infections along each dimension. Therefore the minimum number of initial infections to fill the whole grid is $n$. $\Box$

I'm not satisfied with the "dirtiness" of this proof (though I do believe it is a proof). I'm going to go search online now for the invariant that I should have found (since there were no TAs to give me the all-important "hint"!)

### Notes from my internet research
Apparently this is called "bootstrap percolation", a cellular atomaton. It is a good model for the spread of rumors...only believed when heard from multiple people.

A little research suggests that the "hint word" would be "perimeter". If you look at all configurations, whenever a tick happens that leads to  a new infection, the perimeter of the infected area is always the same as or less than it was before. In that case...to get a final perimeter of $4n$ by covering the whole grid, the initial perimeter must have been at least $4n$: that is, $n$ separate infections not directly adjacent to any other.

A long explanation can be found [here](http://wordplay.blogs.nytimes.com/2013/07/08/bollobas/?_r=0). Apparently:

>The perimeter pops up naturally, when, for example, one studies phase transitions in two-dimensional systems, like the Ising model. There’s a beautiful argument by Peierls on those lines.

You might see my solution as vaguely having to do with "perimeter", but that interpretation is probably a bit too generous.

## Problem 4
**Theorem.** $a^n = 1, \forall n \in \Bbb{Z}^+$.

Bogus proof: By induction.
Base case: $P(0) \rightarrow a^0 = 1$ is true.

Inductive step:
$$P(n+1): a^{n+1} = \frac{a^n a^n}{a^{n-1}} = \frac{1\cdot 1}{1} = 1$$
$$\Box$$

The problem here is that the induction uses values two steps back ($n,n-1$) but the base case only includes $P(0)$. It should include $P(1)$ as well, and the induction should be for values $n\geq 2$. Then it would fail.

## Problem 5
Define sequence $\mathcal{G}$ recursively:
  * $G_0 = 0$, $G_1 = 1$
  * $G_n = 5G_{n-1} - 6G_{n-2} \forall n \in \Bbb{N}, n\geq 2$

**Theorem.** $\forall n \in \Bbb{N}$, $G_n = 3^n - 2^n \equiv P(n)$.

**Proof.** By induction.

Base case:
  * $P(0)$: $G_0 = 0 = 3^0-2^0$.
  * $P(1)$: $G_1 = 1 = 3^1 - 2^1$.

Inductive step:
$$G_{n+1} = 5G_n - 6G_{n-1}$$
$$= 5(3^n-2^n) - 6(3^{n-1}-2^{n-1})$$
$$=5(3^n - 2^n) - (2\cdot 3^n - 3\cdot 2^n)$$
$$=3\cdot 3^n - 2\cdot 2^n$$
$$ = 3^{n+1}-2^{n+1}$$
$$\text{P(n) is true. }\Box$$

## Problem 6
I already read about this 15-puzzle as supplemental material for the lectures, so I've gone through the solution in detail already. Repeating the exercise here won't benefit me any.

## Problem 7
This one required some pencil-and-paper to work out.
The population dynamics follow these rules:

### $Z_0 > B_0$:
$$Z_n = Z_{n-1} + \frac{Z_{n-1} - B}{2} = \frac32 Z_{n-1} - \frac12 B$$

**Theorem 1.** $\forall n \in \Bbb{N}, Z_n > B$.

**Proof.** $B$ is constant, as every pairing produces as many $B$ in children as there were $B$ as parents. Then, by induction.

Base case: $P(0) \Rightarrow Z_0 > B_0$ by definition.

Inductive step: if $P(n)$ holds:

$$Z_{n+1} = \frac32 Z_n - \frac12 B > \frac32 B - \frac12 B > B$$

$$\Box$$

The population of $Z$ in fact grows without bound.

### $Z_0 \leq B_0$:
This is the condition given in the assignment.

$$Z_n = \frac12 (Z_{n-1} + B)$$

**Theorem 2.** $\forall n \in \Bbb{N}, Z_n \leq B$

**Proof.** $B$ is again constant. By induction:

Base case: $P(0) \Rightarrow Z_0 \leq B$ by definition.

Inductive step:

$$Z_{n+1} = \frac12 (Z_n + B) \leq \frac12 (B + B) \leq B$$

$$\Box$$

Since in the given case, $Z_0 = 200 < 800 = B_0$, Theorem 2 states that $Z_n < B$ always. In this case, $Z_n < 2B$ is an obvious corollary.
