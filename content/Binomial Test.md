---
aliases: 
tags:
  - stats/hypothesis_tests
edited: 2025-02-15T16:16
created: 2024-03-29T19:12
---
### Definition:
[[Hypothesis Test]] about the probability of success $p = p_0$, 
where $p_0$ is the probability of success in a [[Binomial Distribution and Random Variable|Binomial Distribution]] under the [[Null Hypothesis]].

---
### Test:
Suppose we have a sample of $n$, with $k$ successes. This $k$ meets the criteria for a Binomial Distribution, so the test is valid.

Under the $H_0$, we would expect $np_0$ successes instead.

**One Sided Test**
The binomial formula gives the probabilities $P(X=k) = \binom{n}{k} p^k(1-p)^{n-k}$, thus we can directly calculate our one-sided $p$-value for $p < p_0$ as 


\sum\limits_{i=0}^k P(X=i)=\sum\limits_{i=0}^k\binom{n}{i} p^k(1-p)^{n-k}$


(i.e., sum up all possible numbers of successes as extreme or more extreme than $k$. Flip this to be from $k$ to $n$ for $p>p_0$).

**Two Sided Test**
If $p_0=0.5$, then the distribution is symmetric and we can double the $p$-value from the one sided test.

Otherwise, we must calculate all events $\mathcal{I}$ whose probability of occurring is less than or equal to $P(X=k)$, i.e., $\mathcal{I} = \{i: P(X=i) \leq P(X=k)\}$. Then, we calculate the Binomial probability for each of these events:


\sum\limits_{i \in \mathcal{I}}P(X=i)=\sum\limits_{i \in \mathcal{I}}\binom{n}{i} p^k(1-p)^{n-k}$



---
### Examples:
Suppose we roll a D6 235 times, and it lands on six 51 times. Is the die fair at $\alpha=0.05$?

$H_0$: The die is fair, i.e., $p=1/6$. $H_a$: $p>1/6$.
$P=\sum\limits_{i=51}^{235}\binom{236}{i} \frac{1}{6}^{51}*(1-1/6)^{235-51} = 0.02654$. 
Since $p < \alpha$, we reject $H_0$. The data suggests that the die is biased towards 6.

---
### Similar Tests:
If $n p_0$ and $n(1-p_0)$ are both big enough (>5) for a Binomial Distribution to be approximated by a [[Normal Distribution]], we can use a [[Z-Test]] instead.


Z = \frac{k-np}{\sqrt{np(1-p)}} = \frac{\hat{p} - p_0}{\sqrt{p_0(1-p_0)/n}} \sim N(0,1)$



If there are more possible outcomes than two, a [[Multinomial Test]] can be used instead.