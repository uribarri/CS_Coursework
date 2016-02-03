# Recitation 19
## Problem 1: Bayes' Rule
### (a)

To prove Bayes' Rule, just note that by definition:
$$P(A|B) = \frac{P(A \cap B)}{P(B)}$$
and
$$P(B|A) = \frac{P(B \cap A)}{P(A)}$$
therefore
$$P(A \cap B) = P(A|B)P(B) = P(B|A) P(A)$$

### (b)
Using Bayes' Rule:
$$P(\text{rains|umbrella}) P(\text{umbrella}) = P(\text{umbrella|rains})P(\text{rains})$$
We know most of these numerical values:
$$P(\text{rains|umbrella}) = \frac{(0.8)(0.3)}{(0.4)} = 0.6$$

There's a 60% chance of rain.

## Problem 2
## (a)
By the Birthday Principle, the probability of *no* coincidental match is about
$$\exp{\left(-\frac{m^2}{2N}\right)}$$
where $m$ is the number of people and $N$ the number of DNA types. The argument numerical value is
$$-\frac{m^2}{2N} = -\frac{(300 \times 10^6)^2}{2(20 \times 10^9)} = -2.25\times 10^6$$
That probability (of *no* match) is indistinguishable from zero. Therefore the probability of a match is 1.

##(b)
The flaw in the defense attorney's argument is that the probability of the defendant having a match for *his* DNA type specifically is very small.

The number of ways that DNA types can be assigned to 300 million Americans is
$$(20 \times 10^9)^{300 \times 10^6} \equiv a^b$$
That expression defines $a$ and $b$. The number of ways that DNA types can be assigned to every American other than the defendant is
$$(a)^{b-1}$$
The number of ways every DNA type *other than the defendant's* can be assigned to every American other than the defendant is
$$(a-1)^{b-1}$$

The probability of the rest of America having a different DNA type than the defendant is therefore
$$\left(\frac{a-1}{a}\right)^{b-1} \approx \left(1-\frac 1a \right)^{b-1} \approx 1 - \frac{b-1}{a}$$
which is, numerically,
$$0.985$$

There is therefore only a 1.5% chance that the defendant has a DNA match with another person anywhere in America.

#### Note from the solutions
If we take as given that there are $n$ people who match the DNA at the crime scene, then the probability of the defendant being guilty is $1/n$...or not better than 50% for any $n > 1$.

## Problem 3
### (a)
My intuition tells me that if the coin forged in the fires of eternity is crafted so that the probability of heads is $p = 1/n$, then there is good probability that $n$ flips will produce exactly one head.

### (b)
The probability of exactly one head being flipped is easy to see by visualizing the tree: a binary tree, where one branch is labeled $p$, the other $1-p$. The probability of any particular Immortal flipping the only heads is $p(1-p)^{n-1}$; there are $n$ immortals, so there are $n$ different ways of flipping exactly one heads...so the total probability of flipping exactly one heads is $np(1-p)^{n-1}$.

### ( c )
The probability is maximized by setting
$$ \frac{\partial }{\partial p} \left(np(1-p)^{n-1}\right)= 0$$
This works out to
$$p = \frac 1n$$

### (d)
The probability of success is therefore
$$\left(1-\frac 1n\right)^{n-1}$$

This can be rearranged to
$$\frac{1}{1-\frac 1n} \left(1- \frac 1n \right)^n$$
which, in the limit $n \rightarrow \infty$, is
$$ \frac 1e$$
or about 37%.

## Commentary on the solutions
I'm pretty sure I'm getting the hang of this reasoning.
