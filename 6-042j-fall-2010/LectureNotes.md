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

*Ex. 2* $2\cdot 3 \equiv 1 \mod 5$, or $2 \equiv 3^{-1} \mod 5$, or $3\equiv 2^{-1} \mod 5$.

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

The RSA algorithm cleverly chooses its definitions for the public and private keys so that the decryption process works out. The important point is that everything can be derived from the large primes $p$ and $q$ that are chosen; $p$ and $q$ are hard to derive from $e$ and $n$ but are easy to derive from $d$ and $n$, which is why the secret key must be kept secret.

## Lecture 6
### Graphs definition
#### The Sex study
  * In the US, men have 74% more sexual partners than women (U. Chicago)
  * Or it's 233%. (ABC News)

#### Graph definitions
A graph $G = (V,E)$ is a pair of sets, of *vertices* or *nodes* and the *edges* that connect them. The edges are unordered two-node pairs. $E$ can be the empty set. $V$ is non-empty.
  * Two nodes are *adjacent* if they are connected by an edge.
  * An edge is *incident* to the vertices it connects.
  * The *degree* of a node is the number of edges incident to it.
  * A *simple* graph has no loops or multiple edges.

#### The sex graph
In the US:
  * $|V_m| = 147.6M$
  * $|V_w| = 152.4M$
  * $|E|$ is unknown
  * ($|..|$ is called *cardinality* of the graph)
  * $A_m, A_w$ is the average degree of $V_m,V_w$ respectively.
  * Want to find $A_m/A_w$ - the analogue of the survey results above

$$A_m = |E|/|V_m|$$
$$A_w = |E|/|V_w|$$
$$A_m/A_w = |V_w|/|V_m| = 1.0325$$

#### Scheduling final examples
A graph represents which courses can't have their exams at the same time. Certain slots are available for giving exams. This is a "graph coloring problem".

#### Graph coloring
Given a graph $G$ and $k$ colors, assign a color to each node so that adjacent nodes do not have the same color. This must be named after the map problem. The minimum value of $k$ for which such a coloring exists is called the *chromatic number* of the graph $\chi(G)$

#### Determining a chromatic number
The chromatic number of the example given is $\chi(G) = 3$. The problem of determining it is an exponentially-hard problem. Checking possible solutions is easy. It is an NP-complete problem. Finding solution to one NP-complete problem will solve all the rest.

Practical algorithms to do this, used in practice (Basic Graph-Coloring Algorithm):
  1. Order the nodes $V_1, V_2,...V_n$
  2. Order the colors $C_1,C_2,...C_m$
  3. Color the nodes in order using the lowest-possible legal colorings.
  4. Different orderings lead to different number of colorings
  5. Better orderings are done by sorting nodes by degree.
  6. More sophisticated orderings lead to better colorings.

Basic Algorithm above is a "greedy" algorithm: simple, getting done quickly without worrying about efficiency.

**Theorem.** If every node in graph $G$ has at most degree $D$, then the Basic Algorithm above uses at most $D+1$ colors regardless of ordering.

*Proof*. By induction. Induct on $N$, the number of nodes.

Base case: $N = 1$ node, 0 edges has degree 0. 1 color can be used for 1 node, so $D+1$ is true.

