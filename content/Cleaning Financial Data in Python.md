---
aliases: 
tags:
  - cs/python/pandas
  - ds/data_processing
  - ds
  - ds/ml/ML4T
edited: 2025-02-15T16:34
created: 2024-03-19T22:06
---
# Notes:

Financial data is NOT pristine.
- Amalgamation of many different sources (e.g., NASDAQ vs NYSE). This means different prices
- Not all stocks trade every day.

**Why do stocks have NaN OHLC Data?**
1. Acquisition: JAVA (Sun Microsystems) was acquired by Oracle
2. Ticker Reuse: JAVA used to be Mr. Coffee before Sun.
3. Did not exist before this time (pre-IPO)
4. Thinly traded stocks (e.g., microcap companies)

**How do we handle missing data?**
1. Interpolation is WRONG because there is no trading during that period of time. 
	1. Interpolation "leaks" the future price before we actually know about it. 
2. Need to handle missing for good [[Basic Time Series Statistics]].
3. **Solution**: 
	1. Fill forwards with the last known price. (avoid leakage)
	2. Then, fill backwards to get to the starting time. (when the stock didn't exist yet)

```python
# Basic:
df.fillna()
# Fill forward:
df = df.ffill(axis=0)
# Fill backward
df = df.bfill(axis=0)
```


---
# Examples:
Examples

----
# Source:
Source