---
aliases: 
tags:
  - stats/distributions
edited: 2025-09-22T18:43
created: 2024-03-03T17:02
---
### Definition:
 Suppose we have a [[Bernoulli Trial|Bernoulli Trial]] with success probability $p$. Define X as the number of successes in $n$ of these independent Bernoulli Trials. 
$X \sim Bin(n,p)$ and is a Binomial [[Random Variable]].

The [[Probability Mass Function]] is $p(k) = P(X=k) = \binom{n}{k} p^k(1-p)^{n-k}$ 
- where the $\binom{n}{k}$ counts the number of ways of observing $k$ successes and $n-k$ failures, 
- and the second half counts the probability of one of those outcomes.

The [[Expected Value]] $\mu=E[X]=np$, and the [[Standard Deviation]] is $\sigma=SD[X]=\sqrt{np(1-p)}$

---
### Notes:
Since you can think of this as a series of Bernoulli trials, each trial can have its own Bernoulli RV.

**Required Conditions for Binomial**
1. Each trial can have only two outcomes.
2. Probability of success $p$ must be the same for each trial.
	1. NOTE: If the sample size is only a tiny fraction of the overall population (e.g., <10%), sampling a few will have negligible affect on the population, and are approximately binomial.
3. Number of trials $n$ must be fixed.
4. Trials must be independent.

**Moments of Binomial Distribution**
$E(x) = \sum\limits_{x\in\mathcal{X}} x*p(x) = \sum\limits_{x=0}^n \binom{n}{x} p^x (1-p)^{n-x} = np$
$Var(x) = np(1-p)$

---
### Examples:
A box contains 1 red ball and 9 green balls. 5 random draws are made with replacement. What is the probability that the draws are {R, R, G, G, G}?
$P(RRGGG)=0.1^2*0.9^3$

What is the probability of getting exactly 2 Reds in 5 draws, regardless of order?
- Now we need to consider all the possible ways of doing this because they are [[Disjoint Events]].
- There are 10, and each has probability $0.1^2*0.9^3$, so $10*0.1^2*0.9^3$

The probability of getting $k$ Reds in $n$ draws is $\text{(\# of ways)} * 0.1^k * 0.9^{n-k}$
and we can get the # of ways using $\binom{N}{k} = \frac{n!}{k!(n-k)!}$
(if order matters, then $\frac{n!}{(n-k)!}$)

We sample 10 students from 5,000 undergrads at UChicago. Suppose 3/5 of the students support a Graduate Student Strike. Consider X, the number in the sample who reply yes. What is the probability that at least 8 support the strike?
1. This is a trial with two outcomes Y/N
2. $p=3/5=0.6$.
3. $n=10$
4. Trials are strictly speaking NOT independent, since we are sampling without replacement. 
	1. However, the probability is pretty close between ALL yes and ALL no. (between $\frac{3000-9}{4991}$ and $\frac{3000}{4991}$)
	2. This is because the sample size is very small relative to the population.

Thus, $X \sim Bin(n=10, p=0.6)$, 
so $P(X\geq8)=P(X=8)+P(X=9)+P(X=10)$$=\binom{10}{8}0.6^8*0.4^2+\binom{10}{9}0.6^9*0.4^1+\binom{10}{10}0.6^{10}$
$=0.121+0.040+0.006=0.167$
