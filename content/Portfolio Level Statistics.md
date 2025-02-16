---
aliases: 
tags:
  - ds/ml/ML4T
  - finance
edited: 2025-02-15T16:28
created: 2024-03-19T22:06
---
# Notes:


```python
# Get Daily Portfolio Value

# 1. Normalize prices to starting price.
norms = price / price[0]
# 2. Apply allocation weights.
alloc = norms * allocs
# 3. Convert to dollar value.
values = alloc * start_val
# 4. Sum across positions.
port_val = values.sum(axis=1)

# Get statistics
ret = port_val[1:] / port_val[:-1] - 1  # we don't want the starting 0
cum_ret = ret[-1] / ret[0] - 1
avg_ret = ret.mean()
stdev_ret = ret.std()
```

[[Sharpe Ratio]]
```python
sharpe = np.sqrt(measurement_freq) * (avg_ret - riskfree_rate) / stdev_ret

# NOTE: riskfree_rate is measured in same frequency as the returns
# e.g., to convert from annual RFR to daily, we approx with
daily_rfr = np.power(1 + annual_rfr, 1.0/252) - 1  # 252 trading days
```

---
# Examples:
Examples

----
# Source:
Source