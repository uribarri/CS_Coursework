# Recitation 14

## Problem 1

### 1
To merge three lists of one item each requires three comparisons.

### 2
In the worst case, $2n-3$ comparisons are needed to merge three lists of length $n/3$.

### 3
$$T(n) = 3T\left(\frac n3\right) + 2n-3$$

### 4
For Akra-Bazzi, $p=1$.

### 5
For this recurrence, $g(x) = 2x - 3$, so $|g'(x)| = O(x^c)$ for any $c\geq 0$.

### 6
$$T(x) = \Theta \left(x\left(1+\int_1^x \frac{2u-3}{u^2}du\right)\right)$$
$$T(x) = \Theta(2x \ln x)$$
This is the same theta bound (up to constant factors) as for the regular MergeSort algorithm. (The constant $2$ doesn't matter.)

### 7
The equivalence of upper bounds for any partitioning of lists comes from the following:

  * A partitioning of a list $k$ ways requires $k$ sub-sorts.
  * In terms of Akra-Bazzi, this makes $ab = 1$, so $p = 1$ always.
  * $g(x)$ is always a first-degree polynomial in $x$, so the integral term never changes order.


## Problem 2
### 1
The particular recurrence $T_n = T_{n-1} + T_{n-2} + 1$ is just an inhomogeneous form of the Fibonacci sequence. So the homogeneous solution is the Fibonacci solution: $T_H(n) = c_1 \phi_+^n + c_2 \phi_-^n$

The particular solution $T_p$ can just be a constant $c$; plugging in, we find $c = -1$.

Using the initial conditions, the constants are $c_2 = 1-c_1$, $c_1 = \frac{2-\phi_-}{\phi_+ - \phi_-}$. So the total solution is

$$T(n) = \frac{2-\phi_-}{\phi_+ - \phi_-} \phi_+^n + \frac{\phi_+ - 2}{\phi_+ - \phi_-} \phi_-^n - 1$$

This checks out for the first 10 values of the sequence.

### 2
For this recurrence, the characteristic equation is $(\alpha - 3)^2 = 0$, so $3$ is a double root. The solution is therefore $S(n) = c_1 3^n + c_2 n 3^n$.

Plugging in the initial conditions, we find $c_1 = 0$, $c_2 = 1/3$, so that the solution is

$$S(n) = n3^{n-1}$$

## Notes on the solutions
All is pretty identical, except that I didn't reduce my constants to the inhomogeneous Fibonacci recursion as far as the solutions did. Reduction is where algebraic errors creep in, so I often don't bother.
