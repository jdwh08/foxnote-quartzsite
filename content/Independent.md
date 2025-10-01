---
aliases:
  - Independence
tags:
  - stats/probability
edited: 2025-09-24T17:05
created: 2024-03-02T19:32
---
### Definition:
Independent [[Sample Space and Events|events]] do not "affect each other" in probability.
$$P(A \cap B) = P(A) \times P(B)$$
This means their [[Joint Probability]] is just the product of the [[Marginal Probability|Marginal Probabilities]]:
$$p(x,y)=p_X(x)*p_Y(y)$$
because $p_x(x)=p_{X|Y}(x|y)$ for all $y \in \mathcal{Y}$, and same for $x$.

---
### Notes:
Independent events can't be [[Disjoint Events]] because Disjoint Events prevent each other from having probability.

We can also test for independence IFF the [[Joint Probability]] can be written as the product of a function of x and a function of y, and their supports are independent: 
$$f(x,y) = g(x)*h(y); g(x)\geq0; h(x)\geq0$$

Independence also means that a their [[Expected Value]]s are independent too! $E(XY)=E(X)E(Y)$.

---
### Examples:
$f(x, y)=(x+y)/36$ is not factorable into two functions, so not independent.
$f(x,y)=8xy$ for $x\in[0,1/2], y\in[0,1/4]$ can be split into $8x, y$, so independent.
$f(x,y)=8xy$ for $0\leq x < y \leq  1$ cannot be split into $8x$ and $y$ because notice how $x<y$, thus, the [[Support (math)|support]] of the function depends on $x<y, \text{ i.e., }1_{(0,y)}(x)$. 