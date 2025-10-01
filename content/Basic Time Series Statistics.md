---
aliases: 
tags:
  - ds/ml/ML4T
  - stats/time_series
  - finance
edited: 2025-02-15T16:28
created: 2024-03-19T22:06
---
# Notes:

##### Means, Standard Deviation
```python
# Global Means (across all data)
df.mean()
df.std()

# Rolling means (across a window of past X values at each time)
df.rolling.mean()
df.rolling.std()

# Example plot
ax = df['SPY'].plot(title="SPY rolling mean", label='SPY')
# Compute rolling mean using a 20-day window
rm_SPY = df['SPY'].rolling(window=20).mean()
# Add rolling mean to same plot (see the ax?)
rm_SPY.plot(label='Rolling mean', ax=ax)
```

###### Finance Connections (Technical Analysis):
- Moving average often used as a trading signal (e.g., MACD) or support/resistance line for prices
- Bollinger Bands: Calculate rolling [[Standard Deviation]] and add barriers $\pm 2\sigma$ from the rolling mean. Price action going below/above this suggests buy/sell signal.

```python
# why do they have like 3 functions for this
def get_bolliger_bands(
	values: pd.DataFrame,
	window: int
) -> tuple[pd.DataFrame, pd.DataFrame]:
	"""Calculates the bollinger bands"""

	rolling_mean = values.rolling.mean(window=window)
	rollling_std = values.rolling.std(window=window)

	lower_band = rolling_mean - 2 * rolling_std
	upper_band = rolling_mean + 2 * rolling_std

	return (lower_band, upper_band)
```

##### Daily Returns
$$r =\frac{p_{t} - p_{t-1}}{p_{t-1}} = \frac{p_{t}}{p_{t-1}}-1$$
(NOTE: yes, this is just the change over time)
```python
def compute_daily_returns(
	df: pd.DataFrame,
) -> pd.DataFrame:
	"""Calculate daily returns. Saves output as new column called ret."""
	# with indexing only:
	df_change = df.copy()  # don't overwrite values
	df_change[1:] = (df[1:] / df[:-1].values) - 1  # .values converts to np so that we dont realign axis. that's a hack. don't do this anymore!
	df_change[0, :] = 0

	# With shift
	df_change = df / df.shift(periods=-1) - 1
	df_change.iloc[0, :] = 0  # replace na in first row
	return (df_change)
```

##### Cumulative Returns
$$cumret(0,t)=p_t/p_0 - 1$$
(NOTE: yes, this is just the change over a period)
