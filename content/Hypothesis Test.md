---
aliases: 
tags:
  - stats/hypothesis_tests
edited: 2025-02-16T17:14
created: 2024-03-29T19:45
---
### Definition:
Statistical tool used to check whether the data support a particular idea.

1. Define your null hypothesis (what you're hoping to refute) and your alternative hypothesis (what you suspect to be true)
2. Define your significance level $\alpha$, which is the maximum acceptable False Positive Rate, i.e., probability you reject the null when it is actually true. Typically 0.05 or 0.01, but can depend on your considerations.
3. Select a test statistic and confirm it is valid. Derive the underlying statistical distribution for your test statistic. (Usually known, e.g. Z->Normal). 
4. Calculate your test statistic given the null hypothesis is true. Get the spread of the test statistic using [[Standard Error]]. Get the associated [[P-Value]]. 
5. Decide whether to reject the null hypothesis or fail to reject. We reject if the P-value is less than our $\alpha$, i.e,. In the critical region, which suggests the data is statistically significant.

---
### Notes:
$\alpha$ is the probability of a false positive/rejection of $H_0$, aka a **Type I Error**
$\beta$ is the probability of a false negative/fail to reject $H_0$, aka a **Type II Error**
**Power** is the probability of true positive rejection, aka $1-\beta$ . 


\begin{bmatrix}
\text{ } & H_0 \text{ true} & H_a \text{ true} \\
\text{Reject }H_0 & \alpha & 1-\beta \text{ / power} \\
\text{Fail Reject} & 1-\alpha & \beta \\
\end{bmatrix}$



**Link to [[Confidence Interval]]**
Confidence Intervals use the same methodology, but instead of testing if some hypothesis is true, they create an estimate of the lower and upper bounds.

NOTE: If the $p$-value is smaller than the $\alpha$, that is the same thing as saying a confidence interval with confidence level $1-\alpha$ would exclude the $H_0$ value.

**Link to A/B Testing**
Companies will typically want to test features using [[A/B Testing]], which gets its theoretical underpinnings from hypothesis testing.

---
### Examples:
Examples