---
aliases: 
tags:
  - cs/python/pandas
  - ds/data_processing
  - ds/ml/ML4T
edited: 2025-02-25T19:22
created: 2024-03-19T22:06
---
# Notes:

[[Finance Data]] is NOT pristine.
- Amalgamation of many different sources (e.g., NASDAQ vs NYSE). This means different prices
- Not all stocks trade every day.

#### Why do stocks have NaN OHLC Data?
1. Acquisitions: JAVA (Sun Microsystems) was acquired by Oracle
2. Ticker Reuse: JAVA used to be Mr. Coffee before Sun.
3. Did not exist before this time (pre-IPO)
4. Thinly traded stocks (e.g., microcap companies)

#### How do we handle missing data?
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
#### [[Stock Splits]]
Sometimes companies will choose to split or merge stocks, e.g., 2 for 1 means each old share is now worth two new shares.
We must adjust prices for this splitting by halving the prices prior to this point. 

#### [[Dividends]]
When companies pay out a portion of their earnings to investors. 
- Post-dividend, shareholders will have the dividend amount and their pre-existing share(s). $x_{t-1} = x_t+d$
- Dividends should not affect [[Company Valuation]] (i.e., equality).
- Thus, dividends make the price go down by the same amount. $x_t - x_{t-1} = d$

#### Adjusted Prices
Reverse the effect of [[Stock Splits]] and [[Dividends]]
- 2 for 1 split. We take all historical prices before the split date and divide by 2.
- Dividends must be adjusted. E.g., if IBM pays a 0.55% dividend we adjust all prior prices by 0.55% down as well. 
- Adjusted close is relative to whatever date we are adjusting to! Adjusting normalizes data so that actual=adjusted on the date of adjustment creation.

---
# Examples:
Examples

----
# Source:
Source