---
aliases: 
tags:
  - finance
  - ds/ml/ML4T
edited: 2025-02-15T16:28
created: 2024-03-19T22:06
---
# Definition:

A classic measure of risk-adjusted returns.
$$\text{Sharpe}=\frac{R_p - R_f}{\sigma_p}$$

Formally, the Ex-Ante definition (using expected)
$$S = \frac{E[R_p - R_f]}{std(R_p - R_f)}$$

---
# Notes:

The Sharpe Ratio captures three things:
1. Lower risk is better
2. Higher return is better
3. We must consider the risk-free rate (T-bills) per day.
	1. Approximation: if the yearly is $R_f$, then the daily is $\approx \sqrt[252]{1+R_f} - 1$ (252 from the # of trading days.)
	2. Note that this also makes $R_f$ constant in the stdev portion, cancelling it out. Not always the best assumption.

**Adjustment for Measurement**
- Sharpe ratios differ widely depending on how frequently you sample.
- It's supposed to be an ANNUAL measure.
- We adjust non-annual measures to get annual
	- $SR_{annual} = \sqrt{k} * SR_k$, where $k$ is the number of samples per year. E.g., 252 for daily, 52 for weekly, etc. 


---
# Examples:


----
# Source:
Source