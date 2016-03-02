# Recitation 23

## Problem 1
### (a)
$$E[X] = \sum P(E_i) = 0.7$$

### (b)
We can't make assumptions about independence, so let's use Markoff.
$$P(X \geq 1) \leq E[x]/1 = 0.7$$

### ( c )
This is essentially the same as part (b), but now
$$P(X \geq 3) \leq 0.7/3 = 0.23\bar{3}$$

### (d)
With independence, we can calculate
$$Var[X] = E[X^2] - E[X]^2 = 0.7 - 0.49 = 0.21$$

*Note: I calculated this variance wrong entirely. I should have added the variances of the individual components (they are independent, after all) in which case I would have gotten $Var[X] = 0.55$.*

Then using Chebyshev,
$$P(X \geq 2) \leq P(|X - E[X] \geq 1.3) \leq \frac{Var[R]}{1.3^2}=\frac{0.21}{1.3^2} = 0.124$$

*And, had I calculated the variance correctly, I would have gotten $0.326$.*

### (e)
$$P(one-event) \geq 1-e^{-E[X]} = 1 - e^{-0.7} = 0.503$$

*I initially had a typo in my calculator that gave me .067. A stray zero behind the decimal point.*

### (f)
$$P(X \geq cE[X]) \leq e^{-(c\ln{c} - c + 1) E[X]}$$

Here, c = 48/36 = 4/3, so that the exponent is $-0.05024E[X]$.
$$P(X \geq cE[X]) \leq 0.1639$$

### (g)
In this case, $c = 108/36 = 3$. The probability of remembering 108 items is $\leq 5.5\times 10^{-21}$.

*My number is about half of the solution's number, but at these scales a different opinion on rounding can create that kind of difference.*

## Problem 2
### 1
Assuming the defaults are independent events, we can use the nice Chernoff bound to get really tight. $E[X] = 0.05 (1000) = 50$.

If we want to know that there were at least 101 defaults (at least one in the second-worst tranche) then $c = 101/50 = 2.02$ and
$$P(X \geq 101) \leq e^{-(c \ln{c} + c - 1)E[X]} = 2 \times 10^{-9}$$
Great odds.

*Note: I don't know what calculator they were using to find the solutions, but they are off by orders of magnitude. Still hugely small number, so the point is taken, but I've checked their numbers to be wrong.*

The probability of a failure in the best tranche is
$$P(X \geq 901) \leq e^{-(c \ln{c} + c - 1)E[X]} = 0$$
Even better odds!

### 2
Since the bonds are not independent, the best we can do is Markov bound. The probability that there is at least one failure in the second-worst tranche implies that there are 101 or more defaults. For this we use Markov:
$$P(X \geq 101) \leq E[X] / 101 = 0.05 (1000)/101 = 0.495$$

Not good odds.

The probability that the entire bond defaults is
$$P(X \geq 999) \leq 0.05(1000)/999 = 0.05$$
Much better odds. But, given that the events are not independent, if one loan defaults the others will too; and the probability of a loan defaulting is 5%. The probability of all defaulting can't therefore be much lower than 5%. It's a tight bound.

*Note: the solutions use numbers like 100 and 1000 instead of 101 and 999. Their evaluated numbers are correspondingly off. It seems wrong to me to say that a default occurred in the second-worst tranche if only 100 defaulted, so it seems better to me to say that the number should be 101.*

### 3
Assuming mutual independence, there will be 50 failures in 1000 loans (5%). All failures are assigned to the lowest tranche. The failure rate in the mezzanine tranche is therefore 50%.

### 4
The failure rate after combining mezzanine tranches into CDOs is the same...50%. Each mezzanine tranche brings with it 50 expected failures out of 100 total loans. (Therefore there should be 5000 failures expected.)

### 5
To get a failure in the best tranche, we need Chernoff with $c = 9001/5000$:
$$P(X \geq 901) \leq e^{-0.2592(5000)} = 0$$
Wow, great odds!

To get a failure in the third tranche, $c = 7001/5000$ and $P(X \geq 701) \leq 5 \times 10^{-155}$.

I'd buy one!

*I originally calculated my numbers with 1,000 loans instead of 10,000. The numbers were also small to the point of vanishing in that case. The solutions pointed out to me that I had the number wrong, though.*

### 6
Without mutual independence, the best we can do is Markov. For the best tranche:
$$P(X \geq 901) \leq 500/901 = 55.5\%$$
Ouch. For the third tranche:
$$P(X \geq 701) \leq 500/701 = 71.3\%$$

That, I wouldn't buy.

## Notes on the solutions
I did all of this pretty much right, but it's my fault for doing it tired on an airplane that I had more typos than I would care to admit. I get the moral of the story, anyway.
