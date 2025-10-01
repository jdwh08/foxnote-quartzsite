---
aliases: 
tags:
  - ds/nlp
  - ds/ml/bayesian
edited: 2025-09-10T22:25
created: 2024-04-04T23:15
---
## Definition:
[[Supervised Machine Learning]] method using [[Bayes' Rule]], and assuming that all features are [[Independent|Independent]].

---
## Notes:
When it comes to #ds/nlp this is a quick and dirty method, but surprisingly effective.

### Algorithm
1. Assume that all features have [[Conditional Independence]], i.e., we can just multiply each attribute together to get the final probability.
2. Get the value of



..\hat{y} = \underset{k\in\{1...K\}}{\arg\max} \ p(C_k)*\prod\limits_{i=1}^np(x_i|C_k)$



### Math Derivation
Suppose we need to get the category that item $i$ is in category $C_k$, given the features $x_1...x_n$, i.e., finding $p(C_k | x_1...x_n)$.
Using [[Bayes' Rule]], we can decompose this as


..p(C_k | \textbf{x}) = \frac{p(C_k)p(\textbf{x}|C_k)}{p(\textbf{x})} =\frac{p(x_1...x_n,C_k)}{p(\textbf{x})} = \frac{p(x_1 | x_2...x_n,C_k)p(x_2|x_3...x_n, C_k)...}{p(\textbf{x})}$


which is a *huge mess*!
We can make the naive assumption that all features are [[Conditional Independence]], which helps us simplify $p(x_i|x_{i+1}...x_n, C_k) = p(x_i | C_k)$. Thus, we can rewrite this to be


..p(C_k|\textbf{x}) = p(C_k) * \prod\limits_{i=1}^n p(x_i|C_k)$


Finally, we can turn this into a classifier by finding the class with the highest probability, i.e.,


..\hat{y} = \underset{k\in\{1...K\}}{\arg\max} \ p(C_k)*\prod\limits_{i=1}^np(x_i|C_k)$



### Small Sample Size
This works if our sample sizes are large enough for us to estimate $p(x|C)$ well. If not, our simple ratio is actually has [[Bias (estimator)]], since it is very likely for us to observe $n_c=0$ and thus underestimate.
- $\frac{n_c+mp}{n+m}$ where $n_c$ is number in category, $n$ is total obs, $p$ is the "prior estimate", and $m$ converts this into the "equivalent sample size"
- Typically our priors $p$ are just [[Uniform Distribution]].

---
## Examples:

### [[Natural Language Processing]]
Suppose we have some #ds/nlp sentiment analysis, where we have a feature of words $X$ and their frequencies by category. We can calculate the conditional probability $P(+ | \text{word})$ as the word frequency divided by total number of words.
- Words which are heavily skewed towards one class over another are our key differentiators.
- Words which **do not show up in one class** are serious problems.

The Naive Bayes Function for inferencing a new tweet:


..\prod\limits_{i=1}^{m} \frac{p(w|+)}{p(w|-)}$

 