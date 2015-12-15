# Recitation 9

## Traveling Salesman Problem: the 3/2 approximation algorithm
The instructions are to apply the algorithm (I think it's the Christofides algorithm) to the "square" $4N+4$ case described. Here goes:

  1. Mentally, I construct a graph with an edge between all cities on the boundary of the square, and between all those cities and the ones sticking off the corners.
  2. Compute an MST of $G$. By the greedy algorithm from the last recitation, this will include all edges along the square's border, except for one (no cycles in a tree) and the edges from the four outliers to the nearest corners. Incidentally, this will have weight $(4N - 1)\cdot 1 + 4\cdot 2$.
  3. The degree of each corner is 3. The degree of each perimeter city is 2, except for the two between which the one edge has been removed; for these the degree is 1. The degree of the four outlier cities is 1.
  4. The set $S$ will consist of all corner points, all outlier cities, and the two cities with the edge between them removed.
  5. The minimum weight perfect matching consists of the corners and outliers, plus the edge between the two border cities. Total weight $2 \cdot 4 + 1$.
  6. $M \cup T$ consists of all the perimeter edges, and contains the edges between the corners and the outliers twice.
  7. An Euler circuit on this graph will hit all the perimeter edges and will also traverse the outlier edges twice (as they appear twice in the graph).
  8. The TSP tour on the ordering given by the Euler tour will travel the perimeter, and when hitting a corner go to the nearby outlier; it will then travel from the outlier to the next closest perimeter city, and continue until the circuit is complete. Total weight: depends on the distance from the outlier to the closest non-corner city.

## Proof of the 3/2-ness of the algorithm
  1. The cost of an MST is the minimum cost to connect all the vertices together (without prescribing an order). A tour of the cities must traverse at least one edge to get to each city; therefore any tour cannot cost any less than the MST.
  2. The proof that $|S|$ is even is by induction. $T$ is a tree, and is therefore connected and can therefore be built by adding nodes to subtrees of $T$ in progressive fashion. Let $m$ be the number of vertices in the subtree of $T$. Base case: n = 2. Here both nodes have degree 1, and therefore $|S|$ is even. Inductive step: assume $P(n)$ is true. Now add one more vertex to the subtree. This vertex will be of odd degree. It will be connected to one other vertex $v$. If $v$ is of odd degree, it becomes of even degree, and the total number of vertices with odd degree in the subtree is unchanged. If $v$ is of even degree, it becomes of odd degree, and the number of vertices of odd degree increases by two. Therefore in either case the even parity of $|S|$ is maintained. $\Box$
  3. Traversal of the nodes in $S$ will be required in actual execution of the TSP tour; or at least, some cost greater than the cost of traversing those nodes must be paid ($S$ is taken from an MST, after all). The greatest possible weight of traversing the nodes in $S$ will come if all the nodes in $T$ are of odd degree, and therefore $S$ contains all nodes in $T$. Since we are dealing with a min-weight perfect matching, the sum of the distances between pairs of matching partners is greater than the total weight of the minimum-weight matching, by definition. Therefore, to traverse all nodes in $S$ (which in this assumption is all nodes in $T$), one must first traverse each edge in the matching, and then must add the cost of traveling *between* matching pairs, which can be no less than the cost of traversing the edges *within* pairs. Therefore the weight of the matching can be no larger than $OPT/2$. $\Box$
  4. To see that $G'$ has an Euler tour, note that by construction, the edges of $G'$ consist of all those in the MST, plus one extra edge incident upon each vertex in the MST with odd degree. Therefore every vertex has even degree, and it is clearly a connected graph. By Theorem 5.6.3 (from the reading), $G'$ has an Euler tour if and only if every vertex has even degree. The cost of the tour is established as follows: The edges in $G'$ are made up of the MST edges and the edges in the perfect matching of $S$. The weight of MST $\leq OPT$ by proof $1$. It's already established that the cost of traversing the edges in the perfect matching on $S$ is $\leq OPT/2$. Therefore an Euler tour of $G'$ can have a cost of no less than the sum of these, or $3\cdot OPT/2$.
  5. The Euler tour of $G'$ traversed each edge of $G'$ exactly once, and therefore it visited each city in $G$. If no cities were visited more than once, then the length of the Euler tour is the length of the TSP tour. If any cities were visited more than once, then a TSP tour can be formed by executing the Euler tour, and replacing the set of edges that traverse any city a second, third, ... time by a direct path between the present city and the next non-visited city. By the triangle inequality, this new direct path will be shorter than the path of the Euler tour. In this case, the length of the TSP tour $<$ the length of the Euler tour. Therefore $L_{TSP} \leq L_{Euler}$. $\Box$
  6. This series of proofs has determined the length of the path determined by the 3/2 algorithm. Therefore, the algorithm produces a path no longer than $3 \cdot OPT/2$. $\Box$

  ## Observations from the solutions
  The solutions make a good point that the TSP must make a cycle among the vertices, and deleting one edge (which can't increase the weight) forms a spanning tree, whose weight can't be greater than the weight of an MST. Way easier to visualize than my argument, though both are correct.

  Their answer to part 6. was the same as mine, but much more succinct. "Indeed it does."