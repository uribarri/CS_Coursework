# Recitation 15
## Problem 1
  1. `POKE` can be rearranged in $4\cdot 3\cdot 2 \cdot 1 = 24$ different ways.
  2. `BOOK` can also be rearranged in 24 ways if the `O`s are distinct.
  3. Mapping the arrangements of `BOOK` where the `O`s are distinguishable to the arrangements where they are not has multiple arrangements on the right mapped to single arrangements on the left; but all arrangements on the left are mapped to.
  4. This is a surjective (onto) mapping. It is 2-to-1.
  5. There are 24 arrangements when the `O`s are distinguishable; because the mapping is 2-to-1, there are $24/2 = 12$ ways to arrange in the indistinguishable case.
  6. There are $6!$ arrangements of  `KEEPER` whern the `E`s are distinct.
  7. Forming `REPEEK` with indistinguishable `E`s can be done with $3!$ different arrangements with distinguishable `E`s. Just permute the $E_i$.
  8. This is a 6-to-1 surjective mapping.
  9. Therefore, there are $6!/3! = 120$ different arrangements of `KEEPER`.
  10. There are $10!$ arrangements of `BOOKKEEPER` with distinguishable vowels.
  11. There are $10!/2!$ arrangements when the `O`s are indistinguishable.
  12. There are $10!/2!/2!$ arrangements when `O` and `K` are indistingishable.
  13. There are $10!/2!/2!/3!=151,200$ arrangements when `O`, `K`, and `E` are all indistinguishable.
  14. There are 5 `O`s, 2 `D`s and 2 `L`s, with 10 letters total. That makes for $10!/2!/2!/5! = 15,120$ arrangements.
  15. An $n$-bit sequence has $n!$ arrangements with distinguishable `1` and `0`; when indistinguishable, and $k$ of one and $(n-k)$ of the other, the number of arrangements is ${n \choose k} = n!/k!/(n-k)!$.

## Problem 2

### 1
In this problem, the pigeons are the (500) people, the pigeonholes are the days of the year, and $|Pigeons| > 1 |Holes|$. Therefore $k=1$ and there is at least one day of the year which $2$ people share as a birthday.

### 2
The pigeons are the (115) sums of the students' ID numbers. The holes are the number of possible sums. Since the ID numbers are 9 digits long, the highest possible sum would be $9\cdot 9 = 81$. Since $|IDs| > 1 |Sums|$, there must be at least $(k+1) = 2$ ID numbers that share the same sum.

### 3
Any two integers $x$ and $y$ have a difference that is a multiple of 37 if $y-x \equiv 0 \mod 37$. This implies that $x \equiv y \mod 37$. Let the pigeons be all the integers, $\mod 37$. The pigeonholes are all the possible equivalences, $\mod 37$ ($\{0,1,...,36\}$). So $|Pigeons| > 2|Holes|$, so at least three (but two is sufficient) integers must be equivalent to one another, $\mod 37$. Therefore their difference is a multiple of 37.


## Problem 3
### 1
$k$ elements can be chosen from an $n$ element set in $n^k$ different ways. If we're choosing *distinct* elements, then it's $n!/k!$ different ways. If I don't care which order the chosen elements are arranged in, it's ${n \choose k}$.

### 2
As discussed in lecture, this is equivalent to arranging a 16-bit string with 12 zeros and 4 ones. This is $16!/12!/4! = 1,820$ ways.

### 3
There are $8!$ ways of lining the pre-frosh up in a row. Assign the tasks based on where in the row the pre-frosh stands. Because three tasks require 2 of them, there are 2 indistinguishable cases for each of those tasks. Therefore the total number of ways to assign tasks is $8!/2!/2!/2! = 5,040$.

### 4
The 104 cards can be arranged in $104!$ different ways. But each card has an identical twin, so the number of distinguishable arrangements is $104!/(52*2!)\approx 10^{164}$. [Note: wrong! The answer is $104!/(2!)^{52}$. That is because for every set of two identical cards, the other 51 all have identical swaps as well. It's exactly the same as in the `BOOKKEEPER` example. I just didn't notice.]

## Problem 4
### 1
The last phoneme of the word must be a vowel. So there are 25 options for this letter.

First, take the case with all vowels. There are $25^4$ different words this way.

The third letter can be a consonant. Then there are $25*8*25*25$ different words.

The second letter can be a consonant. Then there are $25*25*8*25$ different words.

The first letter can be a consonant. Then there are $25*25*25*8$. The first and third letters can be consonants. Then there are $25*8*25*8$.

The total number of 4-letter words is the sum of all these:
$$25^4 + 3(8\cdot 25^3) + (8^2 \cdot 25^2)$$

### 2
The total number of words is the sum of all possibilities with all possible consonants:
$$|A| = \sum_0^{n/2}|A_k| $$

### 3
The bijection requested in this part is just a one-to-one correspondence between sequences of `0,10` and sequences of `vowel, consonant-vowel`. The length $p$ of the `0,10` sequences is $n-k$ as follows:

>Recall that every consonant must be followed by a vowel. The fact that a word must end in a vowel avoids the corner case of a consonant at the end of a word. Therefore, each consonant can be considered instead a "consonant-vowel pair", and considered as a single element. When there are $k$ consonants in an $n$-letter word, there are then $n-k$ elements.

### 4
Starting from part 3, when there are $k$ consonants in an $n$-letter word, there are then $n-k$ elements, and (being indistinguishable) the consonants can be arranged in
$$|A_k| = {n-k \choose k}$$
different ways.

### 5
When there are 8 consonants and 25 vowels, each of the $k$ consonant-vowel pairs can be formed in $8\cdot25$ different ways, and each of the $(n-2k)$ lone vowels in $25$ different ways. Therefore
$$|A_k| = {n-k \choose k} (8^{k}\cdot 25^{n-k})$$

### 6
The total number of $n$-phoneme words in Hawaiian is

$$|A| = \sum_0^{n/2}{n-k \choose k}\left(8^k \cdot 25^{n-k}\right)$$

## Notes from the solutions
I got one wrong, through carelessness. Everything else hit the nail on the head.

But it took days of thinking about it and more than a few 'a-ha' moments. I'm very glad that I didn't give in and look at the solutions, because that wolud have robbed me of both the satisfaction of getting it, and of the insight that working it out on my own gave. I probably would have been a little faster had I read the text chapter *before* trying it, though.
