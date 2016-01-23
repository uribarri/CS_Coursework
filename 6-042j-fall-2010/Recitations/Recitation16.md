# Recitation 16

## Problem 1
There is no Problem 1 formally stated. But I gather from Problem 4 that the intent is that we prove
$$\sum_{i=0}^n {k + i \choose k} = {k + n + 1 \choose k+1}$$
using a combinatorial proof.

This is obvious in hindsight, but was tricky to work out the first time.

You have $k + n + 1$ items. You choose $k + 1$ of them. There are ${k + n + 1 \choose k + 1}$ ways to do that.

You want to choose $k+1$ items from that set. You start by taking out one item (say, the "first"). You then have to choose $k$ more items from the remaining $k + n$ items. This can be done in ${k + n \choose k}$ ways. This is the $i = n$ term on the left hand side of the equation above. You have now formed every possible combination with the "first" item. Throw it away. Take out the "second" item. Choose $k$ more from the remaining $k + n - 1$. This gives ${k + n - 1 \choose k}$ options. This is the $i = n-1$ term in the sum. You can do this until $i = n - n = 0$. So you have created the sum of all these terms, corresponding to the summation on the left hand side. $\Box$

## Problem 2
This problem boils down to counting the number of edges that are possible given the (somewhat convoluted) problem statement. Count the number of possible edges in two ways:

  1. $t$ triangles can be formed from a set of vertices $\{1..n\}$. $t = {n \choose 3}$ but that's actually immaterial. The number of edges in each triangle is ${3 \choose 2} = 3$. So, the number of edges in *all* the triangles is $3t$.
  2. Disregard the number of triangles that can be formed. The number of unique edges that can be formed among vertices labeled $\{1..n\}$ is ${n \choose 2} = \frac{n(n-1)}{2}$. It is given in the problem statement that there are $\lambda$ different triangles containing each edge. Therefore, the total number of edges is the number of unique edges multiplied by the number of triangles containing that edge: $\lambda \frac{n(n-1)}{2}$.

Therefore:
$$\lambda \frac{n(n-1)}{2} = 3t$$
$$\Box$$

## Problem 3
### 1
There are 6 letters in `BANANA`, with 2 `N` and 3 `A`. So the number of arrangements is $6!/2!/3!$

### 2
To get from $(0,0,0)$ to $(10,20,30)$, that number of indistinguishable steps must be taken in each direction. The total number of steps taken must equal 60.

This means there's a set of sequences of 60 elements, of which 10 must be $x$, 20 must be $y$, and 30 must be $z$. The number of ways to choose is the multinomial coefficients
$${60 \choose 10,20,30}$$

### 3
The number of 5-card hands is ${52 \choose 5}$. But with three aces, the other two cards, and the suit of the non-present ace are the only things to be chosen. There are 4 possible suits for the non-present ace. There are 48 cards to choose from for the other two. Therefore the number of ways to choose a five-card hand with three aces is
$$4 {48 \choose 2}$$

### 4
Because there are 5 cards and four suits, there is going to be at least one suit with two values. There are four options for this suit.

Then, there are two choices:
  1. There can be one card of each of the other suits;
  2. Another suit can have two values, and one other suit has one value.

So, count them up. In a suit with two cards appearing, there are $13\cdot 12$ options; in a suit with one card appearing, there are $13$ options.

Case 1: two pair. Choose the two suits that have pairs. ${4 \choose 2}$. Each pair has ${13 \choose 12}$ options. The last card has two suit choices, and 13 value choices, $2 \cdot 13$. Total: ${4 \choose 2} {13 \choose 12}^2 \cdot 13 \cdot 2$.

Case 2: one pair. There are 4 choices for the suit, and ${13 \choose 2}$ for the values. There is one way to choose the rest of the suits, and 13 values for each. Total: $4 \cdot {13 \choose 12} \cdot 13^3$.

Total:
$${4 \choose 2} {13\choose 12}^2 \cdot {2 \choose 1} 13 + {4 \choose 1} {13 \choose 2} \cdot {3 \choose 3} 13^3$$

### 5
The number of possible throws is:
  * 0 bounces: 1
  * 1 bounce: 15
  * 2 bounces: {15 \choose 2}
  * 3 bounces: {15 \choose 3}

Total:
$$\sum_{k = 0}^3 {15 \choose k}$$

### 6
Three numbers, which can be identical but distinguishable numbers (distinct dice), must add to 15. Note first that the smallest possible number on any die is 3 (as the maximum on the others is 6, for a total of 12). So the possible numbers range between 3 and 6. These sets are possible:
  * (3,6,6)
  * (4,5,6)
  * (5,5,5)

The dice are distinguishable, so (3,6,6) can be arranged in 3 ways (based on which color is assigned to 3); (4,5,6) can be arranged in $3!$ ways; and (5,5,5) can be arranged one way. A total of 10 ways.

