---
aliases: 
tags:
  - cs/theory
  - ds/ml/theory
edited: 2025-06-06T02:38
created: 2024-03-19T22:06
---
# Definition:

Determines the amount of data needed to remove possible models which have high error.

$$m \ge \frac{1}{\epsilon} \left(\ln |H| + \ln \frac{1}{\delta} \right)$$
for if $|H|$ hypothesis space is finite

$$m \ge \frac{1}{\epsilon} \left(8 * VC(H)*\log_2(13/\epsilon) + 4 \log_2(2/\delta) \right)$$
for if $|H|$ hypothesis space is infinite, using the [[Vapnik-Chervonenkis Dimension|VC Dimension]].

I.e., we must have at least this many data points so that possible models in hypothesis space $|H|$ have error of at most $\epsilon$ with probability $1-\delta$.


Used to set bounds for [[Probably Approximately Correct Learning|PAC Learning]] when there are candidate models known.

---
# Notes:

**THIS DOES NOT WORK FOR MOST MODELS, SINCE MOST MODELS ARE INFINITE SPACE**

#### Derivation
Suppose we have some model hypotheses that have high error.
- $error_D(h...h_k \in H) > \epsilon = P_{x \sim D}(h \neq c) > \epsilon$

This means the [[Probability]] that the hypothesis matches the true candidate [[Data Generating Process]] is 
- $P_{x \sim D}( h_i(x) = c(x)) \le 1- \epsilon$ "unlikely they match"

What's the probability that one of these bad hypotheses is still consistent with $m$ observations (i.e. still in the [[Version Space]])?
- **If data is [[Independent and Identically Distributed|IID]]**, then $P \leq (1-\epsilon)^m$, since it has to keep matching by chance
- Must be consistent with m0 and m1 and m2 and ...

What's the probability that at least one of the hypotheses $h...h_k$ are still consistent on $m$ examples?
- $P \le \sum^{k} (1-\epsilon)^m$, since we add up probabilities for h1, h2, h3, ... $h_k$
- This is at most the size of the possible hypothesis space $|H| (1-\epsilon)^m$

- Note $-\epsilon \le \ln(1-\epsilon)$ via calculus, and thus $e^{-\epsilon m} \ge (1-\epsilon)^m$
- This means that $k(1-\epsilon)^m \le |H|(1-\epsilon)^m \le |H|e^{-\epsilon m} \le \delta$, which implies...

$$m \ge \frac{1}{\epsilon} \left(\ln |H| + \ln \frac{1}{\delta} \right)$$

---
# Examples:

Suppose $H = C = \{ h(x) = x_i \}$, i.e., we have 10-bit input and the true [[Data Generating Process|DGP]] is to pick one of the bits. We don't choose the samples! How many do we need?
- $|i|=10$, i.e., 10 bits
- $\epsilon=0.1$, $\delta=0.2$, $D \sim Unif$
$$m \ge 1/0.1 * (\ln(10) + \ln(1/0.2))=39.12$$
Even though the input space is $2^{10}$. 
- Also note that the distribution doesn't matter. 
- This is because our definition of error is probability-weighted so rare events create less error.

----
# Source:
Source