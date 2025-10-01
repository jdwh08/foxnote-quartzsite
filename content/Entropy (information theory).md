---
aliases:
tags:
  - information_theory
  - stats
  - ds/ml/loss_function
edited: 2025-08-30T16:55
created: 2024-03-20T15:20
---
# Definition:
The average level of "information" / "surprise" / "uncertainty" for a [[Random Variable]]. As entropy goes down, we have more knowledge about the likely outcomes of that variable. 

Suppose we have a [[Random Variable]] X which takes values in $\mathcal{X}$, with some [[Probability Density Function|Probability Distribution]]. Then, entropy is the sum of $p*logp$ over all values of $\mathcal{X}$:

$$H(X) := -\sum_{x}^{\mathcal{X}} p(x) * \log p(x)$$

---
# Notes:
The log can be base 2, e, or 10.

This is applied to two different distributions using [[Cross Entropy]].

Entropy measures how "large" is the message we need to send.

A heavily [[Skew|skewed]] probability distribution has the most likely events dominate the results, so is less "surprising". This means it has low entropy compared to a non-skewed distribution.

When considering two variables, we can also consider:
- [[Joint Entropy]]
- [[Conditional Entropy]]

---
# Examples:

### Sending Coin Flips
Suppose I want to send the result of 10 coin flips: a fair coin, and a biased coin.
- Fair: HTTHTHTHHH...
	- Perfect randomness means we really need to send all results (Y/N for each flip)
- Biased: HHHHHHHHHH...
	- If they know the coin is perfectly biased, we don't need to send anything!

### Skewed Probability Distribution
Suppose I have four classes A, B, C, D.
- If all classes have equal probability $p=0.25$, we have to encode each option using two bits -- 00 for A, 01 for B, ... etc.

Now suppose I have skewed probabilities: A has probability 50%, B, C have probability of 12.5%, D has probability 25%
- Now, we can take advantage of the higher and lower probabilities. 
- **NOTE: We need to ensure that a stream of these messages are still uniquely interpretable, i.e., none of the values are a prefix of the others.**
- A occurs most frequently. We can make one bit represent A only: 0 = A
- D occurs next frequently. We can make the second bit represent D: 10 = D
- B/C occur next frequently, so we can give B 110 leaving C 111.
- While we have three bits, our most frequent option A is shorter, so the end result is smaller in length on average!
	- $0.5 * 1 + 0.25 * 2 + 0.125 * 3 + 0.125 * 3 = 1.75$ bits
- Note that the **message length matches the entropy**: $\sum p \log(p)$, where the log here represents the message size.
- This is using the [[Huffman Encoding]] technique.


---
# Source:
GaTech ML