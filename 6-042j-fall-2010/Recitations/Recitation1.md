# Recitation 1 notes

## The problem
We're asked to translate a series of statements about cabal members into English from their predicate logic forms.

The cabal consists of members from the set {Oscar, Stav, Darren, Patrice, David, Nick, Martyna, Marten, Tom}.

  1. There exist three people ($x$, $y$, and $z$) none of which are the same person (i.e., three distinct people) and they are in the cabal.
  2. Both Stav and David are not in the cabal together.
  3. If Martyna or Patrice are in the cabal, then anyone is.
  4. If Stav is in the cabal, then David is in the cabal.
  5. If Darren is in the cabal, then Martyna is in the cabal.
  6. If Oscar or Nick is in the cabal, then Tom is not.
  7. If Oscar or David is in the cabal, then Marten is not.

My interpretation:
  * From (1), there are at least three people in the cabal.
  * From (3), neither Martinya or Patrice are in the cabal (otherwise everyone would be).
  * From (2) and (4), Stav can't be in the cabal, but David could be.
  * Darren can't be in the cabal, because Martyna is not (5)
  * From (6) and (7), neither Tom nor Marten can be in the cabal

Leaving: {**Oscar**, ~~Stav~~, ~~Darren~~, ~~Patrice~~, **David**, **Nick**, ~~Martyna~~, ~~Marten~~, ~~Tom~~}

In solving the last bit (from (6) and (7)) I did a quick logical leap. I could do that because it was a small problem. The solutions show that the correct way to do that is to form lemmas that can be easily evaluated (in their case, using the contrapositives of (6) and (7)). Remember to do that in the future.

## Notes from the recitation
  * A universally-true statement is called a *validity*.
  * A *tautology* is a statement that is true by virtue of its logical form.