### 7
In the case where the crates don't need an even number of occupants, this can be bijected to a case of 20 `0` and 3 `1` elements, with the `1` acting as divider between the crate occupants. In this case there are ${23 \choose 3}$ ways. Since the number needs to be even, and because they are indistinguishable, we can just lump them two-by-two to create 10 indistinguishable elements. Then the selection is ${13 \choose 3}$. Because they are indistinguishable, we don't have to worry about problems of double-counting; that's taken care of in the `choose`.

### 8
To make sure that we don't hit the boulder at $(10,10)$, the first 20 steps must be chosen so that $x \not = y \neq 10$. This can be done by choosing $x$ steps in quantities of $x \in \{0,1,...,9,11,...,20\}$. The number of ways this can be done is
$$\sum_{k\in \{0..20, k \neq 10\}}{20 \choose k}$$

To avoid the boulder at $(20,20)$, the first 40 steps must be chosen so that $x \neq y \neq 20$. This must be done while still satisfying the criterion above.

Say that $k \neq 10$ steps were taken in $x$ at first. There were ${20 \choose k}$ ways of getting there. Now, in the next 20 steps, the number in $x$ (call it $j$) must be $j \neq 20-k$. The number of ways this can be done is ${20 \choose j}$
$$\sum_{j \in \{0..20, j \neq 20-k\}} {20 \choose j}$$

Put together, the total number of legal ways to take the first 40 steps is
$$\sum_{k\in \{0..20, k \neq 10\}}{20 \choose k}\sum_{j \in \{0..20, j \neq 20-k\}} {20 \choose j}$$

The total number of steps to be taken is 100, so the remaining 60 steps can be taken without limitation. If $j+k$ steps in the $x$ direction have already been taken, then $50-(j+k)$ $x$-steps and $50-(40-(j+k))$ $y$-steps remain. The number of ways these steps can be taken is
$${60 \choose 50-(j+k)}$$

In total, then, the number of ways to move across this grid is
$$\sum_{k\in \{0..20, k \neq 10\}}{20 \choose k}\sum_{j \in \{0..20, j \neq 20-k\}} {20 \choose j} {60 \choose 50-(j+k)}$$

That looks ugly, but coding it up wouldn't be so hard...

### 9
The first group of 5 can be chosen ${180 \choose 5}$ different ways; the second, ${175 \choose 5}$ different ways; and so forth.
$$\frac{1}{36!}\prod_{k=0}^{35} {180-5k \choose 5}$$
The factor of $1/36!$ in front comes from the fact that once a particular set of groups are chosen, there are $36!$ different orders in which those groups could have been chosen. The product counts all the different ways.

### 10
The balls can be arranged in the following ways:
  * (1,1,4,4): ${4\choose 2}$ different ways
  * (1,2,3,4): $4!$ different ways
  * (2,2,3,3): ${4 \choose 2}$ different ways.

The total number of ways is therefore $4! + 2 {4 \choose 2}$.

[This is wrong. See notes.]

### 11
There are 165 different items (161 DVDs, and 4 dividers to separate the items to go on each of the 5 shelves). Therefore, the number of ways these can be arranged is
$$\frac{165!}{64! \cdot 96! \cdot 1! \cdot 4!}$$
Also this is the multinomial coefficient
$${165 \choose 96, 64, 4, 1}$$

## Problem 4
Prove
$$\sum_{i=0}^n {k + i \choose k} = {k + n + 1 \choose k+1}$$
by induction.

Base case: n = 0. ${k \choose k} = {k + 1 \choose k + 1} = 1$.

Inductive step: Assume true for $n - 1$.

$$\sum_{i=0}^n {k + i \choose k} = {k + n \choose k} + \sum_{i = 0}^{n-1} {k + i \choose k}$$
$$ = {k + n + 1 \choose k+1} = \frac{k + n + 1}{n} \frac{(k+n)!}{(k+1)!(n-1)!} = \frac{k + n + 1}{n}{k + n \choose k + 1}$$

Subtract over the $\sum^{n-1}$, which is equal (by assumption) to the ${k+ n \choose k +1}$, and we get
$${k+n \choose k} = \frac{k+1}{n}{k + n \choose k + 1} = \frac{k+1}{n} \frac{(k+n)!}{(k+1)!(n-1)!} = \frac{(k+n)!}{k!n!}$$

which is true by definition. $\Box$


## Notes from the solutions
Their solution to Problem 1 was a bit simpler than mine; I had thought along those lines at one point but hadn't made one crucial leap. No matter; both proofs work equally well.

I had to fix an error in Problem 2.4. I had used $13 \cdot 12$ instead of ${13 \choose 2}$ everywhere.

They used exclusion-inclusion for Problem 2.8. It gives a much nicer looking answer than mine, but isn't actually different than mine.

Their answer for 2.9 is more closed-form than mine; but I have checked and the values given are the same. I do like theirs better.

My case analysis for 2.10 was woefully inadequate. I missed the cases (1,3,3,3) and (2,2,2,4) completely. Let that be a lesson to me---be careful!

This was a challenging set---counting problems can be mind-bending. I was unhappy about my two errors; and if challenged to do so I might have been able to come up with the closed forms that they did as well. Oh well.
