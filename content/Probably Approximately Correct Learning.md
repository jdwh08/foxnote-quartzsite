---
aliases:
  - PAC Learning
tags:
  - ds/ml/theory
  - cs/theory
edited: 2025-06-08T11:08
created: 2024-03-19T22:06
---
# Definition:

Can we guarantee that our [[Machine Learning]] algorithm differs in [[Probability]] from the true [[Data Generating Process]]...
- Approximately? I.e., probability by some amount $\epsilon$ 
- Probably? I.e., most of the time $1-\delta$

---
# Notes:

#### Formal Definition
If $C$ is our concept class space (possible true DGPs)
If $L$ is our learner
If $H$ is our hypothesis space (possible models), of size $|H|=n$
If $D$ is the distribution of the input data
If $\epsilon \in [0, 0.5]$ is the error goal
If $\delta \in [0, 0.5]$ is the uncertainty goal
$error_D(h)=P_{x \sim D}\left[ c(x) \neq h(x) \right]$ is probability-weighted mistakes between true concept $c$ and our hypothesis $h$; $c(x) \neq h(x)$ based on how likely we are to see that data $P_{x \sim D}$

$C$ is PAC-Learnable by the learner using the hypothesis space IFF
- Learner has probability $1-\delta$ to output hypothesis $h \in H$
- Hypothesis $h$ has $error_D(h) \le \epsilon$
- [[Big O]] for time and samples is polynomial for $1/\epsilon,\ 1/\delta,\ |H|$
	- As error tolerance $\epsilon$ or the uncertainty $\delta$ shrink, our O gets really big! Generous.  

We can prove this with [[Haussler's Theorem]]:
- If true candidate model / DGP is in hypothesis, we know the targets for $\epsilon$, $\delta$, and the size of our hypothesis space $|H|$, then the problem is PAC learnable.
- (It turns out, this is still true even if true candidate model is not in hypothesis space, and we need to pick the best hypothesis. It's worse, but still true.)
- If the true candidate model / DGP is in hypothesis, and we know that its [[Vapnik-Chervonenkis Dimension|VC Dimension]] is finite, then it is also PAC learnable.

**A problem is PAC Learnable if and only if its [[Vapnik-Chervonenkis Dimension|VC Dimension]] is finite.**

---
# Examples:

Suppose $H = C = \{ h(x) = x_i \}$, and we have k-bit input and we pick one of the bits. 
We don't choose the samples! Is it PAC Learnable?

YES!
- Note that we have only $k$ possible options in hypothesis space, one for each bit.
- By [[Haussler's Theorem]], this is PAC learnable. 
	- We can keep track of all the hypotheses that still match the data ([[Version Space]]) and then sample from there.

Suppose $X = \{1, 2, 3, 4, 5, 6, 7, 8, 9, 10\}$ and $H = h(x) = x \ge \theta$, i.e., true DGP is linear.
- Technically, there are infinite possible hypotheses, since $\theta=3.4159265... \in \mathbb{R}$
- In practice, there isn't much difference between $3.14$ and $3.14159$ here.
- Let's look at the **Power of the Hypothesis Space**, i.e., the largest set of inputs that we can get all labels for.
	- If $S={6}$, we can label that as both true $\theta=5$ and false $\theta=9$.
	- If $S=\{ 6, 4\}$ it's impossible for us to give {True, False} as an answer!
	- Thus, the "power" is **1**.

----
# Source:
GaTech ML
Mitchell 1997