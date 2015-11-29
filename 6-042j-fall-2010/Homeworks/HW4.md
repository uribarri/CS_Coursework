# Homework 4

## Problem 1
Show that the graph formed from the union of two *matching* sets of vertices is bipartite.

**Proof.** By induction. $P(n)$ states that such an $n$-node graph is bipartite.

Base case $(n=2)$. Only one matching exists, and is by definition bipartite.

Inductive step. For $(n+2)$.

The addition of two nodes to the $n$-node bipartite graph $G$ can lead to a connection between those two nodes. In that case, one node can be (arbitrarily) assigned to the *left* group of the bipartite graph $G$ and the other to the *right* side to form a bipartite graph $G'$. Any other matching is formed by breaking the connection of an existing set of vertices and reconnecting with the two new vertices. In this case, the definition of *which* of the new vertices is assigned to *left* and *right* is given by this new connection.

In the second case, two new nodes are added and one of the two matchings is *not* formed by the connection of the two new nodes. Each matching is formed by breaking a connection to an old and reconnecting to a new node. If an old *right* is connected to a new node, then the new takes the *left* property, and vice versa. The two nodes "left behind" by this breaking process connect to one another and arbitrarily accept new *left* and *right* designations.

The hypothesis is therefore shown for $P(n+2)$ and therefore for all even $n$. $\Box$

## Problem 2
### (a) Prove that $2|E| = \sum_{v\in V}d_v.$
By induction.

Base case $(n=1)$: For $n=1$, there are no edges and $E=0 = d_1$.

Inductive step: Add a new vertex $v_{n+1}$ to the graph and any number of edges. The degree of $v_{n+1}$ increases by 1 with each additional edge; the degree of some other vertex also increases by 1 with each additional edge. Therefore each edge increases the sum of the degrees of all vertexes by 2. If $P(n)$ is true, then $P(n+1)$ is the sum of $P(n)$ and $2\Delta E$. $\Box$.

### (b) Show that among 111 students, some of whom shake hands, the average number of handshakes can't be 17.
$111\times 17 = 1887$, which is an odd number. Since each student is a node, and each handshake a vertex, the degree of the student graph must be an even number (by part (a)). Therefore no matter what handshaking pattern took place, the average can't be 17.

### ( c ) How many edges on $K_n$?
One node has 0 edges. 2 nodes have 1 edge. 3 nodes have 3 edges. 4 nodes have 6 edges. The pattern suggests that for each new node $v_n$ $n-1$ edges are added. Therefore $|E| = \sum_0^{n-1} i$.

**Proof.** By induction.

Base case $(n=0)$: $0=0$, so this step is true.

Inductive step. If a node $v_{n+1}$ is added to a graph with $n$ nodes, it can make $n$ connections with the existing nodes, which adds $n$ to $|E|$. Now

$$|E| = \sum_0^{n-1} i + n = \sum_0^n i = \frac{n(n-1)}{2}$$

so the hypothesis is proved. $\Box$

## Problem 3
### (a)
#### 1
The number of vertices of a graph is unchanged under isomorphism. Whether that number is even or odd, it is unchanged.

#### 2
The labeling of vertices is by definition changed under isomorphism (unless it is the trivial identity isomorphism (does that exist?)).

#### 3
If $G$ has a vertex of degree 3, then this will be true of any graph isomorphic to $G$

#### 4
If $G$ has exactly one vertex of degree 3, this will also be true of any graph isomorphic to $G$.

### (b)
  * $G_1$ and $G_2$ are *not* isomorphic. The edge linking is not preserved under relabeling (specifically of the edges labeled 7 and 8 in $G_1$). Every vertex in $G_1$ is of degree 3. Two vertices in $G_2$ are of degree 4.
  * $G_1$ and $G_3$ are isomorphic, even though an apparent symmetry is not conserved. The relabeling and rearranging of the vertices preserves their connectivity. Relabel vertices $\left\{1..10\right\}$ as $\left\{1,2,3,7,8,9,10,4,5,6\right\}$.
  * $G_1$ is not isomorphic to $G_4$; both the inner ring and outer ring are independently isomorphic to each other, but the connections between the two are not preserved under the isomorphism.
  * $G_2$ is isomorphic to none because it has a vertex of degree 4, which no other graph has.
  * $G_3$ is not isomorphic to $G_4$ because then $G_4$ would be isomorphic to $G_1$, which it is not.

## Problem 4
False claim: Let $G$ be a simple graph with maximum degree of at most $k$; if $G$ also has a vertex of degree less than $k$, then $G$ is $k$-colorable.

### (a) Give a counterexample when $k=2$
Consider the four-vertex graph with three vertices connected in a triangle (all with $k=2$) and the fourth vertex unconnected (of degree 0). The triangular subgraph requires three ($k+1$) colors, despite the False Claim.

