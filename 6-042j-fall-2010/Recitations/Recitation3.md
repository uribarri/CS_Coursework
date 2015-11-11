# Recitation 3

## Problem 1
Show that to break a chocolate bar of $m \times n$ squares into its individual pieces, the order of the splittings does not influence the total number required.

Show this by defining an invariant and using induction.

**Theorem**. Breaking an $m\times n$ bar of chocolate into $mn$ individual squares requires an unchanging number of breaks, no matter the sequence in which the breaks occur.

**Axiom 1**. One "break" separates a single block of chocolate into two (not necessarily equal-sized) blocks.

By **Axiom 1**, the addition of 1 break to the sequence will add 1 block of chocolate to the total ($-1$ large block, $+2$ smaller blocks).

**Definition 1**. The `Break State` of the chocolate at step $t$ $BS(t)$ is equal to the number of blocks $C(t)$ minus the number of breaks $B(t)$ that have been made up to that point.

**Lemma 1**. The `Break State` $BS(t) = C(t) - B(t) = C(0)$ is invariant over $t$.

**Proof**. By induction. Let $P(t)$ be the proposition that $BS(t)=C(0), \forall t$.

Base case. $P(0) \Rightarrow BS(0) = C(0)$. At $t=0$, the number of breaks $B(0)=0$, so the base case is true by definition.

Inductive step. Assume $P(t)\Rightarrow BS(t)=C(0)$ is true. At $t+1$, one break is made ($B(t+1) = B(t) + 1$) and therefore one additional block of chocolate is created (**Axiom 1**) ($C(t+1)=C(t)+1$). The `Break State` $BS(t+1) = C(t+1)-B(t+1) = C(t)-B(t) = BS(t) = C(0)$. The `Break State` is therefore invariant under $t$. $\Box$

Now repeat the Theorem.

**Theorem**. Breaking an $m\times n$ bar of chocolate into $mn$ individual squares requires an unchanging number of breaks, no matter the sequence in which the breaks occur.

**Proof**. By **Lemma 1**, the `Break State` $C(0) = 1$ is invariant under any potential break. Therefore breaking the $m\times n$ bar into $mn$ pieces will require $mn - 1$ breaks, regardless of the sequence of breaks. $\Box$

### Notes from the solution
The "official" solution is done by strong induction, not by identifying an invariant of the state machine. I got to this problem after reading about state machines, but before reading about strong induction or watching that lecture. So I did it with the invariant.

## Problem 2
The Monk States in the Temple of Forever are $(i,j)$, where $i$ is the number of red beads, and $j$ is the number of green beads. A monk's starting state is $(15,12)$ and at each toll of the gong one of two transitions can take place:
  * Exchange $E$: $(i,j) \rightarrow (i-3,j+2)$
  * Swap $S$: $(i,j) \rightarrow (j,i)$

The monks start with 27 beads and can never get any more (each move only either preserves the number of beads or subtracts 1). They must therefore find a path to the exit state $(5,5)$ without overshooting.

An example path:
  * $(15,12)$
  * $E$: $(12,14)$
  * $E$: $(9,16)$
  * $S$: $(16,9)$
  * $E$: $(13,11)$


### Theorem 1
**Lemma 1**. The difference $D(t) = i(t)-j(t)$ can only ever change by 5 under Exchange; this is invariant.

**Proof**. Under Exchange, $D(t+1) = (i(t)-3) - (j(t) + 2) = D(t)-5$.

Under Swap, the sign of the difference can change (a reflection about $0$ on the number line.)

**Lemma 2** The distance from $D(t)$ to $0$ is always $\pm D_0 + 5k$, where $k$ is some integer small enough to keep the number of beads positive (calculable, but unnecessary).

**Proof**. By **Lemma 1**, under Exchange $D(t+1) = D(t)-5$. Under Swap, $D(t+1) = -D(t)$. Therefore starting from $D_0$ can only achieve reflections about $0$ and shifts by $5$.

**Theorem 1**. No one ever leaves the Temple of Forever.

**Proof**. By **Lemma 2**, the distance from equality between the red and green beads is always $\{D(t) = \pm D_0 + 5k, k \in \Bbb{Z}\}$. For $D_0 \neq 0$, $D(t) \neq 0, \forall t$. Since the starting state is $D_0 = 3$, and the required ending state is $D(t)=0$, the no one can ever leave. $\Box$

In my solution above, the induction was implicit in the use of $D_0$ (base case) and the definition of the set $\{D(t)\}$.

### Theorem 2
**Lemma 3**. The number of beads in a monk's possession is a strictly decreasing function of time.

**Proof**. Under Swap, the number of beads remains unchanged. Under Exchange, three red beads are exchanged for two green beads, $(i,j) \rightarrow (i-3,j+2)$. The total number of beads $i+j \rightarrow i-3+j+2 = i+j-1$.

