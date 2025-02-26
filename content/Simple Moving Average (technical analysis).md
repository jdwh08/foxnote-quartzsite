---
aliases: 
tags:
  - finance/technical
edited: 2025-02-25T18:58
created: 2024-03-19T22:06
---
# Definition:
A [[Technical Analysis]] indicator based around the [[Moving Average]], usually of prices.

$$sma(n,t) = \frac{1}{n} \sum_{i \in (n-t, t)}^n p_i$$
```python
sma = p[t-n:t].mean()
```

This is a "smoothed", "lagged", version of the true prices.


---
# Notes:
#### Use cases:
1. Times where price crosses through. Can be reinforced if [[Momentum (technical analysis)]] is also strong.
2. A proxy for values, e.g., if price goes strongly above or below the SMA, it might be too overbought or oversold.
	1. E.g., calculate the % difference between current and SMA. Values range from $-50\%$ to $50\%$.

---
# Examples:
A more specific, double bounded example is [[Bollinger Bands]].

----
# Source:
Source