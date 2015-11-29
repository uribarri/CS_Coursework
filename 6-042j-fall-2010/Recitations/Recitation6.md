# Recitation 6

## Problem 1
Show that a unidirected graph $v_1,v_2,...,v_n$ of width $w$ is $(w+1)$ colorable. It is unclear what dictates the ordering of the vertices...except that the measure $w$ can be minimized by a particular set of orderings. There is no requirement that the number of connections must change monotonically with the index of the vertex...so I'm not sure what this is supposed to be about. A number of measures of graph width in the literature (internet) are available and they don't illuminate what is being thought about here.

**Proof.** By induction on $n$. $P(n)$ is the proposition that an $n$-vertex graph with width $w$ is $(w+1)$-colorable.

Base case $(n=1)$: A 1-vertex graph has maximum width $w$ = 0. It is 1-colorable.

Inductive step: Consider adding one vertex to an $n$-vertex graph $G$. Because of the uncertainty described above as to the nature of the graph, let the new vertex be $v_{n+1}$ in the ordering. Let the new graph be $G'$. Since $G$ is of width $w$, it is $(w+1)$-colorable. Now the new vertex $v_{n+1}$ on $G'$ will be connected to as many as $w$ of its predecessors. So as many as $w$ colors will be unavailable to it, but it may always take the $(w+1)$ color. Any graph can be built up by this process of adding in vertices while keeping the width $w$; so even if the new vertex is not added at the end of the sequence, but in the middle, the coloring of the graph can always be re-done according to this formula and will always take no more than $(w+1)$ colors. $\Box$

## Problem 2
A planar graph is (as I surmised from the reading) a graph in which none of the edges cross.

### Show that any subgraph of a planar graph is planar.
**Proof.** A subgraph $G'$ is produced from graph $G$ by removing nodes (and their incident edges) or just edges. If $G$ is planar, then no edges cross. The removal of any node (and its associated edges) or of any edge cannot create any new edge crossings; therefore the subgraph $G'$ is planar as well. $\Box$

### Any planar graph has a node of degree at most 5. Prove that any graph can be colored in at most 6 colors.

First, this can't be true. I can draw a star graph with the center vertex having arbitrary degree, and it's still a planar graph. The star graph is 2-colorable, though, so the hypothesis may still be true. Perhaps what is meant is any *complete* planar graph. (Still, I can't come up with a complete planar graph with any vertex of degree greater than 3.) So I have no idea what the first sentence of this statement is supposed to be about.

**Proof.** By induction. $P(n)$ states that any planar graph is colorable by no more than 6 colors.



Base case $(n=1)$: Any 1-node graph can be colored in 1 color, $<$ 6 colors.

Inductive step. The addition of any vertex $v_{n+1}$ to the $n$-vertex graph. The maximal degree of the graph $d$ is maintained by adding the new vertex. Therefore, the new vertex can connect to other vertices using at most $d$ colors. The $(d+1)$ color is available. If, therefore, the maximal degree is $5$, the planar graph can be colored in $6$ colors.

This is deeply unsatisfying because of the use of the baseless claim at the beginning about maximal degree $5$. A stronger hypothesis says that the maximal number of colors required will come from the complete planar graph. Building a complete planar graph, $K_1, K_2, K_3$ can all be formed leaving all nodes accessible. But $K_4$ is the largest complete planar graph. After that, any complete-as-possible (technical term?) planar graph can only add a vertex with at most degree 3. Therefore by the proof above the complete planar graph is 4-colorable.
