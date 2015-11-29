# Recitation 7
A protocol for college admissions.

The conditions for the algorithm are described in the handout. Basically, all students get assigned, all universities are full, and the students get assigned to their optimal universities (universities may or may not get their pessimal students, I guess).

I must come up with the algorithm before answering any of the questions. So, to generalize The Marriage Algorithm:

  1. At the beginning, all students are binned with their first university preference.
  2. Each university picks its top $n_i$ students from those in their bin.
  3. Those not chosen have that university removed from their list of preferences.
  4. Rejected students are re-binned with their second preference.
  5. Steps 2 through 4 are repeated.
  6. The termination condition is that each student is assigned and each university is full (has $n_i$ admitted students).

## Algorithm termination
In the beginning, with $N$ students and $M$ universities, a total of $NM$ preferences are stated. In the worst case, only one preference is crossed off at each iteration of the admissions algorithm. (If no preference is crossed off, then the algorithm has terminated.) There are therefore only $NM+1$ steps that can take place before no preference is left on each student's list, and at that step the algorithm must terminate.

## Number of applicants accepted
If at any step, university $u_i$ has $n_i$ students in its bin, then on admissions day it will accept $n_i$ students. This is straightforward. A university will only reject applicants if the number in its bin exceeds its capacity $n_i$; students will not be removed in subsequent iterations unless this is the case. Therefore the number will never drop below $n_i$. A corollary is that the university will always admit at least as many students as are in its bin at step 1.

## Every student is assigned to one university
Every student starts on their first preference, and is reassigned only if rejected. At any step, he is reassigned to at most one university. The student is only rejected from a university if its bin is over capacity $n_i$; in that case, at no step will the university's bin occupation drop below $n_i$. Therefore a spot will never open at a university that he has already been rejected from. Since the number of spots is equal to the number of students, the student will move down his preference list until he reaches a university with vacancy, and at no point will there be no vacancy somewhere lower on his preference list.

## Each university is filled to capacity $n_i$
Vacancies only exist at some university if some other university is over capacity. Then the over-capacity university will reject all students over its limit, and those students will be reassigned to another university. This process will continue until students have filtered down their preference list to the university with vacancy. All slots will be filled since the number of slots equals the number of students.

## The rank of a university's least-favorite student never decreases
For under-capacity universities, the rank of the least-favored student is equal to the number of students in the bin. For at-capacity universities, the least-favored rank is equal to the number of slots $n_i$. Since the number of students in the bin will never decrease between iterations (stundents have no motivation to go unless the university tells them to) then the rank of the least-favored student can only increase.

## Show that there are no "rogue couples" in the admissions results
Suppose that student $s_i$ prefers university $u_k$ to the one that he is assigned to. Early in the admission algorithm he would have been in that university's bin. The only reason he left was because had higher rank than the university's least-favored applicant. The university therefore has no reason to prefer $s_i$ to any of its admitted applicants. Likewise, if $u_k$ preferred $s_i$ to the students in its admitted class, then the only reason that $s_i$ is elsewhere was because he never moved through $u_k$'s bin. That implies that he must prefer the university where he is at to $u_k$.

## Show that each student is assigned to his optimal university
Each student cycles through the universities in order of his preference. He is rejected by a university only because he is not preferred over the other applicants. Therefore if he was assigned to that university, another preferred student would be assigned to a university that he ranked lower, and there would exist a rogue set. That can't happen a stable assignment, so any university that a student is rejected from in the admissions algorithm is not in his realm of possibility. Therefore the first university from which he is not rejected (and to which he is therefore assigned) is his optimal university.

## Notes from the solutions
At least one of my proofs is done not by contradiction, where the solution was done by contradiction. I can't see how mine are any less strong, though...and perhaps mine are by contradiction, but in an unspoken way. Actually, that probably is the case.
