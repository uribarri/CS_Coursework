# Recitation 11

## Problem 1

### (a)
Equivalence classes for $x \equiv y \mod 3$:

$$\{...,-6,-3,0,3,6,...\}$$
$$\{...,-5,-2,1,4,7,...\}$$
$$\{...,-4,-1,2,5,8,...\}$$

### (b)
Equivalence classes for the ceiling function $\lceil x \rceil$.

$$\{y \,\, |\,\, y \leq \lceil x \rceil \wedge y > \lceil x-1 \rceil$$

## Problem 2
### (a)
`divides` is not an equivalence relation because
  * it is reflexive (every number divides itself)
  * it is transitive ($x | y \wedge y | z \implies x | z$)
  * but it is not symmetric ($x | y \not \implies y | x$)

### (b)
`implies` is not an equivalence relation because
  * it is reflexive
  * it is transitive
  * but it is not symmetric (`implies` and `iff` are distinct)

## Problem 3
### (a)
The Hasse diagram is attached separately

### (b)
The largest chain is `18.01` $\rightarrow$ `18.03` $\rightarrow$ `6.02` $\rightarrow$ `6.004` $\rightarrow$ `6.033` $\rightarrow$ `6.857` with length 6.

### ( c )
The minimum number of terms is the length of the longest chain, or 6.

### (d)
The largest antichain is 2, since there are two branches of the poset which have no relation to one another (`8.01` and `18.01`).

### (e)
The maximum number of classses that can be taken at once is five, for example, `6.01`, `18.02`, `18.03`, `6.042`, and `8.01`.

### (f)
One possible topological sort of this scheme is:
  * `8.01`
  * `8.02`
  * `18.01`
  * `18.02`
  * `18.03`
  * `6.042`
  * `6.046`
  * `6.840`
  * `6.01`
  * `6.02`
  * `6.034`
  * `6.003`
  * `6.004`
  * `6.033`
  * `6.857`

### (g)
Eight terms are required to graduate if only 2 courses are taken per semester.

### (h)
Six terms would be required with three courses per semester.

### (i)
Without knowing the precise prerequisite structure for Stanford's program, the following can be said:
  * if no class is a prerequisite for any other class, then the minimum number of semesters required is $\lceil n/k \rceil$.
  * if the length of the longest chain is $l$, then it will take at least $l$ semesters.


## Notes on the solutions
The given solution for `1(b)` is equivalent to mine but may be a bit more elegantly stated.

I messed up `3(a)` through carelessness; the attached pdf has the portions that I messed up marked with an asterisk.

I really messed up `3(d)`. Apparently antichains are not counted back upward against the directions of the edges. But I did get the maximum number of classes in `3(e)`, which is equivalent to the maximum antichain length. So I just didn't get the definition of antichain quite right.

I nailed `3(i)`, nearly word-for-word.
