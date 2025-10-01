---
aliases: 
tags:
  - finance/technical
edited: 2025-02-25T19:03
created: 2024-03-19T22:06
---
# Definition:
A [[Technical Analysis]] indicator that dynamically adjusts the above/below lines based on the [[Simple Moving Average (technical analysis)]] and [[Standard Deviation]] of the price.



BB = SMA \pm 2\sigma$


```python
bb[t] = (p[t] - sma[t]) / 2 * std[t]
```

---
# Notes:

#### Use Cases:
Look for cases where the price goes outside the band, and then retreat back into the bands. Values are typically between $-1$ and $1$.

---
# Examples:
Examples

----
# Source:
In the 1980s, John Bollinger noticed that during periods of high [[Volatility]], we should probably expand the range of how broad our moving average lines are to compensate.