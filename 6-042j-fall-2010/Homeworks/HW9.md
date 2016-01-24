# Homework 9

## Problem 1
### (a)
Show this by the Pigeonhole Principle. There are exactly $n$ non-consecutive numbers in the set $\{1,2,...,2n\}$. If we choose $n+1$ numbers, at least two must be consecutive. Since $\gcd(k, k+1) = 1$ for any $k$, these two numbers are relatively prime. $\Box$

### (b)
An easy counterexample can be made if the graph is not simple:

Consider a graph with vertices $\{1,2,3\}$. Two edges $(1,2)$ exist, and one edge $(2,3)$. Then node 1 is of degree 2, node 2 is of degree 3, and node 3 is of degree 1.

If the graph is simple, the statement is easily verified. The maximum degree that any node can have in a simple graph is $n-1$; there are $n$ nodes, so to fit $n$ elements into a categorization having $n-1$ categories, at least two must share the same category (or pigeons, pigeonholes, if you prefer).

## Problem 2
The easiest way to do this problem is to count the number of passwords that contain the forbidden sequences, and then subtract that from the total number of passwords.

The number of ways that `18062` can appear in the password is found by considering that to be one element, and then calculating the number of sequences available from that element and the remaining elements $\{3,4,5,7,9\}$ There are therefore 6 elements, and there are $6!$ ways of sequencing these. There are also $6!$ ways of choosing when `35876` is forbidden. When `6042` is forbidden, there are 7 elements total, so $7!$ ways of this sequence appearing.

The ways in which these forbidden sequences can show up together are limited to one: `35876042`. The number of ways this element can appear need to be added back in, because they will have been subtracted out twice by virtue of appearing in both of the component sequences. Lumping these digits together, there are 3 elements total, so $3!$ ways of making this arrangement.

The total number of 10-digit passwords possible is $10!$. Therefore, the total number of legal passwords is
$$10! - 2\cdot 6! - 7! + 3!$$

## Problem 3
### (a)
Five card sets that have one pair and no 3- or 4-of-a-kind.

