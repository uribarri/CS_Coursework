# Recitation 8

## Problem 1
False claim: if every vertex in a graph has a positive degree, the graph is connected.

### Prove the claim is false by counterexample
Consider a graph consisting of two connected components that are not themselves connected. All nodes have positive degree but the graph is not connected.

### Pinpoint the logical flaws in the proof of the false claim
The assertion that $P(1)$ holds vacuously is bad, since it does not actually hold. If a lone vertex exists in a graph $P(n)$, then $P(n+1)$ will not hold, even though under the assumption of $P(1)$ $P(n)$ holds.

[Note: the solutions are fairly dogmatic about how this is a build-up error and the only logical flaw is in the last statement that $P(n+1)$ is proved by the false proof. But I still think that the *reason* that the last statement is false is because the first assertion is false.]

## Problem 2
### (a) Prove that if $T=(V,E)$ is a tree, and $e$ in an edge not in $E$, then $G = (V,E \cup e)$ contains a cycle.

By contradiction. Assume that $G$ contains no cycle. Then $G$ must be a tree, and $|E \cup e| = |V| - 1$. But $T$ is a tree, and therefore $|E| = |V| - 1$, so the same cannot be said of $G$ since it contains one additional edge. Therefore $G$ cannot be a tree, and being a connected graph must therefore contain a cycle.

### (b) Prove that if $T = (V,E)$ is a spanning three of $G$, and $e \not\in E$, then $\exists e' \in E$ such that $T^* = (V,E-\{e'\}\cup \{e\})$ is also a spanning tree of $G$.

Because $T$ is a tree, the set $E \cup e$ will contain a cycle on $G$. But where there is a cycle, there are two independent paths between any two points on that cycle; therefore one path (and the cycle) can be disrupted by the removal of an edge $e'$ without disconnecting the graph. $T^*$ formed in this way is therefore a spanning tree as well.

### ( c ) Let $T = (V,E)$ be a spanning three of $G$. $e \not\in E$, $S \subseteq E$, $S \cup \{e\}$ contains no cycle. Prove $\exists (e' \not= e) \in E-S$ so that $T^* = (V,E-\{e'\} \cup \{e\})$ is a spanning tree.

The only difference between this Lemma and the last is the method of choosing $e'$. $E \cup \{e\}$ clearly contains a cycle. If $S \cup \{e\}$ contains no cycle, then some $e'$ can be chosen that breaks the cycle in $E \cup \{e\}$ and that $e'$ can come from among the edges in $E - S$ that complete the cycle in $E \cup \{e\}$. By the previous lemma, the remaining tree will also be a spanning tree.

### (d) $S_m$ is the set of the first $m$ edges chosen by the tree-growing algorithm from a connected graph $G$. $P(m)$: if $m \leq |V|$, then $S_m \subseteq E$ for some MST $T = (V,E)$ of $G$. Prove by induction that $P(m)$ is true $\forall m$.

The tree-growing algorithm chooses edges that form no cycles, so the set of edges $S_m$ forms a tree. Since by assumption $P(m)$ the set $S_m$ forms a portion of some MST for $G$, then the addition of the next edge by the growth algorithm, which adds the lowest-weight edge that forms no cycles, contributes the minimum weight to the sum of weights, and therefore must be part of an MST.

Case 1: $m+1 > |V|$. In this case some cycle is formed, and the resulting graph is not a tree. This shows that $m \leq V$.

Case 2: Subcase a. $m + 1 < |V|$. The argument above holds in this case, and the proposition $P(m+1)$ holds. Subcase b. $m + 1 = |V|$. In this case, the graph is also not a tree.

[Note: The solution proof chose its cases and subcases differently than I did. They also were a bit more descriptive; but I think everything in their description is implicit in my proof, and I assert that I was thinking each of those things as I made my proof.]

#### (e) Prove that the growth algorithm produces an MST of $G$.

By part (d), the set of edges $S_m$ formed by the growth algorithm forms a subset of $E$ of some MST as long as $m \leq |V|$. Assume that $S_{m=|V|-1} \subset E$. Then there exists at least one more edge $e \in E$ that is not part of $S_m$. However, by Lemma 1, $(V,S_m)$ is a tree because $m = |V|-1$. The addition of any additional $e$ will form a cycle by Lemma 2 (part a). This is not a tree, and therefore $E$ is not the set of edges of an MST. But since $S_m \subseteq E$, therefore $S_m = E$. $\Box$
