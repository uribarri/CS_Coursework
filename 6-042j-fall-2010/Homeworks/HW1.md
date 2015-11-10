# Homework 1

## Problem 1
Translating sentences from English to predicate logic.

### a
$$\exists x \in X, S(X) \wedge A(x).$$

### b
$$\forall x \in X, (T(x) \wedge S(x)) \Rightarrow A(x).$$

### c
$$\forall x \in X. \neg A(x) \Rightarrow \neg T(x)$$

### d
$$\exists x,y,z \in X. (\neg E(x,y) \wedge \neg E(y,z) \wedge \neg E(x,z) \wedge T(x) \wedge T(y) \wedge T(z) \wedge \neg S(x) \wedge \neg S(y) \wedge \neg S(z))$$

## Problem 2
Use a truth table to prove or disprove certain statements involving $P$, $Q$, and $R$.

### a

$$\neg (P \vee (Q \wedge R)) = (\neg P) \wedge (\neg Q \vee \neg R)$$
Comparison of columns (5) and (7) below says that this equality is **true**. (Also apparent by distributive property of negation $\neg$.)

| $P$ | $Q$ | $R$ | $Q \wedge R$ | $\neg (P \vee (Q \wedge R))$ | $\neg Q \vee \neg R)$ | $(\neg P) \wedge (\neg Q \vee \neg R)$ |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| T | T | T | T | F | F | F |
| T | T | F | F | F | T | F |
| T | F | T | F | F | T | F |
| T | F | F | F | F | T | F |
| F | T | T | T | F | F | F |
| F | T | F | F | T | T | T |
| F | F | T | F | T | T | T |
| F | F | F | F | T | T | T |

### b

$$\neg (P \wedge (Q \vee R)) = (\neg P) \vee (\neg Q \vee \neg R)$$

Comparison of columns (5) and (7) below says that this equality is **not true**. (Also apparent by distributive property of negation $\neg$.)

| $P$ | $Q$ | $R$ | $Q \vee R$ | $\neg (P \wedge (Q \vee R))$ | $\neg Q \vee \neg R)$ | $(\neg P) \vee (\neg Q \vee \neg R)$ |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| T | T | T | T | F | F | F |
| T | T | F | T | F | T | T |
| T | F | T | T | F | T | T |
| T | F | F | F | T | T | T |
| F | T | T | T | T | F | T |
| F | T | F | T | T | T | T |
| F | F | T | T | T | T | T |
| F | F | F | F | T | T | T |

## Problem 3

### (a) Rewrite certain expressions using only $\neg$ and `nand` ($\uparrow$)

#### (i)
$$A \land B = \neg(A \uparrow B)$$
This follows from the truth table.

#### (ii)
$$A \lor B = \neg P \uparrow \neg Q$$
This one is a bit more difficult to immediately visualize. I played with some truth tables for awhile to happen upon the answer.

### (b) Find an equivalent for $\neg A$ using only $\uparrow$
$$ \neg A = (A \uparrow A) $$

### (c) Express `true` and `false` as just `nand` statements
The key is to note that $A \uparrow A = \neg A$, and $A \uparrow \neg A$ is a constant Boolean `true`. And of course $\text{False} = \neg \text{True}$.

#### `true`
$$ \text{True} = A \uparrow A \uparrow A $$

#### `false`
$$ \text{False} = (A \uparrow A \uparrow A) \uparrow (A \uparrow A \uparrow A)$$

## Problem 4
Detect one fake coin among 12 coins, where the fake coin weighs less and you have a balance scale. Derive a detection method that uses no more than 3 weighings.

  1. Weigh six coins on either side of the balance. Discard the coins from the heavier side.
  2. Weigh three coins on either side of the balance. Discard the coins from the heavier side.
  3. Weigh one coin on either side of the balance. Reserve one coin off the balance.
  * If the balance tips, discard the heavier coin and the reserved coin. The remaining is the fake.
  * If the balance does not tip, discard both coins from the balance. The reserved coin is the fake.

The procedure is simple enough, but I did not detect a way to do it rigorously with truth tables before I had already worked it out in my head. I suppose you could have 12 propositions, each of the form "$x_i$ is fake"...but this wouldn't be too helpful.

The procedure above is three steps, exactly. Alternatively, one can start by just weighing three coins on either side. Discard all if balanced, be left with three to choose from if unbalanced. That would get it done in two steps possibly, three steps guaranteed.

## Problem 5
Prove
$$\text{if } r \text{ is irrational, then } r^{1/5} \text{ is irrational.}$$
by using the contrapositive,
$$\text{if } r^{1/5} \text{ is not irrational, then } r \text{ is not irrational.}$$

**Axiom 1**: "Not irrational" means "rational".

**Axiom 2**: The product of rational numbers is rational.

If $r^{1/5}$ is rational (by Axiom 1), then by Axiom 2
$$r^{1/5} r^{1/5} r^{1/5} r^{1/5} r^{1/5} = r^{(1/5)\cdot5} = r$$
is rational.

$$\Box$$

## Problem 6
Prove
$$\forall w,x,y \in \Bbb{N}, w^2 + x^2 + y^2 = z^2 \in \text{ even } \Leftrightarrow w,x,y \in \text{ even.}$$

Let $(w,x,y) = (2i, 2j, 2k)  \in \text{ even}$. Then $z^2 = 4(i^2 + j^2 + k^2)$, which is even.

Let any one of $w,x,y \in \text{ odd}$. Without loss of generality, let that one be $w = 2i + 1$. Then $z^2 = 4(i^2 + j^2 + k^2) + 4i + 1$, which is odd.

Let any two of $w,x,y \in \text{ odd}$. Without loss of generality, let those two be $w = 2i + 1$ and $x = 2j+1$. Then $z^2 = 4(i^2 + j^2 + k^2) + 4(i + j) + 2$, which is even.

Let all three of $w,x,y \in \text{ odd}$. Now $w = 2i + 1$, $x = 2j+1$, and $y = 2k + 1$. Then $z^2 = 4(i^2 + j^2 + k^2) + 4(i + j + k) + 3$, which is odd.

I have **not proven** the proposition. It appears to fail if two of the three numbers are simultaneously odd.