### (b) Identify the exact sentence where the proof of False Claim goes wrong
"To do this, first remove the vertex $v$ to produce a graph, $G_n$, with $n$ vertices." $v$ is said to be the vertex of degree less than $k$. But what if the node that is removed from $G_{n+1}$ was of degree $k$? Then it would connect to $k$ other nodes when added in, and none of the $k$ colors that color $G_n$ would be available to color it. The false proof only works because the removed vertex was specially chosen to make it work.

## Problem 5
For the case of $n \geq 3$ boys and girls, show whether there exists a set of preferences such that all possible arrangements are stable.

Consider the case of $n=2$. Here there is a set of preferences for which every combination is stable: either both boys get their first preference, or both girls get their first preference. (No ecstatically happy couples here.)

Prove by contradiction that such a set of preferences does not exist for the case $n \geq 3$. Assume that such a set of preferences does exist.

If so, then there is a scenario in which boy $b_i$ is paired with his last preference. He will therefore want to rogue pair with *any* other girl. In some permutation of this scenario, some other girl will also have been paired with her last choice, and will be wanting to pair with *any* other boy. There will therefore be a rogue couple. The only way this is avoided is if the boy in question is *every girl's least favorite*. If this is the case, then consider a scenario in which a different boy gets his least favorite girl. He will then want to pair up with *any* other girl. In some permutation, a girl will be paired with her least favorite (the first boy) and therefore want to rogue pair with *any* other boy. They will form a rogue pair.

There is therefore no set of preferences for $n \geq 3$ for which every matching is stable. $\Box$

Note: there was a ton of thinking about the problem with a few other conclusions that turned out to not be so relevant. I leave some of that reasoning at the bottom of the file for future reference.

## Problem 6
### (a)
As described in the problem statement, the maximum degree of any vertex in the graph is 4---two from definition 2(a), which makes a line graph, and two from definition 2(b), which connects each element $s_i$ to the nodes defined by the $s_j$ before and after it. Therefore by the book's Theorem 5.3.2, this graph is 5-colorable.

A line $L_n$ is 2-colorable, because a choice of alternating colors will color the graph.

Prove by induction that this graph is 4-colorable.

Base case $(n=1)$. One vertex is 1 colorable, which is a subset of 4-colorable.

Inductive step. Assume $G_n$ is 4-colorable. Add an additional vertex to the graph to form $G_{n+1}$. This vertex attaches to one node on the line, and to at most two other nodes on the graph. That is at most a connection to three colors, and the new node can be colored with the fourth color. $\Box$

### (b)
Prove that if the sequence $S$ is defined $(1,a_1,3,a_2...)$ where the $a$'s are any permutation of the even numbers, then the graph is 2-colorable.

First, color the line $L_n$ with two colors $C_1$ and $C_2$, with $C_1$ coloring the odd nodes and $C_2$ the even nodes. On the line, odd nodes only connect with even nodes, and vice versa. Because the sequence $S$ also alternates odds with evens, the additional loop connections will always be with edges connecting odd and even nodes. Therefore odd nodes ($C_1$) will only ever be adjacent to even nodes ($C_2$), and the graph is 2-colorable. $\Box$








## Additional notes on Problem 5
Take with a grain of salt---completely unedited.

Case 1: The set of boys' preferences includes a tie, in which two boys prefer one girl the most. The girl either prefers one boy or the other (there are no individual ties). So in the case where the girl gets her preference, the arrangement is stable. In the case where she does not, then she will prefer the other boy (who clearly prefers her to whoever he got). Instability will result. The same is true of a tie for second place: for any two boys with a tie for second place, she will prefer one over the other; when the less-preferred is assigned, the more preferred will either be assigned to his number one (stable) or his number three (unstable). This pattern continues for all ties down to last place.

* Any set of preferences in which first preference goes both ways between a pair of boy and girl, then any other matching will be unstable. So the set of preferences can't include such a case. Also, any set of preferences in which a boy and girl rate each other as 2: in this case, there will be a matching in which both are assigned to their third choice. This will be unstable. And so on until the case where both rate each other lowest possible. Therefore no universally stable system of preferences will include reciprocal preferences between any pair of boy and girl, unless it is lowest preference.

The upshot of all the above is that all the boys' preferences must be different, and they must also all be different from the girls'.

Case 2: All first preferences among boys are different. In this case, each boy getting his first preference will be stable, regardless of the girls' preferences. Consider the matching where all boys get their second preference (assuming there are no ties on this level). This is stable if each girl's boy of first choice ranked her at or lower than 2. Otherwise she will

If this is the case, then there exists a matching in which $(b_1,g_1)$ and $(b_2,g_2)$ are paired up (the actual numbers are immmaterial). The rest of the boys and girls are in a stable arrangement. Here, it is not the case that simultaneously $b_1$ prefers $g_2$ and $g_2$ prefers $b_1$ (otherwise instability would result). By the hypothesis, the reverse matching $(b_1,g_2)$ and $(b_2,g_1)$ is also a stable matching.
