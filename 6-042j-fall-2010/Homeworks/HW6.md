# Homework 6

## Problem 1
Show that the following are equivalence relations (and give their classes) or not.

### (a) $x \equiv y \mod n$
It's been previously shown that modular equivalence is transitive, reflexive, and symmetric. This is an equivalence relation. The equivalence classes are the $n$ sets that are internally equivalent: $\{x | x = i + kn\},  i = 0..n-1$.

### (b) $xRy$ where $R = .$ "is taller than" and $(x,y) \in P\times P$.
$R$ in this case is transitive, but it is neither reflexive nor symmetric.

### ( c ) $(x,y) \in \mathbb{Z} \times \mathbb{Z}$ such that $\gcd(x,y)=1$
The relation in this case is that the two integers are relatively prime. This is symmetric, but it is not reflexive. It is also ton transitive (see (3,5) and (5,9), but not (3,9).)

### (d) $(x,y)$ are two vertices on a graph $G$ and the relation is a path between them.

This relation is symmetric, and it is transitive. It may or may not be reflexive, depending on how the path is defined (can a zero-length path exist?).

## Problem 2
### (a)
$x \sin(x)$ is not injective (one-to-one) because any $x = n \pi$ with $n$ an integer is zero. It is surjective, though, because all possible real numbers in the codomain $\mathbb{R}$ are mapped to by this function.

### (b)
$99 x ^{99}$ is bijective. All values in $\mathbb{R}$ are mapped to by the function, and each value in the codomain is mapped to by only one value in the domain.

### ( c )
$\tan^{-1}(x)$ is neither injective nor surjective. At $x=\pi/2$ the function has no value.

### (d)
$f(x)$ is the number of integers in $\mathbb{N}$ that divide $x$. This is not injective, since, for example, $f(x) = 2$ for every prime number $x$. It is surjective, though, because for any $y \in \mathbb{N}$, the number $\prod_1^y i$ is divided by all integers less than $y$.

## Problem 3
### (a)
The relation given is transitive (obvious), reflexive (because of the equality), and antisymmetric (again, because of the equality in $\leq$). This is therefore a weak poset.

### (b)
Prove that for any $n,m$, that in a sequence of length $(n-1)(m-1)+1$ integers there is a non-decreasing subsequence of length $n$ or a decreasing subsequence of length $m$.

By Dilworth's Lemma, for any $t>0$ a sequence of length $l$ has a chain of length greater than $t$ or an antichain at least as long as $l/t$.

Let $t=n-1$. Then by Dilworth, either our sequence has a chain of length $\geq n$, or an antichain of length
$$\geq \frac{(n-1)(m-1)+1}{n-1} = (m-1) + \frac{1}{n-1}$$

Since the length of the antichain must be an integer, the antichain is at least of length $m$. If the chain or antichin is of any greater length, then a subchain of length $n$ or $m$, as appropriate, can be chosen.

### ( c )
A generic sequence of $(n-1)(m-1)$ elements that contains no chains of length $n$ and no antichains of length $m$ can be constructed by joining $m-1$ subchains of length $n-1$ each, where the numbers in each subchain are larger than all the numbers in the successor subchain. For example, for $n,m = 4$:
$$\{101,102,103\} \cup \{11,12,13\} \cup \{1,2,3\}$$

Adding one more number to the sequence messes up the algorithm and we're left with what we proved in part (b).


## Problem 4
The "Reasoner-net" is a combination of the Benes and butterfly networks. therefore, the following table applies:

| # switches | switch size | diameter | congestion | LMC | CML|
|:----------:|:-----------:|:--------:|:----------:|:---:|:--:|
| $3 \log N + 3 + 2N$ | 2 $\times$ 2| $\log N + 4$ | 1  | $2\log N + 3$| $\sqrt{N}$|

Explanation: The number of switches required is the number required for the butterfly plus that required for Benes, plus $N$ switches on either side to direct the outputs of those two subnetworks from the inputs or to the outputs. The switch size is identical with the butterfly and Benes. The diameter is the smaller of the two: that of the butterfly plus the added input and output switches (an extra 2). The congestion is 1, the value for the Benes network. The LMC is the latency of the Benes network, plus the extra two switches at the input and output; and the CML is the congestion for the butterfly network, which has lower latency than the Benes network.

## Problem 5
At level 0 of the $B_n$ butterfly network, each switch handles only $2^0 = 1$ packet. At level $n$, each switch handles $2^{n-n} = 1$ packet. In between, the maximum number of packets going through any one node must correspond to the level $i$ at which the number inputs and outputs being potentially handled is greatest. This will happen at exactly the middle level, or $n/2$ when $n$ is even. The greatest number of packets that a node at this level could be handling is $2^{n/2} = \sqrt{N}$.

The congestion of a network is defined as the maximum congestion of a node in an optimal routing. A particular input/output pairing can be found that requires a routing from a node in the $i = n/2$ level of the network to all of its corresponding outputs. The inputs to that node, therefore, will be all of the inputs serviced by that node, which is $2^{n/2}$. This is the congestion, $\sqrt{N}$.

This solution requires visualizing the network to verify the assertion. I'm not 100% sure that there's a way to do it in writing that makes it immediately obvious.
