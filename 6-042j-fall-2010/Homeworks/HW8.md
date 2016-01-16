# Homework 8

## Problem 1
Find $\Theta$ bounds for all recurrences. Assume $T(1) = 1$.

I'm not sure why they give $T(1)$. That's irrelevant to the $\Theta$ bound.

### (a)
$$T(n) = 8 T(\lfloor n/2 \rfloor) + n$$
The presence of the floor function is irrelevant. $g(n) = n$, $ab^p = 1 \implies p = 3$.

$$T(n) = \Theta \left(n^3 \left(1 + \int_1^n \frac{u}{u^4} du\right)\right)$$
$$= \Theta \left(n^3 + n^3\left[-(1/2)/u^2\right]_1^n\right) = \Theta \left(n^3\right)$$

### (b)
$$T(n) = 2 T(\lfloor n/8 \rfloor + 1/n) + n$$
The presence of the floor function is irrelevant, as is the $h(n)$ present as it meets the big-O criterion. $g(n) = n$, $ab^p = 1 \implies p = 1/3$.

$$T(n) = \Theta \left(n^{1/3} \left(1 + \int_1^n \frac{u}{u^{4/3}} du\right)\right)$$
$$= \Theta \left(n^{1/3} + n^{1/3}\left[\frac 32 u^{2/3}\right]_1^n\right) = \Theta \left(n\right)$$

### ( c )
$$T(n) = 7 T(\lfloor n/20 \rfloor) + 2 T(\lfloor n/8 \rfloor) + n$$
The presence of the floor function is irrelevant. $g(n) = n$
$$\sum ab^p = 7\cdot (1/20)^p + 2 \cdot (1/8)^p = 1 \implies p \approx -0.52765$$

$$T(n) = \Theta \left(n^{-0.528} \left(1 + \int_1^n \frac{u}{u^{0.472}} du\right)\right)$$
$$= \Theta \left(n^{-0.528} + n^{-0.528}\left[\frac{1}{1.528} u^{1.528}\right]_1^n\right) = \Theta \left(n\right)$$

### (d)
$$T(n) = 2 T(\lfloor n/4 \rfloor + 1) + n^{1/2}$$
The presence of the floor function is irrelevant. $g(n) = n^{1/2}$, $ab^p = 1 \implies p = 1/2$.

$$T(n) = \Theta \left(n^{1/2} \left(1 + \int_1^n \frac{u^{1/2}}{u^{3/2}} du\right)\right)$$
$$= \Theta \left(n^{1/2} + n^{1/2}\left[\log u\right]_1^n\right) = \Theta \left(n^{1/2} \log n\right)$$

### (e)
$$T(n) = 3 T\left(\lfloor n/9 \rfloor + n^{1/9}\right) + 1$$
The presence of the floor function is irrelevant. $g(n) = 1$, $ab^p = 1 \implies p = 1/2$.

$$T(n) = \Theta \left(n^{1/2} \left(1 + \int_1^n \frac{1}{u^{3/2}} du\right)\right)$$
$$= \Theta \left(n^{1/2} + n^{1/2}\left[-2/u^{1/2}\right]_1^n\right) = \Theta \left(n^{1/2}\right)$$

**Note.** I wish I had solutions to compare these with. It seems like the kind of thing that could go wrong in many ways and I have no way of telling except to re-check myself.

## Problem 2
### (a)
$n$ is being treated like a variable in the false proof, when it is a constant. It does not make sense.

### (b)
Proceeding with the inductive step of the contrived "proof":
$$T(n + 1) = 4 T((n+1)/2) + n+1 \leq 4 c (n+1)/2 + (n+1) = (2c+1)(n+1)$$
by inductive hypothesis. But
$$(2c+1)(n+1) \not \leq c(n+1)$$
so the inductive proof fails.

### ( c )
$$T(n) = 4 T\left(n/2\right) + n$$
$g(n) = n$, $ab^p = 1 \implies p = 2$.

$$T(n) = \Theta \left(n^{2} \left(1 + \int_1^n \frac{u}{u^{3}} du\right)\right)$$
$$= \Theta \left(n^{2} + n^{2}\left[- u^{-1}\right]_1^n\right) = \Theta \left(n^{2}\right)$$

### (d)
In order for any $T(n) = O(n)$, from Akra-Bazzi we argue that it is sufficient for:
$$p \leq 1$$
This means that the first term in Akra-Bazzi will be $n^p$, the second will be an integral of something $O(1/n^{p})$, which will be $O(1/n^{p-1})$, multiplied by $n^p$, which will be $O(n)$. So since $p \leq 1$, $T(n) = O(n)$. Therefore $b \leq 1/a$ is a sufficient condition.

## Problem 3
$$A_0 = 2$$
$$A_{n+1} = A_n/2 + 1/A_n$$

**Proof.** By induction.

Base case: $A_0 = 2 < \sqrt 2 + 1/2^0 = 2.414...$.

Inductive step: Assume $A_n \leq \sqrt2 + 1/2^n$.
$$A_{n+1} = A_n/2 + 1/A_n = \frac{\sqrt 2}{2} + \frac{1}{2^{n+1}} + \frac{1}{\sqrt 2 + 1/2^n}$$
$$\leq \frac{\sqrt 2}{2} + \frac{1}{2^{n+1}} + \frac{1}{\sqrt 2} = \sqrt 2 + \frac{1}{2^{n+1}}$$
$$\Box$$


## Problem 4
### (a)
$$x_n = 4x_{n-1} - x_{n-2} - 6x_{n-3}$$
The characteristic equation will be
$$\alpha^3 -4\alpha^2 + \alpha + 6=0$$
The roots are $\alpha = -1$, $\alpha = 2$, and $\alpha = 3$.
So the general solution will be
$$x_n = c_1(-1)^n + c_2 2^n + c_3 3^n$$
Using the boundary conditions:
$$c_1 + c_2 + c_3 = 3$$
$$-c_1 + 2c_2 + 3c_3 = 4$$
$$c_1 + 4c_2 + 9c_3 = 14$$

So $c_1 = c_2 = c_3 = 1$ and $x_n = (-1)^n + 2^n + 3^n$.

### (b)
$$x_n + x_{n-1} -2x_{n-2} = n$$
Homogeneous characteristic equation is
$$\alpha^2 + \alpha - 2 = 0$$
so $\alpha = -2$ and $\alpha = 1$.

The particular solution requires the form $x_n = an^2 + bn + c$, and solving through gives $c=0$, $b = 7/18$, $a = 1/6$.

Now the total solution is
$$x_n = c_1 (1)^n + c_2 (-2)^n + (n^2/6) + 7n/18$$

Using the boundary condition $x_0 = 5$, we have $c_1 + c_2 = 5$. Using the second boundary condition,
$$-\frac 49 = c_1 + (5-c_1)(-2) + 1/6 + 7/18$$
$$-\frac 49 = 3c_1 - 170/18$$
$$c_1 = 3, c_2 = 2$$

The total solution is then
$$x_n = 3 + (-1)^n 2^{n+1} + n^2/6 + 7n/18$$

As unlikely as it looks, that is the correct answer.