**Corollary 1**. The change in number of beads $\Delta N = -1$ is an invariant under Exchange.

**Axiom 2**. Only a finite number of combinations of two integers can be made using a finite set of integers.

**Theorem 2**. There is a finite number of reachable states in the Temple of Forever machine.

**Proof**. By Corollary 1, the number of beads ranges strictly between the starting number $i(0) + j(0)$ and $2$ (at which point Exchange can no longer be invoked). By Axiom 2, only a finite number of combinations of beads can be made.

### Theorem 3
**Axiom 3**. The smallest number $N$ of beads remaining after a maximally-successful execution of the ToF machine is 2 (in the state $(2,0)$ or its Swap.) Not all starting states can achieve this end state (e.g., $(4,0),(5,0)$)

**Lemma 4**. No greater number of states may be achieved in the execution of the ToF machine than $2(i+j-1)$

**Proof**. Since $\Delta N = -1$ under Exchange by Corollary 1, the bead populations visited during execution ranges from $N_0$ to 2, for a total of $N_0 - 1$ populations. Each population can be inverted by Swap, so that the total number of states achievable is $2(N_0 -1)$.

**Theorem 3**. It is not possible to visit 108 unique states in the ToF machine.

**Proof**. By Lemma 4, the maximum number of states achievable (but not guaranteed) in the ToF machine is $2(N_0 -1)$. With $N_0 = 27$, the maximal number of states is $52 < 108$.


**Lemma 5**. The ending number of beads in any execution of the ToF machine is $4-D_m$, where $D_m = \min\{|(D_0 \pm 5)| \mod 5\}$.

**Proof**. By Lemma 2, the smallest $D(t)$ achieveable is the smallest-magnitude number on the set $\{\pm D_0 + 5k\}$. Let this number be $D_m$. $D_m = \min\{|(D_0 \pm 5)| \mod 5\}$.
  * $|(D_0 \mod 5)| = 0 \Rightarrow D_m = 0$;
  * $|(D_0 \mod 5)| = 1 \Rightarrow D_m = 1$;
  * $|(D_0 \mod 5)| = 2 \Rightarrow D_m = 2$;
  * $|(D_0 \mod 5)| = 3 \Rightarrow D_m = 2$;
  * $|(D_0 \mod 5)| = 4 \Rightarrow D_m = 1$;

Since any $\{(i,j) | i,j \geq 3\}$ is reduceable under a Swap/Exchange pair, at the end of execution $i,j \leq 2$ so that $i + j \leq 4$. Therefore suppose $i_f,j_f \leq 2$.

At the end of execution, $(i,j) = (j_f + D_m, j_f)$. The number of beads is therefore (using Axiom 3 for the lower bound) $2 \leq 2j_f + D_m \leq 4$. This implies, using the table above, that
  * $D_m = 0 \Rightarrow N_f = 4 \Rightarrow (i_m,j_m)=(2,2)$;
  * $D_m = 1 \Rightarrow N_f = 3 \Rightarrow (i_m,j_m)=(2,1)$;
  * $D_m = 2 \Rightarrow N_f = 2 \Rightarrow (i_m,j_m)=(2,0)$;

$\Box$

That was incredibly convoluted, but I wanted to do it in my own before looking at the solutions, where something more elegant would be told. I'm not even sure they do this in the solutions; I sort of assigned it to myself.

In the ToF machine, $D_0 =15-12 = 3 \Rightarrow D_m = 2$. By Lemma 5, therefore, the end state will be $(2,0)$ and the total number of states achievable is what is stated in Lemma 4. The maximal number of states visitable in the ToF machine is 52. It can be achieved by doing one Swap for every Exchange, until the minimal state is reached, but nothing else matters in the execution.

### Notes from the solution
The "official" solution does not generalize as much as I did; its proof of Theorem 1 starts from the presumption that the difference is always $5k + 3$ or $5k + 2$, which is specific to the starting state $(15,12)$. Their solution is a bit more straightforward as a result, but mine reduces to theirs if the generality is removed.

They state the proposition to begin the proof of Theorem 2 as "the number of beads is no greater than 27". That is the same property as my "strictly decreasing" proposition. They calculate the number of ways 27, 26, etc beads can be arranged to derive a finite (408) number of states, rather than using my method of bounding from above and below. They explicitly calculate the number of permutations that my Axiom 2 assumes.

They also calculate the maximum number of states to be 52, and show that this is less than 108 for Theorem 3. But they call it "proof by contradiction". Fair enough; I guess it is, formally.

They are more verbose, but identical, in describing how to get to all 52 states. Their solution was much, much easier, because they did not generalize to any starting state $(r,g)$ like I did.
