# Homework 5

# Problem 1
## (a) Show that removing the root of an SBTree creates two SBTrees (the induced subgraph!)

From the definition of an SBTree, an SBTree with more than one vertex has at least three vertices. The two vertices underneath the root (which has degree two) are themselves either leaves or internal nodes with degree 1 or 3. Removing the root reduces the degree of these two nodes by 1; they are now either a lone node (a leaf) or a root (degree two) of an SBTree. All other nodes remain unchanged. $\Box$

## (b) Prove that two SBTrees with the same number of leaves have the same number of nodes

I can prove this by induction without guessing a formula for $N(l)$ as the hint suggests.

Base case: Two SBTrees with one leaf each have the same number of nodes (1).

Inductive step: Two SBTrees with the same number of leaves $l$ have the same number of nodes $N(l)$ by the inductive hypothesis. Now add an extra two leaves by converting any one leaf into an internal node and attaching two leaves to it. (This can be done on *any* leaf in both SBTrees). The number of leaves increases by 1 (+2 new, -1 old) and the number of nodes increases by 2 (+2 new leaves). In both SBTrees, the number of leaves and nodes are the same. $\Box$

This also works with the "take away, add back" procedure.

The sequence for number of leaves and nodes $(l,N)$ as an SBTree is built up is $\{(1,1), (2,3), (3,5), (4,7), (5,9), ... \}$. The formula guessed here would be $N(l) = 2l-1$. If that's true, then for any $(l,N)$, the splitting of any leaf into two leaves adds one leaf and two nodes: $(l,N) \rightarrow (l+1,N+2)$. But since $N(l) = 2l - 1$, $N(l+1) = 2(l+1) - 1 = 2l-1+2 = N(l) + 2$. This is true regardless of which leaf is split, so any two SBTrees will have identical $(l,N(l))$. $\Box$

## Problem 2
### (a) Show that any $N\times M$ grid, with $N$ and $M$ odd, is not Hamiltonian.
First, any two-colorable graph is bipartite. Because there are no diagonals in the $N\times M$ grid, any $N\times M$ grid is a collection of line graphs, which are two-colorable. The grid is two-colorable, and therefore bipartite. Call the colors $R$ and $B$.

Assume there is a Hamiltonian cycle when $N$ and $M$ are both odd. Say that the Hamiltonian cycle starts on an $R$. Any step that can be taken must lead to a $B$. Any next step must land on an $R$. And so forth. An odd number of steps will always end on a $B$; an even number of steps on an $R$. The Hamiltonian cycle must touch each vertex only once, and return to the starting point, for a total of $NM$ steps. Since both $N$ and $M$ are odd, there are an odd number $NM$ of vertices. An odd number of steps must end on a $B$ vertex; but for the cycle to be Hamiltonian the last step must end on the original vertex, which is $R$. Therefore any cycle is not Hamiltonian, and the original premise is contradicted. $\Box$.

### (b) Answer the following if the grid is $20\times 7$ instead
#### If either $N$ or $M$ is even, and the other is $>1$, then show the graph is Hamiltonian.
The solution is the same regardless of how we label $N$ and $M$. Without loss of generality, rotate the grid so that the number of intersections in the vertical direction (either $N$ or $M$) is even. A Hamiltonian path can always be constructed by the following algorithm:
  1. Start at the top left corner. Walk *right* along the top edge of the grid.
  2. Step vertically down one node. Walk horizontally *left* until touching all but the leftmost node.
  3. Step down one more node. Walk *right* to the end of the grid.
  4. Repeat steps 2 and 3 until walking *left* along the bottommost row of nodes.
  5. Walk vertically upward along the leftmost line of nodes (which have not yet been touched).

This algorithm will always work as long as the number of nodes in the vertical direction is even, because on the *odd* rows (1,3,...) the path leads *right*; on the *even* rows the path leads *left*. That the number of nodes in the horizontal direction must be $>1$ is self-evident.

Since there is a Hamiltonian cycle, any vertex can be used as the starting point of the Hamiltonian cycle.

#### Why does this break when $N$ and $M$ are odd?
As described, the grid must be rotated so that the number of nodes in the vertical direction is even. If both $N$ and $M$ are odd, this is impossible.

#### Would they survive?
They must take 140 steps, and defuse the bomb (2 minutes): a total of 142 minutes. They are given 135 + 7 = 142 minutes; they survive, in the nick of time. But they're already dead, so perhaps it doesn't matter after all.

As described above, the Hamiltonian cycle can be started and stopped at any node; therefore, it doesn't matter where the bomb is placed.

## Problem 3
### (a)
"Every non-empty, tangled graph is connected." The proof of this false claim goes wrong when, after partitioning the vertices into two sets ($\lceil \frac n3 \rceil$ and the rest), it is asserted that the two parts are internally connected. The graph could be made up of two sets of vertices, one with $\lceil \frac n3 \rceil + 1$ nodes, and one with the rest of the nodes, unconnected to each other; then the graph is tangled, but it is not connected...and it violates the assumptions of the proofs.

