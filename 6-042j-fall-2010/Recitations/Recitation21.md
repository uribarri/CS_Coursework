# Recitation 21
## Problem 1
Drawing out the tree for this problem, we see that there is one way to get all three dice to be your number, with probability $1/216$; there are three ways to win on two dice, each with probability $5/216$; three ways to get one die, at $25/216$; and one way to get no dice, at $125/216$. The expected payoff is
$$E[P] = (-1)\frac{125}{216} + (1)\frac{75}{216} + (2)\frac{15}{216} + (4)\frac{1}{216} = -\frac{16}{216} = -\frac{2}{27}$$
This game is rigged against the player, and the expected payoff is negative.

## Problem 2
### (a)
The expected value of two dice, given that doubles is rolled, is
$$\sum_i E[S_i|D_i]P(i)$$
$$ = \frac 16 2\sum_{j=1}^{6} j = \frac 13 \frac{6\cdot7}{2} = 7$$

### (b)
Different numbers come up in 30 different ways (36 total combinations, 6 of which are doubles). Each has probability $1/36$.

By linearity of expectation, the expected value of the sum of two dice is the sum of their individual expected values, which are each $\frac 16 \sum_1^6 i = 3.5$. The expected value of the sum of two dice is therefore 7.

By the total expectation theorem,
$$ E[S] = E[S|D]P(D) + E[S|\bar{D}]P(\bar{D})$$
$$ 7 = 7\left(\frac {6}{36}\right) + E[S|\bar{D}] \left(\frac {30}{36}\right)$$

Solving, $E[S|\bar{D}] = 7$.

### ( c )
Using total expectation, we have
$$ E[S] = E[X_1]P(\bar{D}_1) + E[X_1 + X_2 | D_1 \cap \bar{D}_2]P(D_1 \cap \bar{D}_2)$$
$$ +E[X_1 + X_2 + X_3 | D_1 \cap D_2 \cap \bar{D}_3]P(D_1 \cap D_2 \cap \bar{D}_3)$$

In the case of three double rolls, the expected advance is 0.

### (d)
To numerically evaluate, note that $X_i = 7$ for all $i$, and the probabilities are as would be worked out in a binary tree in $D$ and $\bar{D}$:

$$E[S] = ( 7 \cdot \frac 56 + 14 \cdot \frac{5}{36} + 21 \cdot \frac{5}{216}) = 8.263\bar{8}$$

So the possibility of doubles isn't expected to give too much additional advancement.

## Notes from the solutions
I just nailed every single one of these, almost down to the exact notation used.
