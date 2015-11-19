# Recitation 5
This recitation is supposed to be a team exercise of passing messages between teams and playing with encryption. Since I'm doing this on my own, I can only practice with myself. But it should be fun...

## Setting up the RSA keys
  1. Choose $p = 5$, $q = 13$.
  2. $n = pq = 65$.
  3. $(p-1)(q-1) = 48$. Choose $e = 7$. $\gcd(e,(p-1)(q-1))=1$. My public key is $(e,n) = (7,65)$.
  4. Now find $d$ such that $de \equiv 1 \mod 48$.
      - This could be done with The Pulverizer by doing trial-and-error: pick a $d$, see if the $\gcd$ is $1$, continue until one is found.
      - Using Euler's algorithm, $e^{\phi(n)} \equiv 1 \mod n$ when $e$ is relatively prime to $n$. In this case $n = (p-1)(q-1) = 48$ (yes, bad notation).
      - The number of relative primes is $\phi(n) = (p-1)(q-1) = 48$. So $d = e^{\phi(n)-1} \mod \phi(n) = 7$
      - The private key is (7, 65).

## Encrypt a message
Choose the message "All your base are belong to us." Because $0 \leq m \leq n$, the message will have to be encrypted letter by letter. This is not secure. At all. A little code will help to automate the encryption process.

```
def encrypt(message):
  message = message.lower()
  ms = [ord(char) - 96 for char in message]
  cs = []
  for m in ms:
    cs.append(m**e % n)
  return cs
```

```
def decrypt(cs):
  ms=[]
  for c in cs:
    ms.append(c**d % n)
  return ''.join([chr(m+96) for m in ms])
```

```
In [120]: decrypt(encrypt("All your base are belong to us."))
Out[120]: 'allayourabaseaareabelongatoauso'
```

Ok, so I'm lacking capitalization and whitespace and punctuation handling; but I got the math right, and I gather that to be the point of the exercise. (Also, I'm tired and don't feel like doing more sophisticated work just now. Maybe I'll try something more (like encrypting whole phrases) later.)

If the factorization of $n$ into $p$ and $q$ were available, it is trivial to compute $d$, and therefore the private key would be compromised. An algorithm for factoring large products of primes would kill RSA.
