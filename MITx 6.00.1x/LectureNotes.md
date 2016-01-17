# Lecture notes
I only take notes sparingly...so this file may not get too big. It nevertheless represents the entirety of what I've written down during the course of this...course.

## Lecture 1
Turing specified six primitive operations ([link](http://stackoverflow.com/questions/28148562/what-are-the-six-basic-primitives-in-turing-complete)) that define a universal computation machine.

Programs have:
  * Syntax: a proper order to statements (e.g., '+' goes between two objects)
  * Static semantics: proper types of objects for operations (e.g., 3/'a' is meaningless)
  * Semantics: getting done what needs to get done

## Lecture 2
High level vs. low level languages. "Object code" is the converted high level language to its corresponding low level.

Data objects are either
  * scalar: `int`, `float`, `bool`
  * non-scalar: `str`

A straight-line program does no branching. Simplest branching statement: the conditional.


## Lecture 3
It seems rather ironic that fractions, in binary, are being represented by binary numbers separated by a decimal point. Shouldn't it be a "binary point" or something?

Machine precision: if some decimal $x$ can't be represented as a whole number $x 2^p$ for some $p$, then its storage in the computer is necessarily an approximation.

## Lecture 4
The collection of numbers, assignments, i/o, comparisons, and looping is sufficient for a Turing Complete machine.

A function is stored as a procedure object, with a pointer back to the environment in which it was called.

If a Python function doesn't have a local binding for a variable, it will look to the parent frame for a binding to inherit.
