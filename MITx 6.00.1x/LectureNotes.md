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

## Lecture 7
**Testing**: running the code on examples to get known outputs
**Debugging**: finding errors in the code

Syntax and static semantic errors are easy: handled by the Python interpreter at load time, for example.

Formal testing methods only work on simple code, generally. Exhaustive testing is reserved for critical code. A test suite is a partition of the input space, to create a set of inputs from each subspace.

**Black Box Testing**: using heuristics based on exploring paths through the specifications

**Glass Box Testing**: using heuristics based on exploring paths through the code

A *path complete* glass box test goes through every possible path in the code.

*Unit testing* vs *integration testing*. One catches algorithm bugs, the other interaction bugs. *Regression testing* checks that the code still checks out on all tests after all bugs have been fixed.

*Stubs* simulate parts of a program that haven't yet been written.

Bugs:
  * Overt: an obvious manifestation
  * Covert: code runs and returns, but may be wrong value
  * Persistent: occurs every time code is run
  * Intermittent: only occurs sometimes, even when run on the same input

Defensive programming: trying to make all bugs overt and persistent.

## Lecture 8
Exceptions: TypeError, IndexError, NameError
preferred way of dealing with an exception: `raise Exception("descriptive string")`

`try:
  ...
except TypeofError,e:
  ...`

`else` and `finally` code can be used to clean up (closing files, etc)

`assert` statement: checking that assumptions are met on either inputs or outputs
