---
aliases: 
tags:
  - stats/probability/bayesian
edited: 2025-02-15T20:24
created: 2024-03-02T19:54
---
### Definition:
Given $p(x | y)$, a function to determine $p(y|x)$ for [[Conditional Probability]].
$$p(Y|X) = \frac{P(X|Y)P(Y)}{P(X)}$$
$$= \frac{P(X|Y)*P(Y)}{P(Y)*P(X|Y)+P(Y^c)*P(X|Y^c)}$$
(it makes more sense to draw a tree diagram than to actually remember this formula though!)

---
### Notes:
We are essentially taking the [[Probability Rules|Product Rule]] and normalizing the probability by $P(X)$ to ensure it sums up to 1.

In the example of medical testing, even high power tests might result in a low probability of true positive since the $P(positive)$ is so low.

---
### Examples:
Suppose a job applicant is invited for an interview.
- Probability they are nervous $P(N)=0.7$
- Probability successful if nervous $P(S|N)=0.2$
- Probability successful if not nervous $P(S|N^c)=0.9$
Thus, the probability the interview is successful is $P(S\cap N) + P(S \cap N^c) = P(N)P(S|N)+P(N^c)P(S|N^c)$ $=0.7*0.2 + 0.3 * 0.9 = 0.41$

![[Bayes_Tree_Diagram.excalidraw.png.svg]]

Probability that the applicant is nervous given they are successful: $P(N|S) = \frac{P(N\cap S)}{P(N)} = \frac{0.7*0.2}{0.7*0.2+0.3*0.9} = 0.34$ 