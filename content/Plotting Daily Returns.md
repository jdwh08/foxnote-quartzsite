---
aliases: 
tags:
  - finance
  - ds/ml/ML4T
edited: 2025-02-15T16:28
created: 2024-03-19T22:06
---
# Notes:

Better ways of handling daily return data are **histograms** and **scatterplots**.

What does the daily return distribution look like for the S&P500?
- It's a [[Normal Distribution]] (sort of) but it has fat tails.
- [[Standard Deviation]]
- Positive [[Kurtosis]]

---
# Examples:
Moments of daily S&P 500 returns (up to 2015):
- Mean: 0.00063558
- Stdev: 0.01337049
- Kurtosis: 3.22

Histogram in Pandas:
```python
import pandas as pd
import matplotlib.pyplot as plt

daily_returns: pd.Series

daily_returns.hist(bins=20)  # set bins
plt.show()

# Mean as a vertical line
plt.axvline(mean, color="w", linestyle="dashed", linewidth=2)

# Stdev as vertical band
plt.axvline(stdev, color="r", linestyle="dashed", linewidth=2)
plt.axvline(-stdev, color="r", linestyle="dashed", linewidth=2)

# Kurtosis
daily_returns.kurtosis()
```
Plotting Two Histograms of returns as comparison
```python
df = get_data(  # you implement this
	symbols=["SPY", "XOM"],
	dates=pd.date_range(...)
)
ret = compute_daily_returns(df)  # you implement this

ret["SPY"].hist(bins=20, label="SPY")
ret["XOM"].hist(bins=20, label="XOM")
plt.legend(loc="upper right")
plt.show()
```

Scatterplot shows returns of multiple assets on the same day.
- Most scatters are linear and positively [[Correlation (Pearson)|correlated]].
- We can run a [[Linear Regression|OLS]] on this (ret_XOM ~ ret_SPY).
	- [[Beta Finance]] is this slope (every 1% increase in market results in a x% increase in XOM)
	- [[Alpha Finance]] is the Y-Intercept (returns unrelatedish to broad market return). We want high alpha.

```python
ret # daily returns of SPY, XOM, GLD

ret.plot(kind="scatter", x="SPY", y="GLD")
plt.show()

# Add the OLS line using NumPy's Polynomial fitting
alpha, beta = np.polynomial.polynomial.Polynomial.fit(
	x=ret["SPY"],
	y=ret["GLD"],
	deg=1
)
plt.plot(
	ret["SPY"],
	beta * ret["SPY"] + alpha,  # OLS line
	"-",
	color="r"  # red
)

# Get cross correlation matrix
np.corrcoef(ret["SPY"], ret["GLD"])
# or use scipy: pearsonr
```

----
# Source: