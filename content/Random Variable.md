---
aliases: 
tags:
  - stats/probability
  - stats
edited: 2025-02-15T16:14
created: 2024-03-02T20:15
---
### Definition:
Informally: a numerical outcome from random processes (e.g., number of heads).

RV is a real-valued function on the [[Sample Space and Events|Sample Space]] $S$ which maps each element $\omega \in S$ to a real number.
$S \overset{x}{\rightarrow} \mathbb{R}$, and $\omega \rightarrow x=X(\omega)$

**Discrete** if the [[Function Image |Image]] [[Set]] (i.e., the set of values the RV can take is finite / [[Countably Infinite]])
**Continuous** if the image set can take on real values. More formally, X is a continuous random variable IFF there exists a [[Probability Density Function]] for it.

$\mathcal{X}$ is the set of possible values of $X$, $\{x \in \mathbb{R}: \ \exists \ \omega \in S: X(\omega) = x\}$

---
### Notes:
Random variables are random because they depend on the experiment outcome $\omega$ which is also random.
- How do we get a probability measure for the random variable $X$ being some particular realized value x, i.e., $P(X=x)$?
- We have to transfer the probability from the sample space + experiment to the possible values of the RV $P(\omega) \rightarrow Prob(X(\omega)=x) \rightarrow p(x)$
- Sum all the outcomes together which give the same value for $X(\omega)=x$ 

---
### Examples:
Let X be the number of heads in 3 tosses of a coin
$S$ = {HHH, HHT , HTH, HTT , THH, THT , TTH, TTT }.
$X(HHH)=3, X(HHT)=2, ..., X(TTT)=0$ , so $X(S)=\{0,1,2,3\}$
