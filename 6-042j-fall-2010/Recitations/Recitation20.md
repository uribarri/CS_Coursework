# Recitation 20
## Problem 1
If we want to bound $P\{\text{# heads} \geq \beta n\}$ from above, then we can equivalently ask for the upper bound on $P\{\text{# tails} \leq \alpha n\}$, where $\alpha = 1-\beta$. We must also do the replacement $p \rightarrow 1-p$, since we're keeping track of tails. Since $\beta > p$, $1-\beta < 1-p$. This sets us up to use the upper bound formula.

The entropy function with $\alpha = 1-\beta$ is
$$H(\beta) = -(1-\beta)\log_2(1-\beta) - \beta \log_2(\beta)$$
or exactly the same.

Simply doing all the replacements, we then get
$$P\{\text{# heads} \geq \beta n\} \leq \frac{\beta}{1-(1-\beta)/(1-p)} \frac{2^{nH(\beta)}}{\sqrt{2\pi \beta (1-\beta)n}} p^{\beta n} (1-p)^{(1-\beta)n}$$

The resulting formula is mostly the same, with the exception of the first factor.

## Problem 2
### (a)
The probability of estimating too low is the cumulative distribution function from 0 up to $p-0.04$.
$$P\{q \leq p - 0.04\} = F_{n,p}((p-0.04)n) < \frac{1-(p-0.04)}{1-(p-0.04)/p} f_{n,p}((p-0.04)n)$$

### (b)
The probability of estimating too high is the complement to the CDF from 0 to $p+0.04$.
$$P\{q \geq p + 0.04\} = 1 - F_{n,p}((p+0.04)n)$$

### ( c )
The PDF here is symmetric about $1/2$; and since the sum of the probabilities of too high and too low are maximized for $p = 1/2$, we can just use twice the probability of too low to account for both it and too high.

$$P(|q - p| > 0.04) \leq 2F_{n,1/2}(0.46n)$$
The numerical solution to this problem is done in the text. I'm not going to re-do it here.

$$ < \frac{10.81 \cdot 2^{-.00462n}}{\sqrt n}$$

The upper bound at $n = 640$ is therefore 0.055. Gallup's poll misses the mark by about half a percentage point, if they were shooting for 95% chance of being within $\pm 4\%$.

I'm going to work this out for within $\pm 3\%$, just so that I'm forced to do the numbers myself.

The upper bound in this case is 0.17. Bad. They'd need 1175 respondents to get to within 5% on that.

## Problem 3
The binomial distribution in this case is the generalized one:
$$P_n(k) = {n \choose k} p^{k} (1-p)^{n-k}$$
$p = 0.01$, and $n = 10^4$. The probability of losing 2% of the packets, or 200 of them, is
$$P_{10^4}(200) = {10^4 \choose 200} 0.01^{200} (.99)^{10^4-200}$$

Since $\alpha > p$, we need to use the complementary probability $(1-p) = .99$ and the complementary $(1-\alpha) = 0.98$. Then the condition holds.

We'll just estimate this with the approximate formula, thanks. $\alpha = 0.98$, $p = .99$ and
$$f_n(\alpha n) \leq \frac{2^{n \left(\alpha \log_2\left(\frac {p}{\alpha}\right) + (1-\alpha) \log_2\left(\frac{1-p}{1-\alpha}\right)\right)}}{\sqrt{2 \pi \alpha (1-\alpha) n}}$$
And the CDF approximation has a factor of $(1-\alpha)/(1-\alpha/p)$ in front of that $f_n(\alpha n)$.

And we get $5.7 \times 10^{-19}$. Very unlikely.

## Notes from the solutions
I did not like this recitation much, given that two of the problems were taken straight from the textbook. I re-did as many things as I could and changed some things up, to force out some learning...but it wasn't nearly as thought-provoking as many others have been.