There are 13 ways to choose the value of the pair, and ${4 \choose 2}$ ways to choose the suits. There are 12 ways to choose the value of the third card (can't be the same as the pair), and 4 ways to choose the suit. There are 11 ways to choose the fourth card (can't be the same as the pair, can't be the same as the third card), and four ways to choose the suit. Finally, 10 ways to choose the value of the fifth card. For a total of:

$$13 \cdot 12 \cdot 11 \cdot 10 \cdot 4^3 \cdot {4 \choose 2}$$

### (b)
The number of integer solutions to $\sum_{i=0}^k x_i = n$ is a problem of fitting $n$ balls into $k$ boxes, or choosing $k-1$ ones in a binary sequence of $n + k - 1$ elements. So this is just
$${n + k - 1 \choose k-1}$$

### ( c )
The number of integer solutions to $\sum_{i=0}^k x_i \leq n$ can be solved by summing the ways that the equality could hold for any value less than or equal to $n$:

$$\sum_{i = 0}^n {i + (k-1) \choose (k-1)}$$

But from recitation, we proved that this is equal to

$${k + n \choose k}$$

### (d)
In an $n$-node graph, there are ${n \choose 2}$ different pairs of nodes. Each of these pairs is either connected by an edge or not. So this is a binary problem, and the number of ways this graph can be formed is
$$2^{{n \choose 2}}$$

### (e)
A pair in a directed graph can either have no edge, a "forward" edge, or a "backward" edge (arbitrarily defined) [a ternary problem]. A single edge can either have an edge or not (no "forward" or "backward") [a binary problem]. The total number of possibilities is therefore
$$2^n \cdot 3^{{n \choose 2}}$$

### (f)
In a tournament graph, every pair has an edge, so this is a binary counting problem again. Therefore, the number of graphs is
$$2^{n \choose 2}$$

### (g)
Learned from Wikipedia: an acyclic digraph is the same as saying a transitive digraph, which has the property that the outdegrees of the nodes are $\{0,1,...,n-1\}$ on a set of $n$ nodes. To make an acyclic tournament graph, then, we just need to assign the set of outdegrees to the nodes.

There are $n$ nodes to which the highest outdegree can be assigned; then $n-1$ to which the second highest; and so forth. But the nodes are not distinguishable from one another; the two graphs created by exchanging any two nodes are the same graph (isomorphic). Therefore, the number of acyclic tournament graphs is
$$n!/n! = 1$$

I had to do a bit of extracurricular reading to figure this out, clearly.

### (h)
This is an Inclusion-Exclusion problem.
The number of integers $\in \{1..700\}$ divisible by:
  * 2 is 350;
  * 5 is 140;
  * 7 is 100;
  * 10 is 70;
  * 14 is 50;
  * 35 is 20;
  * 70 is 10

The total number of integers divisible by 2, 5, or 7 is therefore
$$350 + 140 + 100 - 70 - 50 - 20 + 10 = 460$$

### (i)
If we assume that both the order of the books matters, and that the shelves are distinguishable, then this becomes a Bookkeeper problem: $n$ distinguishable items punctuated by $k-1$ indistinguishable dividers. So this is
$$\frac{(n+k-1)!}{(k-1)!}$$

### (j)
If there must be at least one book per shelf, then $n > k$ holds.

There are $n$ books and $k-1$ shelf dividers. Pair each divider with a book to its right to form single elements. There are then $n - (k-1)$ free books, and $(k-1)$ divider-book combos, for $n$ elements total.

A book must come first in the sequence. (If a divider-book combo, that signifies an empty shelf at the beginning.) There are $n-(k-1)$ ways to choose this book. There are $n-1$ elements remaining after that, and all other elements in the sequence can be chosen from books or combos. There are $(n-1)!$ ways to do this. The books in the combos can be chosen in ${n \choose k-1}$ different ways. All told, then, the total number of ways to arrange the books is
$$(n-k+1){n \choose k-1}(n-1)!$$
I've verified this for several small values of $n$ and $k<n$.

## Problem 4
An $n$-length sequence of $(0,1,*)$ with only one $*$ can be done in the following way: there are $n$ locations to put $*$, and each other location has $2$ options, for a total of $n2^{n-1}$ ways of creating the sequence.

Alternatively: if the sequence has zero $0$s, then it has $n-1$ $1$s and one $*$. The number of ways to choose this is $n$: $n$ ways to choose the $*$ location, and no further choices.

If there is one $0$, then there are $n {n-1 \choose 1}$ ways to arrange this. Note that
$$n {n-1 \choose 1} = n \frac{(n-1)!}{1!(n-2)!} = (n-1)\frac{n!}{1!(n-1)!} = (n-1) {n \choose n-1}$$

Similarly, if the sequence has two $0$s, then there are $n {n-1 \choose 2}$ ways and
$$n {n-1 \choose 2} = n \frac{(n-1)!}{2!(n-3)!} = (n-2)\frac{n!}{2!(n-2)!} = (n-2) {n \choose n-2}$$

And so forth, until there are $n-1$ $0$s which leaves us with the first term in the sum. These two ways of counting show that
$$n 2^{n-1} = \sum_{k=1}^{n} k {n \choose k}$$

## Problem 5
Consider $n$ even. The total number of ways that Democrats could be selected for the committee is
$${n \choose \frac n2 + 1} \cdot 2^{\frac n2 - 1}$$
This is because at least $\frac n2 + 1$ Democrats must be chosen to make up a majority of the committee, and the other $\frac n2 - 1$ Democrats may or may not be chosen.

The selections of Republicans depends on how many Democrats were selected. If $\frac n2 + 1 + k$ Democrats were selected, then $\frac n2 - 1 -k$ Republicans will be chosen. These can be selected in
$${n \choose \frac n2 - 1 - k}$$
different ways.

So, the total number of ways to select the committee is
$$\sum_{k=0}^{\frac n2 - 1} {n \choose \frac n2 + 1 + k} {n \choose \frac n2 - 1 - k}$$
The two `choose` operators are actually equivalent to one another. So, to simplify,

$$\sum_{k=0}^{\frac n2 - 1} {n \choose \frac n2 + 1 + k}^2$$

For $n$ odd, the Democrats need $\frac{n+1}{2}$ for a majority. So by the same logic,
$$\sum_{k=0}^{\frac{n-1}{2}} {n \choose \frac{n+1}{2} + k} {n \choose \frac{n-1}{2} - k}$$

$$= \sum_{k=0}^{\frac{n-1}{2}} {n \choose \frac{n+1}{2} + k}^2$$

For $n$ odd, the closed form seems to be
$${2n -1 \choose n}$$

I only got this by fortuitously noticing that the numerical tests worked out that way. I'm not sure why this works. And I don't have an equivalent formula for $n$ even.


## Notes
I really wish there were solutions. I find that my bookkeeping skills can use some refining on these types of problems. Where possible, I've verified my solutions on a few test cases instead.

For the case of the last problem (5), I'm a bit disappointed at only figuring out one closed form (and not even by a rigorous method). But I have to move on; I'll come back and update if I have a flash of insight.
