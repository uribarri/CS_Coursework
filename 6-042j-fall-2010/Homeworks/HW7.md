# Homework 7
## Problem 1
Express
$$\sum_{i=0}^{n} i^2 x^i$$
as a closed-form function of $n$.

Recognize that
$$x \frac{d}{dx}\left[x \frac{d}{dx}\sum_{i=0}^{n} x^i\right]$$
gives the sum that we want. So just compute
$$x \frac{d}{dx}\left[x \frac{d}{dx}\left(\frac{1-x^{n+1}}{1-x}\right)\right]$$
(which I did not do by hand because I unlocked the Mathematica achievement long ago...) to get
$$\frac{x((n(x-1)(n(x-1)-2)+x+1)x^n - x - 1)}{(x-1)^3}$$


## Problem 2
### (a)
$$\prod_{k=1}^{n}2^{2k-1}$$
$$\sum_{k=1}^{n} (2k-1) = 2\sum_1^n k - n = n^2$$
$$\implies \prod_{k=1}^{n}2^{2k-1} = 2^{n^2}$$

### (b)
$$\sum_{i=0}^n \sum_{j=0}^m 3^{i+j} = \sum_{i=0}^n 3^i \sum_{j=0}^m 3^{j}$$
$$ = \left(\frac{1-3^{n+1}}{1-3}\right) \left(\frac{1-3^{m+1}}{1-3}\right)$$
$$\frac14 (3^{n+1}-1)(3^{m+1}-1)$$

### ( c )
$$\sum_{i=1}^n \sum_{j=1}^n (i+j) = \sum_{i=1}^n \left(ni + \frac{n(n+1)}{2}\right)$$
$$= n^2(n+1)$$

### (d)
$$\prod_{i=1}^n \prod_{j=1}^n 2^i 3^j$$
$$\sum_{i=1}^n \sum_{j=1}^n \left(i + j \log_2(3)\right)$$

## Problem 3
### (a)
Approximate the following within 0.1:
$$\sum_{i=1}^\infty \frac{1}{(2i+1)^2}$$
$$I_k = \int_k^\infty \frac{1}{(2x+1)^2} dx = \left[-\frac{1/2}{2x+1}\right]_k^\infty = 0 - \left[-\frac{1/2}{2k+1}\right]$$

Now the bounds for this non-increasing function will be
$$I_k + f(\infty) \leq S \leq I_k + f(k)$$

So just choose the first $f(k) < 0.1$, which is $f(k=2) = \frac{1}{25}$. So $S = I_k + \sum_{i<k} f(i)$ and for $k=2$, we have $I_2 = 1/10$ and $S = \frac{1}{10} + \frac{1}{9}$ to within $\frac{1}{25}$.

### (b)
#### 1.
The inequality
$$\sum_{i=1}^n \ln(i+1) \leq \int_0^n \ln(x+2) dx$$
holds, because the variable transformation $x = y-1$ holds:
$$\int_0^n \ln(x+2) dx = \int_1^{n+1} \ln(y+1) dy$$
Because the integration extends to $n+1$, it covers the $f(n)$ that is usually part of the upper bound for nondecreasing functions. This inequality therefore holds.

#### 2.
The inequality in this part is wrong, because it states that
$$\sum_{i=1}^{n} \leq I + f(1)$$
but for this nondecreasing function $\ln(i+1)$, the correct inequality is
$$\sum_{i=1}^{n} \leq I + f(n)$$


## Problem 4
### (a)
In each step, the bug walks 1 cm, and then the length of the rug is increased by 1 m. Therefore the length of the rug at step $i$ is $i$, and the fraction crossed is $f_i = 0.01/i$.

### (b)
In $n$ seconds the bug crosses a fraction
$$f_n = \sum_{i=1}^n \frac{0.01}{i} = 0.01H_n$$
of the rug.

### ( c )
We must find out where $0.01H_n = 1$ to get the time taken to cross the rug. We could employ integration to bound the problem, in which case we find that for $H_n = 100$ $\exp(99) \leq n \leq \exp(100)$. Using Mathematica, we find the precise number $n=1.509 \times 10^{43}$. It takes a darn long time.


## Problem 5
### (a)
$$\frac{\log_2(n)}{\log_{10}(n)} = \frac{\log_2(n)}{\log_{2}(n)/\log_2(10)} = \log_{2}(10)$$

$$\implies \log_2(n) = \Theta(\log_10(n))$$
Therefore also $O$ and $\Omega$.

### (b)
$$\frac{2^n}{10^n} = 2^{1-\log_2(10)} = 2^{-2.3...n} \rightarrow^{n\rightarrow \infty} 0$$

Therefore $2^n = o(10^n)$ and $O(10^n)$.

### ( c )
$$\frac{0}{17} \rightarrow 0$$
Therefore $0 = o(17), O(17)$.

### (d)
$$\frac{1 + \cos(\frac{\pi n}{2})}{1+\sin(\frac{\pi n}{2})}$$
There is no $c$ for which $|f(x)| \leq c |g(x)|$ for all $x$ or vice versa, since both $f,g = 0$ at some points in the oscillation. No asymptotic relation holds.

### (e)
$$\frac{f(x)}{g(n)} \rightarrow \infty$$
for $n\rightarrow \infty$. ($n$ does have to be absolutely enormous, though.) This makes $f(n) = \omega(g(n)), \Omega(g(n))$.

## Problem 6
### (a)
$$\frac{n!}{(n+1)!} = \frac{1}{n+1} \rightarrow 0$$
This makes $n! = o((n+1)!), O((n+1)!)$. None of the others hold.

### (b)
Using Stirling's formula, $n! \approx \sqrt{2\pi n} \left(\frac{n}{e}\right)^n$.
$$\frac{\sqrt{2\pi n} \left(\frac{n}{e}\right)^n}{(n/3)^{n+e}} = \frac{1}{n^{e-1/2}} \left(\frac{3}{e}\right)^n \rightarrow \infty$$
Therefore $n! = \omega\left(\left(\frac{n}{3}\right)^{n+e}\right)$.

### ( c )
$$\frac{\sqrt{2 \pi n}\left(\frac{n}{e}\right)^n}{2^n} = \sqrt{2\pi} \frac{n^n}{(2e)^n} \rightarrow \infty$$

Therefore $n! = \omega(2^n)$, and therefore $n! = \Omega(2^n)$.
