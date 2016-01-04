# Recitation 12
## Problem 1: The L-tower problem
This one is a bit hard to write in words, but here goes:

Referring to the figure in the handout, the structure is only stable when the CG lies over the support block. The right-hand edge of the support block we will call the origin ($x=0$), which makes the left-hand edge sit at $x=-1$.

The CG of an individual L-shape is located at the average of the two individual component CGs: the CG of the vertical block is at $\frac12$ from the left hand edge of the L, and the other is in the center of the horizontal block $\left(\frac x2\right)$. The CG of the L is therefore at $\frac{x+1}{4}$ from the left-hand edge of the L.

With reference to the coordinate system of the support block, the CG of the first L is located at $-x + \frac{x+1}{4}$; that of the second L is at $-x + \frac{x+1}{4} + 1$; and so on. The CG of the entire system is the average of the CGs of all the individual L blocks. This is

$$\frac 1k \sum_{i=1}^{k}\left(-x + \frac{x+1}{4} + (i-1)\right)$$

This simplifies to $-x + \frac{x+1}{4} - 1 + \frac{k+1}{2}$. Now since the CG has to be $\leq 0$ and $\geq -1$, the corresponding inequalities for $k$ are
$$k \leq \frac{3x+1}{2}$$
and
$$k \geq \frac{3x-3}{2}$$

The second inequality matches the hint given in the problem. The first inequality has a "$+1$" in the numerator where the problem hint has a "$-1$". I'm guessing a typo in the problem hint. A trial run with $x=7$ suggests that my answer is correct.

## Problem 2: Double sums
### Part 1
Evaluate
$$\sum_{i=1}^n \sum_{j=1}^i j$$
The inner sum evaluates to
$$\frac{i(i+1)}{2}$$
as usual. The outer sum is then the sum of two sums, both of which we know the formulas for in closed form. The final result is
$$\frac{n(n+1)}{4} \left(1 + \frac{2n+1}{3}\right)$$

### Part 2
The sum of the harmonic numbers is
$$\sum_{k=1}^n \sum_{i=1}^k \frac 1i$$

Approximately, this is
$$\sum_{k=1}^n \ln k$$
which is approximately $k (\ln k - 1) + 1$ (definite integral gives the "$+1$" as constant of integration).

Rearranging the sum, it's clear that the double sum is summing $n$ copies of $1$, $(n-1)$ copies of $1/2$, and so forth, until it gets to $1$ copy of $1/n$. So the double sum is now
$$\sum_{i=1}^n \frac 1i (n-i+1)$$
which simplifies to
$$(n+1)H_n - n$$


## Notes from the solutions
In Problem 1, the solutions give a very complicated-looking set of stability criteria. For the purposes of the problem, it suffices to say that the whole structure should have CG over the center support, and no group of L-blocks should gave CG hanging over the edge of its parent (lower) L-block. The second criterion only matters for the largest subgroup of L-blocks (with $k-1$ elements); and it is this criterion that gives the $k \leq \frac{3x-1}{2}$ bound. It was not a typo, as I suspected it might be. Instead, it just comes from applying the CG formula to $k-1$ L-blocks, noting that the CG will be shifted by $+1$ because the CG formula was derived for the the $k$th L-block, and then stipulating that the CG location must be $\leq 0$. The correct bound follows directly:
$$-\frac{3x+3}{4} + \frac{(k-1)+1}{2} + 1 \leq 0$$
The correct bound is just a rearrangement of this.

The agreement on the lower bound is because we agreed in the first place on what should define the lower bound.

In Problem 2, the first double-sum is the same as mine, but reduced differently.

Only reading the solutions reminded me of the "$+1$" that had to show up in the approximation to the double sum.

I got the correct single sum reduction, but an algebra mistake led me to the wrong closed-form solution originally.
