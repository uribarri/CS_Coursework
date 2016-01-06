# Recitation 13

## Problem 1
The following order symbols apply:

  * $2n + \ln n$, $n$: $O$,$\Omega$,$\Theta$
  * $\ln n$, $n$: $O$, $o$
  * $\Omega$, $\omega$
  * $\Omega$, $\omega$
  * $O$, $o$

## Problem 2
$f \sim g$, so:

### $2f \sim 2g$?
$\lim_{x \rightarrow \infty} 2f/2g = \lim_{x \rightarrow \infty} f/g = 1$ $\Box$

### $f^2 \sim g^2$?
$\lim_{x \rightarrow \infty} \left(f/g\right)^2 = 1^2 = 1$ $\Box$

### $2^f \not \sim 2^g$ for what $f,g$?
$f(x) = x$, $g(x) = x+1$; $\lim_{x \rightarrow \infty} 2^f/2^g = 1/2 \not = 1$

### $\sim$ an equivalence relation?
(All limits are for $x \rightarrow \infty$)
  * Reflexive: $f\sim f$ (obvious)
  * Transitive: $\lim f/g = 1$, $\lim g/h = 1$; $\lim f/h = \lim (f/g)(g/h) = 1 \cdot 1 = 1$
  * Symmetric: $\lim f/g = \lim g/f \implies g \sim f$

### $\Theta$ an equivalence relation?
(In the following, all constants $0 < k_i < \infty$)
  * Reflexive (obviously)
  * Transitive: $\lim f/g = k_1$, $\lim g/h = k_2$; $\lim f/h = \lim (f/g)(g/h) = k_1k_2 < \infty$
  * Symmetric: $\lim f/g = k_1$; $\lim g/h = 1/k_1 < \infty$

(In these last two problems, if inverting $f/g$ is not valid (if one $=0$ in the limit), then it is valid for their derivatives via L'Hopital's Rule. No problem.)

## Problem 3

### 1
$$\lim_{n\rightarrow\infty} (an)^{b/n} = \lim_{n\rightarrow\infty} a^{b/n} 2^{b\log_2 n/n}$$
$$= \lim_{n\rightarrow\infty} a^{b/n} \lim_{n\rightarrow\infty} 2^{b\log_2 n/n} = a^0 2^0 = 1$$
Therefore $(an)^{b/n} \sim 1$.  $\Box$

### 2
Show $(n!)^{1/n} = \Theta(n)$

Starting from Stirling's formula, $n! \sim \sqrt{2\pi n} (n/e)^n$. Since we're given that $f\sim g \implies f^{1/n} \sim g^{1/n}$, this means that $(n!)^{1/n} \sim (2\pi n)^{1/2n} (n/e)$.

$$\lim_{n\rightarrow \infty} \frac{(2\pi n)^{1/2n} (n/e)}{n} = \frac 1e$$

$0 < 1/e < \infty$, therefore $(n!)^{1/n} = \Theta(n)$.  $\Box$


## Notes from the solutions
None of substance. I crushed this one, often using the exact same notation that they did. Without doing the reading first. I must be on the same wavelength here. Sweet.