Inductive step. Let $G$ be *any* $N+1$ node graph. Let $d$ be the largest degree in $G$. Order nodes $V_1,V_2,...V_n,V_{n+1}$. Remove last node and all edges incident on it to create $G'$. $G'$ still has max degree $d$, but $N$ nodes. By assumption, $P(n)$ is true (at most $d+1$ colors to color $G'$.) Put $V_{n+1}$ back into graph. It has at most $d$ neighbors, and therefore at least one color in the $d+1$ set is not used and can be given to $V_{n+1}$. $\Box$

(Sidebar: an $n$-node complete graph $K_n$ is a special graph in which all nodes are connected to each other.)

An example *bipartite graph* ($G$ is bipartite if the vertices can be split into a left and right set so that all edges connect a node in the left set to a node in the right set) was shown that does well and poorly with Basic Algorithm depending on how node ordering is done.

Some examples of graph problems were given---scheduling is almost universally a graph problem, the use of registers for variables in computer programs...

#### Communications problem
If two radio towers have overlapping ranges, they can't use the same frequency.

### From the reading
All the graphs being discussed here are *simple graphs* as defined above.

Along with $K_n$, there are $L_n$ (line graph) and $C_n$ (cycle graph) that connect nodes in sequence.

Graph isomorphism: a fancy way to say "looks the same"...two graphs $G_1(V_1,E_1)$ and $G_2(V_2,E_2)$ are isomorphic iff $\exists$ a bijection $f: V_1 \rightarrow V_2$ such that $\{u,v\} \in E_1 \iff \{f(u),f(v)\} \in E_2$. $f$ is an *isomorphism*. This is equivalent to saying that graphs are isomorphic if their only difference is a relabeling of the vertices. Is the problem of finding isomorphisms in P or NP? No one knows yet.


## Lecture 7
### Matching problem
Given a graph $G(V,E)$, a matching is a subgraph of $G$ where every node has degree 1. For example, with a graph showing "preferences", finding a set of one-to-one preferences is a *matching*. A *perfect matching* is one that has size $N/2$.

A *weighted graph* would be used when there are more- and less-desirable preferences. The weight of a matching is the sum of the weights of the edges. Generally the higher the weight, the lower the desirability, so the goal is to minimize the weight of the matching. Finding maximum matching and or min-weight perfect matchings are not NP-complete.

#### Stable Marriage problem
Another way to order edges is to order preferences rather than assign weights.

Given a matching $\mathcal{M}$, $x,y$ is a *rogue* couple if they prefer each other over their mates in $\mathcal{M}$. A matching is stable if there are no rogue couples. The goal is to find a perfect, stable matching.

Given $N$ boys, $N$ girls. Each boy has his own ranked preference list of girls. Each girl has the same list for boys. Find a perfect, stable matching.

First attempt to solve example problem is by greedy algorithm without special ordering of boys.

The Marriage Algorithm produces a stable, complete matching and it terminates. Also want to show that it runs quickly. Also fairness: better to be boy or girl?

**Theorem.** TMA terminates in at most $N^2 + 1$ steps. Claim: if one step doesn't terminate, a boy must cross a girl off his list (because he got rejected). $N$ lists, with $N$ names, mean at most there can be $N^2$ crossouts. Then the algorithm must stop.

An invariant: a girl's preference for her chosen boy can only increase with passing steps. If she rejects a boy $B$, it's because she now has a suitor she prefers to $B$. True on Step 0. On Step $D+1$, the suitor only changes if someone better comes along.

**Theorem.** Everyone is married. Prove by contradiction. WLOG, $B$ is not married. Then all girls must have someone better than B. But that implies every boy is married. Contradiction. $\Box$

**Theorem.** TMA produces a stable matching. Prove by contradiction. Let $(B,G)$ be not married. Case 1: $G$ rejected $B$. So she has someone better. She won't prefer him. Case 2: $B$ never courted $G$. So he married someone he prefers. $(B,G)$ can not be a rogue couple. $\Box$

A person's *optimal* mate is their favorite within their *realm of possibility*. The least-favorite is the *pessimal*.

**Theorem.** TMA marries every boy with his optimal mate. TMA marries every girl with her pessimal mate.

### From the reading
**Handshake Lemma.** The sum of the degrees of the vertices in a graph equals twice the number of edges.

Another way to say that a *matching* exists in a graph is to say that no two edges share a node. A matching *covers* a set of vertices if each vertex has an edge incident on it. A *perfect* matching covers all vertices in a graph.

In a bipartite graph with $|L| \leq |R|$, a matching covering $L$ is guaranteed if the graph is degree-constrained.

In a *regular* graph every node has the same degree. Every regular bipartite graph has a perfect matching.

A planar graph is 4-colorable. This must imply that there are no overlapping edges, since I can easily envision a non-4-colorable graph, but only one with overlapping edges.

A graph with maximum degree $k$ is is $(k+1)$-colorable.

## Lecture 8
### Walks & Paths
Def:A *walk* is a sequence of vertices connected by edges. The length of a walk is equal to the number of edges.

Def: A *path* is a walk in which all vertices of the walk are different.

**Lemma.** If $\exists$ a walk from $u$ to $v$, also $\exists$ a path from $u$ to $v$. The proof rests on the Well-Ordering Principle, and asserting that there exists a walk of minimal length. Which is a path.

Def: $u$ and $v$ are connected if there is a path from $u$ to $v$.

Def: a graph is connected if every pair of vertices in the graph is connected.

### Cycles and closed walks. Trees.
Def: a *closed walk* is one in which the start and end vertex are the same.

Def: a *cycle* is a closed walk in which every edge is different (for $k \geq 3$).

A *tree* is both connected, and has no cycles. Def: a connected and acyclic graph is a tree.

Def: a *leaf* is a node of degree 1.

**Lemma.** A connected subgraph of a tree is also a tree. Proof: if any part of the subgraph has a cycle, that cycle is also present in the original tree, which would therefore not be a tree. Contradiction. $\Box$

**Lemma.** A tree with $n$ vertices has $n-1$ edges. Proof: By induction. Every addition of an edge must add a vertex. A two-vertex tree has one edge. $\Box$

### Spanning Trees
Def: a spanning tree is a subgraph of a connected graph that touches all vertices and is a tree. For every graph there is such a spanning tree.

### Constructing a minimum-weight spanning tree
Def: a minimum-weight spanning tree of a graph $G$ is one in which the summed weights of the edges of the tree is minimized.

Algorithm: greedy. Start choosing edges starting with minimum-weight. Keep going as long as no cycles are created. This creates a minimum-weight spanning tree.

### From the reading
A *connected component* is a subgraph of a graph that consists of a vertex and every other vertex that is connected to it. A connected graph has exactly one connected component.

A $k$-*connected* graph is one in which every pair of vertices is $k$-connected; a pair of vertices is $k$-connected if they remain connected in every subgraph formed by deleting $k-1$ edges. The complete graph $K_n$ is $n-1$-connected.

"Build-up" error is proofs involving graphs is avoided by using the "shrink down, grow back" approach to inducting on edges or vertices.

An *Euler walk* is one that traverses each edge on a graph only once. An *Euler tour* ends up back at the starting vertex. A connected graph has an Euler tour if and only if every vertex has even degree. Hamiltonian *cycles* and *paths* are the same, but on vertices instead of edges. Showing that a graph has a Hamiltonian cycle or path is in the same hardness category as the satisfiability problem. Not so with Euler. If the graph on which the Hamiltonian problem is posed has weighted edges, this becomes the Traveling Salesman Problem.

If every connected component of a graph is a tree, the graph is called a *forest*. Neat.

An *ordered binary tree* is one in which every parent has at most two children, a left and a right.

## Lecture 9
Communication networks

### Complete binary tree
*Latency* is the time required for a packet to travel from an input to an output.

The *diameter* of a network is the length of the shortest path between the input and output that are furthest apart. The diameter of the complete binary tree of size $N$ (a power of 2) is $2\cdot (1+\log_2(N))$.

*Switch size* is the number of inputs and number of outputs of a switch (ex: $3\times 3$).

In a binary tree, the number of switches is $2N-1$, $N$ is like above (the number of inputs and outputs (but not the sum of both)).

A *permutation* is a function $\Pi: \{0...N-1\} \rightarrow \{0...N-1\}$ such that no two numbers are mapped to the same value. $\Pi(i) \ \Pi(j) \iff i=j$.

Permutation routing problem: For each $i$, direct the packets at input $i$ to output $\Pi(i)$. The path taken is denoted by $P_{i,\Pi(i)}$. The *congestion* is equal to the number of paths passing through a switch. The maximum congestion is the $\max_{\Pi}...$

The congestion of an $N$-input array is 2.

The binary tree and array network are good and bad on scaling in the parameters (size, diameter, congestion), and need to be combined somehow to get the best of both worlds. The *butterfly* network is one way to do this.

The Benes network, which puts mirror butterfly networks back-to-back, cleverly decreases the congestion to 1. A two-coloring of the constraint graph on the outer network shows that the congestion is always 1.

Very few notes in this lecture; it was a very visual lecture. Maybe more to come in the reading.

### From the reading
A *directed graph* is one in which the edges have direction. The adjacency matrix, which was symmetric in the case of an undirected graph, is not symmetric for a directed graph. Degree splits into *indegree* and *outdegree* (with obvious meanings); nodes with indegree 0 are *sources*, and those with outdegree 0 are *sinks*. Directed graphs can be strongly connected and weakly connected, and walks, paths, closed walks, and cycles all must follow the directionality of the edges.

In *tournament graphs*, the directed edges represent who won a competition among the competitors (nodes). Every tournament graph contains a directed Hamiltonian path.

## Lecture 10
I'm suspecting that Lectures 9 and 10 are out of order...in that at the beginning of Lecture 10 the instructor refers to "next week" doing things that sound a lot like "communication networks"...and so much that is covered in Lecture 10 has already been covered in reading notes to this point. So notes may be sparse.

Euler walks and tours

Directed graphs, connectivity, and adjacency matrices

Tournament graphs and chicken kings

...and, by the end of the lecture, my initial assumption proved true.

## Lecture 11
### Relations
A relation from $A$ to $B$ is a subset of $A\times B$. The relation in particular is the *reason* why particular components of $A$ and $B$ are paired. The relation is given $aRb$ or $a\backsim b$.

In the relation notation, $\backsim$ is a generic symbol that can represent all kinds of relations: $=$, $\equiv$, $|$, $\leq$, etc...

A set $A$ with a relation $R$ is a directed graph. In particular, $G(V,E)$ with $V=A$ and $E=R$.

Properties of relations:
  * reflexive if $xRx$ $\forall x \in A$.
  * symmetric if $xRy \implies yRx$ $\forall x,y$.
  * antisymmetric if $xRy \wedge yRx \implies x=y$.
  * transitive if $xRy \wedge yRz \implies xRz$.

Example: $x\equiv y \mod 5$, $x|y$, $x \leq y$.
  1. Reflexive; symmetric; not antisymmetric; transitive.
  2. Reflexive; not symmetric; antisymmetric; transitive.
  3. Reflexive; not symmetric; antisymmetric; transitive.

Example 1 is prototypical of *equivalence relations*; examples 2 and 3 are representative of *partial orders*.

### Equivalence relations
are relations that are reflexive, symmetric, and transitive

Example: $=$; $\equiv \mod n$;

The equivalence class of $x \in A$ is the set of all elements in $A$ that are related to $x$ by $R$. Denoted $[x] = \{y | x R y\}$.

Example: $x \equiv y \mod 5$. $[7] = \{...,-3,2,7,...\}$

A *partition* of $A$ is a collection of disjoint, nonempty sets whose union is $A$.

**Theorem.** The equivalence class of an equivalence relation on a set $A$ form a partition of $A$.

### Partial orders
A relation is a (weak) partial order if reflexive, antisymmetric, and transitive. A (strong) partial order is irreflexive.

A partial order relation is denoted $\preceq$. Reminiscent of the ordering that the elements ofsuch a relation have.

The pair $(A,\preceq)$ is a partially-ordered set or poset. Can be described by a directed graph. Vertices $A$ and edges $\preceq$.

The partial relations are kind of like an ordering, the way that the order of clothes being put on matters. Often represented by a Hasse diagram. Transitivity is true; antisymmetric; and reflexive.

The *Hasse diagram* for a poset $(A,\preceq)$ is a directed graph with vertices $A$ and edge set $\preceq$ minus self loops and edges implied by transitivity. It is a directed, acyclic graph.

A poset has no cycles. Proven by contradiction using transitivity and showing that a loop violates antisymmetry. Two elements are incomparable if they are not related to each other in any way (right and left sock in the example).

A *total order* is a partial order in which all the elements are comparable.

A total order consistent with a partial order is a *topological sort*. The topological sort has the same set of elements but $\preceq \subset \preceq_T$.

Every finite poset has a topological sort.

### From the reading
The image of the domain of a relation $R$ is the *range* of $R$.

The composition of two relations $S: A \rightarrow B$ and $R: B \rightarrow C$ is $R \circ S: A \rightarrow C$ provided that suitable elements of $B$ exist.

The multiplication of two relations operates on elements of the Cartesian product of the two sets on which the relations are defined sets.

Vocabulary to remember: *is a function* and *total* apply to the *left* side of the bipartite graph representing the relation; *surjective* and *injective* relate to the *right* side of the graph; and *bijective* refers to both.

The *cardinality* of a set $|A| \in \mathbb{N}$ is the number of elements in the set.
  * If $\exists$ surjection, then $|A| \geq |B|$
  * If $\exists$ injection, then $|A| \leq |B|$
  * If $\exists$ bijection; then $|A| = |B|$

A poset has no directed cycles except self-loops. The transitivity and asymmetry property determines that.

A Hasse diagram is the DAG corresponding to a poset with all edges implied by transitivity removed.

A poset can be represented as a DAG and separated into parallel paths. Any sequence of increasing (with respect to $\preceq$) elements is a *chain*. The longest chain in a DAG is the *critical path*. Never thought I'd see that term show up somewhere rigorous.

An *antichain* in a poset is a set of elements in which any two are incomparable. If the critical path in any poset is of length $t$, then the poset can be partitioned into $t$ antichains.

## Lecture 12
### The Annuity Problem
The lecture starts with the annuity problem: what is a future cash flow worth in present dollars? This is the sum of a geometric series:
$$V = m \sum^{n-1}_{i=0} \left(\frac{1}{1+p}\right)^i$$

#### The perturbation method
Finding closed forms of sums can be done by "perturbing" (multiplying, differentiating, etc) the sum, and then adding it back in, looking for massive cancellations. In the geometric series, for example, $S - xS = 1-x^n$.

Differentiating is technically part of the "derivative method".

### Placing bounds on sums
#### Integral bounds
Take
$$f(1) + \int_1^n f(x) dx \leq \sum_{i=1}^n f(i) \leq f(n) + \int_1^n f(x) dx$$
where $f(x)$ is a positive increasing function.

Example: $f(i) = \sqrt{i}$. $\int_1^n \sqrt{x} dx = \frac23 (n^{3/2}-1)$. $f(1) = 1$; $f(n) = \sqrt n$. For $n=100$, the sum is between 667 and 676. In order of magnitude:
$$\sum_{i=1}^n \sqrt i \sim \frac23 n^{3/2}$$

**Definition** $h(x) \sim g(x)$ if $\lim_{x\rightarrow\infty}h(x)/g(x) = 1$

## Lecture 13
### The last word on sums
The $n$th *Harmonic number* is
$$H_n = \sum_{i=1}^{n} \frac 1i$$

$$H_n \sim \ln n$$

### Products
$$n! = \prod_{i=1}^{n} i$$
$$\ln n! = \sum_{i=1}^{n} \ln i \approx n \ln n - n + 1$$
$$\frac{n^n}{e^{n-1}} \leq n! \leq \frac{n^{n+1}}{e^{n-1}}$$

Which takes us back to Stirling's formula:
$$n! = \left(\frac ne\right)^n \sqrt{2\pi n} \mathrm{e}^{\epsilon(n)}$$
where
$$\frac{1}{12n+1} \leq \epsilon(n) \leq \frac{1}{12n}$$

### Asymptotic notation
Five different ways to describe function growth in the limit.

  * $f(x) \sim g(x)$ if $\lim_{x\rightarrow \infty} f(x)/g(x) = 1$
  * $f(x) = O(g(x))$ if $\lim_{x\rightarrow \infty} f(x)/g(x) < \infty$ (finite) [formally, $f(x) \in O(g(x))$]
  * $f(x) = \Omega(g(x))$ if $\lim_{x\rightarrow \infty} f(x)/g(x) > 0$
  * $f(x) = \Theta(g(x))$ iff $f(x) = O(g(x)) \wedge f(x) = \Omega(g(x))$
  * $f(x) = o(g(x))$ means $f(x)$ grows strictly slower than $g(x)$
  * $\omega$ means the opposite of $o$

Some of these notations are completely different than how I learned to use them in engineering!

For proofs, $O$-notation (or any asymptotic notation) can never be used in a predicate!

### From the reading
I want to remember Stirling's Formula to the better-precision estimate
$$n! \sim \sqrt{2\pi n} \left(\frac{n}{e}\right)^n \exp{\frac{1}{12n}}$$
This should be good to 1 part in 10,000 for $n > 10$. For $n < 10$, just do the dang multiplication.

## Lecture 14
### Towers of Hanoi
How many moves does it take for an $n$-disc stack? $T_1 = 1$, $T_2 = 3$, $T_3 = 7$...

It's pretty clear that the answer is $T_n = 2T_{n-1} + 1$.

Guess: $T_n = 2^n - 1$. Prove by induction. Also, can "plug and chug"...

### Merge sort
To sort $n>1$ items (power of two), sort first half, then last half. Then merge the sorted lists.

Dividing the list into two halves requires at most $n-1$ comparisons. Total number of comparisons $T(n) = 2T(n/2) + n-1$. The number of comparisons required in the full recursion is $n \log n - n + 1 \approx \log(n!)$.

### Divide and conquer recurrences
This has the form $T(x) = \sum a_iT(b_ix + \epsilon_i(x)) + g(x)$ for $x > x_0$. $a_i > 0$, $0 < b_i < 1$, $k$ is fixed, $|\epsilon_i(x)| \leq$....

**Theorem (Akra & Bazzi)**. Set $p$ so that $\sum a_i b_i^p = 1$. Then
$$T(x) = \Theta\left(x^p + x^p \int_1^x \frac{g(u)}{u^{p-1}}du\right)$$

### From the reading
I was struck that the number of operations for MergeSort is $n \log n - n + 1$, which is Stirling's formula for $\log n!$. Why was this? Some searching connected it to the Shannon entropy and information theory on the information content change as the items in the list go from unsorted to sorted. Fascinating.

## Lecture 15
### Graduate Student Job Problem
  * Total # jobs: $m$ fixed over time.
  * Each prof generates 1 grad/year; new profs produce no students
  * No retirements, faculty live forever

When are all $m$ jobs filled? We start with 1 prof in year 1. $f(n)$ is number of profs in year $n$.
  * Year 0: 0
  * Year 1: 1
  * Year 2: 1
  * Year 3: 2
  * Year 4: 3
  * Year 5: 5

This is the Fibonacci sequence. $f(n) = f(n-1) + f(n-2)$. 200 BC in India!

### Linear recurrences
These are of the form $f(n) = \sum a_i f(n-i)$. The upper limit, $d$, is the *order* of the recurrence.

**Solution.** Guess: $f(n) = \alpha^n$. Solve the quadratic equation given by the Fibonacci sequence to get $(1 \pm \sqrt 5)/2$. Any linear combination also works. The coefficients will depend on the boundary conditions. This was the discrete form of a second-order ordinary differential equation. For Fibonacci, it's $(1/\sqrt 5) \phi^n - (1/\sqrt 5) (\phi-\sqrt 5/2)^n$

Solving general linear recurrences is always like solving linear ODEs: generate characteristic equation, get coefficients from boundary conditions, etc.

There are even inhomogeneous variants of these recurrences (anything with a general $g(n)$ in the recurrence) that is solved as in the ODE case. Find the solution to the corresponding homogeneous equation; then add in any particular solution to the inhomogeneous equation.

## Lecture 16
### Sets
  * A **set** is an unordered collection of *distinct* elements.
  * The size or **cardinality** of a set is the number of elements in the set.
  * A **sequence** is an ordered collection of elements, not necessarily distinct.
  * A **permutation** of a set is a sequence in which every element occurs exactly once.
  * The number of permutations of a set of size $n$ is $n!$.

### Functions
  * A **function** $f: X\rightarrow Y$ is a relation between $X$ and $Y$ such that every element of $X$ is related to exactly one element of $Y$.
  * A function $f: X \rightarrow Y$ is:
    * **surjective** if every element of $Y$ is mapped to at least once (onto);
    * **injective** if every element of $Y$ is mapped to at most once (one-to-one);
    * **bijective** if every element of $Y$ is mapped to exactly once.

### Mapping Rule
  * if $f: X \rightarrow Y$ is surjective $\implies |X| \geq |Y|$
  * if $f: X \rightarrow Y$ is injective $\implies |X| \leq |Y|$
  * if $f: X \rightarrow Y$ is bijective $\implies |X| = |Y|$

### Generalized Pigeonhole Principle
If $|X| > k|Y|$ then $\forall f: X \rightarrow Y$, $\exists k+1$ different elements of $X$ mapped to the same element in $Y$.

When $k=1$, this is the Pigeonhole Principle.

A $k$-to-$1$ function $f: X \rightarrow Y$ maps exactly $k$ elements of $X$ to each element of $Y$. For this, there is the **Division Rule** which says that the number of elements in $Y$ must be $|X|/k$.

**Generalized Product Rule.** Let $S$ be a set of length-$k$ sequences. If there are $n_1$ possible first entries, and $n_2$ possible second entries, etc...then $|S| = n_1n_2n_3...n_k$.

**Product Rule.** The product of sets is the set of sequences in which the first element is taken from the first set, second from the second, and so forth. Cardinality of a product set is the product of the cardinalities of the sets.

**Sum Rule.** The cardinality of the union of disjoined sets is the sum of the cardinalities of the sets.

## Lecture 17
### Inclusion-Exclusion Principle
For unions of non-disjoint sets.

The general formula is
$$|A_1 \cup A_2 \cup ... \cup A_n| = \sum_{k=1}^n (-1)^{k+1} \sum_{S \subseteq \{1..n\} s.t. |S| = k} |\cap_{i \in S} A_i|$$

### General counting guidelines
It is a good idea to count two different ways, to make sure something hasn't been missed.

### Combinatorial proofs
The trick is to find the right set on which to do two independent countings.


## Reading notes on Chapters 12 and 13
There are no lectures covering this material, so I'm skimming the chapters for a flavor.


### Generating Functions
Generating functions have some great properties that remind me of Laplace transforms. There's probably a good mathematical reason for that. The multiplication of two generating functions is the convolution of the corresponding sequences. The running sum of a sequence is the generating function divided by $(1-x)$.

The sequence given by any generating function is just the set of coefficients from the corresponding Taylor series.

The use of partial fractions is also a nice throwback to manipulating Laplace transforms.

I'd like to look deeper into generating functions someday...the overview in this chapter didn't say *why* any of this worked...just that it did.

### Infinite Sets
Adding an element to an infinite set $A$ does not change the size of $A$. $|A \cup \{b\}| = |A|$.

A *countably infinite* set is one that has a bijection with $\mathbb{N}$. A finite set is countable. These are the only countable sets.

Discrete mathematics is the mathematics of countable sets.

The union of any countable sets is itself countable. The cross products of countable sets are also countable.

The power set of a countably infinite set is uncountably infinite. There is a bijection between this power set and the reals, so the reals are uncountably infinite. There is a bijection between the integers and the rationals, so the rationals are countably inifinite.

## Lecture 18
### Monty Hall Problem
An *outcome* of the Monty Hall game when the contestant switches consists of
  1. The box with the prize.
  2. The box chosen by the contestant first
  3. The box revealed.

Ex.: sample pt (2,1,3): prize under box 2, player picks box 1, box 3 revealed. Player wins (because switching is a given in this scenario).

Sample space is the set of all possible outcomes. An outcome (or sample point) consists of all information about an experiment after it's performed, including all random choices. A sample space is uniform if every sample point has the same probability.

Constructing the sample space with the tree method: Make a tree with three branches for which box the prize is in; these branch according to which box was chosen first; these branch according to which box was revealed; and the outcomes can be labeled win or loss.

A **probability space** consists of a sample space and a probability function $P_r : S \rightarrow \mathbb(R)$ such that $\forall w \in S, 0 \leq P_r(w) \leq 1$ and $\sum P_r(w) = 1$. The probability map should be chosen so that $P_r(w)$ is the probabilty that $w$ is the outcome.

Assumptions:
  * The prize is in each box with probability $1/3$.
  * The player picks each box with probability $1/3$ (random choice).
  * The revealed box is chosen with probability $1/2$ (random choice).

An *event* is a subset of the sample space. $E_L$ is the event that the player loses with the switching strategy. The probability that an event occurs is the sum of the probabilities of the elements in that subset.

The "strange dice" problem: an arbitrary tournament graph can be made with some number $k$ rolls of these dice. Crazy.

### From the reading
The sample space is a set; an element of the sample space is an outcome; and a subset of the sample space is an event. This is how these probability terms relate to set theory. A sample space combined with a probability function is a probability space. The probability function has all the usual properties I'm familiar with. The probability of an event is the sum of the probabilities of all the outcomes in the event.

The probability of the union of disjoint events is the sum of the probabilities of the two events. This is the sum rule. The complement rule is a corollary.

If a probability space is uniform (probability function is the same for every element of the space), the calculation of probability reduces to the calculation of cardinality.

## Lecture 19
### Conditional Probabilities
$$P(A|B) = \frac{P(A \wedge B)}{P(B)}$$

Product rule:
$$P(A\wedge B) = P(B) P(A|B)$$
$$P(A_1 \wedge A_2 \wedge ...\wedge A_n) = P(A_1)P(A_2|A_1)P(A_3 | A_1 \wedge A_2)...P(A_n|A_1 \wedge A_2 \wedge ... \wedge A_{n-1})$$

Multiplying probabilities down a tree is precisely the product rule!

*A posteieri* probability is a fancy name for saying that $B$ precedes $A$ in time.

Distributive set rules only work when the set rules appear on the left side of the conditional bar.

Examples cited:
  * fair-unfair coin flips
  * medical test accuracy
  * carnival dice
  * Berkley sex discrimination case
  * Airline choices

## From the reading
### Bayes' Rule:
$$P(B|A) P(A) = P(A \wedge B) = P(A|B)P(A)$$

### Law of Total Probability
$$ P(A) = \sum_{i=1}^n P(A|E_i)P(E_i)$$
if
$$\sum_{x=1}^n P(E_i) = 1$$
or if the union of the disjoint $E_i$ constitute the entire sample space.

## Lecture 20
### Independence
Event $A$ is independent of $B$ if
  1. $P(A|B) = P(A)$
  2. $P(B) = 0$

Disjointness does not imply independence. One example of Venn diagram is for $B$ to intersect $A$ for 50% of its area.

Product rule for independent events
$$P(A \wedge B) = P(A) P(B)$$

Symmetry of independence: if $A$ is independent of $B$, then $B$ is independent of $A$.

Biased coins are not independent if the events are tailored properly. In ultimate Frisbee, flipping the frisbees is biased, so if two Frisbees are flipped simultaneously, always call "same".

Events are mutually independent if the probability of the event given all the other events occur is the same as the probabilty of the event occurring by itself. *Pairwise* independence does not imply mutual independence.

"Blackout babies" are those that were conceived during the big blackout of '03 in the Northeast...I remember that...

The "Birthday Principle" says that if you have about $1.2 \sqrt{N}$ elements to fit randomly into $N$ bins, you have about a 50% chance of having two elements go into one bin.

Hashing: $x$ *collides* with $y$ if $h(x) = h(y)$ but $x \not = y$. The Birthday Attack breaks cryptographic systems based on collisions. The probability of collision is defined by the Birthday Principle.
