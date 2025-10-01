---
aliases:
  - VC Dimension
  - Shatter Hypothesis Space
tags:
  - cs/theory
  - ds/ml/theory
edited: 2025-08-28T21:51
created: 2024-03-19T22:06
---
# Definition:

A measure of how large the possible space for ML models is. (Hypothesis Space)

What's the largest dimension of inputs so that our model can still return all possible labels for some input?

---
# Notes:

VC is typically used in cases where the hypothesis space is infinite.

Start with a small set of dimension 1, keep moving upward.
It's typically the same as the number of parameters.

If VC dimension is finite, then it satisfies [[Haussler's Theorem]] extension and thus the ML model is [[Probably Approximately Correct Learning|PAC Learnable]].


m \ge \frac{1}{\epsilon} \left(8 * VC(H)*\log_2(13/\epsilon) + 4 \log_2(2/\delta) \right)$



A rule of thumb is that our number of training examples $m$ should ideally be at least $10 * VC(H)$.

The VC dimension of finite space is $\log_2 |H|$. We start with VC as the dimension; this implies $2^d$ possible labelling options (True/False)^d, and each labelling needs a model concept to fit.
- Thus, $d \le \log_2 |H|$

---
# Examples:

Suppose $X = \{1, 2, 3, 4, 5, 6, 7, 8, 9, 10\}$ and $H = h(x) = x \ge \theta$, i.e., true DGP is linear.
Let's look at the **Power of the Hypothesis Space**, i.e., the largest set of inputs that we can get all labels for (aka "shatter").
- If $S={6}$, we can label that as both true $\theta=5$ and false $\theta=9$.
- If $S=\{ 6, 4\}$ it's impossible for us to give {True, False} as an answer!
- Thus, the "VC" is **1**.

Suppose $X\in \mathbb{R}$, and $H = \{h(x) = x\in [a,b]\}$, i.e., between two real numbers.
- If $S=3$, then we can find true with $a=0, b=5$ and false with $a=6, b=9$
- If $S=\{5, 4\}$, then we can find combinations with 3 to 6, 4.9 to 5.1, 3.9 to 4.1, and 0 to 1.
- If $S=\{3,4,5\}$, we can't find {True, False, True}.
- Thus, the "VC" is 2.

Suppose $X \in \mathbb{R}^2$, and $H = \{h(x) = \beta^T X \ge \theta \}$. Note that this is a "linear separator", basically a 2-D [[Support Vector Machines|SVM]] with linear kernel, or a [[Artificial Neural Network]] with set input.
- Imagine a 2D plane with increasing numbers of points on it, and your goal is to draw a line to split the points into labels.
- If $|S|=3$ then YES since imagine a triangle and drawing lines
- If $|S|={4}$ then NO suddenly, because imagine a square with points in top left, bottom right. Draw lines between all the points. They cross. I.e., we can't classify XOR.
- NOTE: For $d$-dimensional hyperplane, we have VC dimension of $d+1$ (the +1 is for the $\theta$).

Suppose $X \in \mathbb{R}^2$, and $H =$ Points are in some convex polygon.
- Imagine a 2D plane with all the points drawn around a circle.
- You can create any convex polygon by connecting all the points of interest together
- You can exclude any set of points by skipping over them which still makes convex poly
- We reach the true circle as the number of points connected $\rightarrow \infty$, and this is still valid
- Thus, the VC-Dimension is $\infty$

Suppose we have a [[K-Nearest Neighbours|KNN]] learner, where $k=1$.
- Note this is [[Parametric vs Nonparametric|Nonparametric]]. 

----
# Source:
Source