### (b)
I drew this graph with $n=9$, so that I have a 4-vertex connected subgraph and a 5-vertex connected subgraph. The whole graph is tangled (each group of 3 or fewer vertices has an outgoing edge) but is not connected.

### ( c )
"Every non-empty, mangled graph is connected." This claim is true. Prove by contradiction.

**Proof.** Assume that a non-empty, mangled, non-connected graph $G$ exists. Then some subset of vertices $\lceil \frac n2 \rceil$ or smaller must be unconnected from the remainder of the vertices. (This is true because if any set of vertices larger than $\lceil \frac n2 \rceil$ is unconnected from the remainder, then a corresponding set smaller than $\lceil \frac n2 \rceil$---the remainder itself---is also unconnected from the larger set.) But by definition, a set $\lceil \frac n2 \rceil$ or smaller must have an outgoing edge, which must connect with one of the vertices outside the set...and therefore the graph is connected. But we assumed that $G$ is non-connected. The proof is established by the contradiction. $\Box$

## Problem 4
Start with the assertion that if a simple, connected graph $G$ is a tree with $n$ nodes, it has $n-1$ edges.

**Proof.** By induction. Base case: $n=2$. A simple, connected graph with $n=2$ can have only 1 edge, or it would not be either simple or connected.

Assume $P(n)$, that $G$ is a tree with $n$ nodes and $n-1$ edges. Adding another node to the tree, it must be connected to the tree (for the graph to remain connected) by at least one edge. Since $G$ is already connected, the new node can only be connected to one other node (must be of degree 1), or a cycle will be created (that is, no longer will be a tree). Therefore the addition of 1 node leads to the addition of 1 edge, and $P(n)$ implies $P(n+1)$.

Now show that if a simple, connected graph has $n-1$ edges, then $G$ is a tree.

**Proof.** By contradiction. Assume that a simple, connected graph with $n-1$ edges and $n$ vertices is *not* a tree. Then $G$ contains a cycle. Then the cycle can be broken by removing one edge, while leaving the graph simple and connected. Now, the simple and connected graph (assuming there are no other cycles) is a tree with $n-2$ edges. But by the above, a tree with $n$ vertices must have $n-1$ edges. This shows that $G$ cannot contain a cycle, and is therefore a tree. $\Box$

In reality, if there were a cycle, then $G$ would not have been a connected graph to begin with...one of the vertices would be floating.

## Problem 5
### (a)
I drew the graph in a separate document (PDF attached)

### (b)
The diameter of the graph is 2. The shortest walk between any two nodes is the first $k$ for which $a_{ij}^k > 0$, where $A$ is the adjacency matrix. For the given adjacency matrix, $a_{ij}^2 > 0 \,\, \forall i,j$.

### ( c )
A cycle is a closed walk in which ends at its beginning node and for which *all other nodes visited are distinct*. Therefore the longest cycle cannot be any greater than the number of nodes (plus 1), 7 in this case.

Determining whether there is a maximal cycle is the problem of determining if the graph is Hamiltonian. Not sure if there is supposed to be an algorithm for it...but after looking at the graph for a moment the cycle $\{3,4,2,1,6,5,3\}$ popped out at me. This is a Hamiltonian cycle, and is the maximum length cycle in the graph.

With some forethought, the graph can be drawn with the vertices in a big circle in the order in which they appear in the Hamiltonian cycle. That would make the cycle obvious. In hindsight, mine was close to that, which is probably why the cycle jumped at me so quickly.

### (d)
The maximum degree in the graph is 4, and the graph is therefore at worst 5-colorable.

Just try something first: Let $(v,C)$ be a coloring of vertex $v$. So assign first $(1,R)$; then since 1 does not connect to 5, also assign $(5,R)$. Now choose a different color for 2: $(2,B)$. 3 does not connect to 2, so assign also $(3,B)$. A third color for 4: $(4,Y)$; and can also do $(6,Y)$. This gives a 3-coloring.

The graph is not bipartite, and is therefore not 2-colorable. Therefore a 3-coloring is a minimum coloring. (The graph is in fact tripartite. An $n$-partite graph is at most $n$-colorable.)

## Problem 6
This problem shows that in any graph, a vertex of odd degree is connected to at least one other vertex of odd degree.

### (a)
$v$ is an odd degree node. Any longest walk that starts on $v$ that doesn't repeat any edges must end not on $v$. That is because in leaving $v$, an odd number of edges (incident to $v$) has been traversed, and on returning an even number has been traversed. Any walk that ends on $v$ must have traversed an even number of edges; but since there is an odd number of edges incident to $v$, a longer walk can always be formed by traversing one more edge and leaving $v$. The final node $w \not= v$.

### (b)
The final node $w$ is the final node only because the walk cannot continue (there are no edges incident to $w$ that have not already been traversed). $w$ is entered, in the first instance, by traversing one edge; if $w$ is left, a second (even-numbered) edge is traversed. On entering $w$, an odd-numbered edge is always traversed; therefore, if the walk ends on $w$, $w$ must be of odd degree.
