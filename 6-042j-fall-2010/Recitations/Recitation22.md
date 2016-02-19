# Recitation 22
## Problem 1
### (a)
$$Var[R] = E[(R - E[R])^2] = E[R^2 - 2RE[R] + E[R]^2]$$
$$ = E[R^2] - 2 E[R]E[R] + E[R]^2 = E[R^2] - E[R]^2$$
$$\Box$$

### (b)
$$Var[aR+b] = E[(aR+b - E[aR+b])^2]$$
$$ = E[(aR+b)^2 - 2(aR+b)E[aR+b] + E[aR+b]^2]$$
$$= E[a^2R^2 + 2abR + b^2] - 2E[aR+b]^2 + E[aR+b]^2$$
$$ = a^2 E[R^2] + 2ab E[R] + E[b^2] - (a E[R] + b)^2$$
$$= a^2 E[R^2] + 2ab E[R] + b^2 - a^2 E[R]^2 - 2ab E[R] - b^2$$
$$ = a^2 (E[R^2] - E[R]^2) = a^2 Var[R]$$

The standard deviation $\sigma(aR) = a \sigma(R)$ therefore.

### ( c )
$$Var[R_1 + R_2] = E[(R_1 + R_2 - E[R_1 + R_2])^2]$$
$$ = E[(R_1 + R_2)^2] - E[R_1 + R_2]^2$$
$$ = E[R_1^2] + 2 E[R_1R_2] + E[R_2^2] - E[R_1]^2 - 2E[R_1]E[R_2] - E[R_2]^2$$
$$ = (E[R_1^2] - E[R_1]^2) + (E[R_2^2] - E[R_2]^2) = Var[R_1] + Var[R_2]$$

where the penultimate step required the independence of $R_1$ and $R_2$ to distribute the expectation over the product of the random variables.

### (d)
Suppose that $R_2 = 2 R_1$. Then $R_2$ is totally dependent on $R_1$. Let $R_1 = \{-1,1\}$ with probability $1/2$ each. Then $E[R_1] = 0$, $Var[R_1] = 1$, $E[R_2] = 0$, $Var[R_2] = 4$.
$$Var[R_1 + R_2] = Var[3 R_1] = 9 Var[R_1] = 9 \neq 4+1$$

### (e)
The variance of an indicator random variable is
$$Var[J] = E[J^2] - E[J]^2 = (0^2 (1-p) + 1^2 p) - p^2 = p - p^2 = p(1-p)$$
By linearity of variances as proved in part ( c ), we have
$$Var[H_{n,p}] = np(1-p)$$

### (f)

$$Var[T] = E[T^2] - E[T]^2 \leq E[T^2]$$
$$E[T] = \sum_{p_k\in\{p\}} p_kT_k$$
$$E[T^2] = \sum_{p_k\in\{p\}} p_kT_k^2 = \sum_{p_k\in\{p\}} (p_kT_k)T_k$$

Every term in the sum defining $E[T^2]$ is equal to or smaller than every corresponding term in $E[T]$, because $0\leq T_k \leq 1$. Therefore
$$E[T] \geq E[T^2] \geq Var[T]$$
$$\Box$$
