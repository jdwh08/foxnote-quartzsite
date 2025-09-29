---
aliases:
  - Bernoulli Distribution
tags:
  - stats/distributions
edited: 2025-09-24T17:05
created: 2024-03-03T17:11
---
# Definition:
Bernoulli Trials are random experiments that have only two possible outcomes.

Bernoulli [[Random Variable]]s are variables which equal 1 with probability $p$, and 0 with probability $1-p$.
$X \sim Ber(p)$

The [[Probability Mass Function]] is $p(x) = p^x(1-p)^{1-x}$ for $x\in\{0,1\}$

---
# Notes:
We can calculate the [[Expected Value]] and [[Variance]]:
- $E[X] = \sum \limits_{x=0,1} x*p(x) = 0*(1-p)+1*p=p$.
- $Var[X]=\sum\limits_{x=0,1} (x-E[x])^2*p(x) = (0-p)^2*(1-p)+(1-p)^2*(p)=p(1-p)$
- $SD[X] = \sqrt{p(1-p)}$

---
# Examples:
Examples

---
# Source:
