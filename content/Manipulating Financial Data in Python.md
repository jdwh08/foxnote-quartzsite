---
aliases: 
tags:
  - cs/python/pandas
  - ds/data_processing
  - ds/ml/ML4T
edited: 2025-02-15T16:34
created: 2025-01-06T17:40
---
### Notes:
Why python? 
1. Good scientific libraries
2. Fast if using matrices.

##### What does a CSV file look like for stock data?
We work with **CSV** files.
`HCP.csv`

| Date               | Open       | High       | Low       | Close            | Volume           | Adj Close                                            |
| ------------------ | ---------- | ---------- | --------- | ---------------- | ---------------- | ---------------------------------------------------- |
| date               | open price | high price | low price | actual end price | \# shares traded | close, adjusted for stock splits and dividends       |
| NEWER (2012-09-11) | 46.23      | 46.78      | 46.20     | 46.73            | 1855400          | 46.73                                                |
| ...                |            |            |           |                  |                  |                                                      |
| OLDER (2000-02-01) | 24.87      | 25.15      | 24.44     | 25.00            | 413300           | 5.36 (NOTE the large historical difference to close) |

Note that we only care about info that *changes over time* and are *relevant for stock price info*.


##### Pandas DataFrame
Data frame library created by Wes McKinney at AQR.

Close dataframe (though we might have others like volume)

| Index | Date       | SPY   | AAPL  | GOOG                                          | GLD                                           |
| ----- | ---------- | ----- | ----- | --------------------------------------------- | --------------------------------------------- |
| 0     | 2000-01-09 | 100.3 | 50.89 | NaN (not a number, didn't exist at this date) | NaN (not a number, didn't exist at this date) |
| 1     |            |       |       |                                               |                                               |
| 2     |            |       |       |                                               |                                               |
| ...   |            |       |       |                                               |                                               |

### Pandas examples
```python
import pandas as pd

def test_run():
	df = pd.read_csv("data/AAPL.csv")
	print(df)  # print entire df
	print(df.head())  # print top 5 lines

	# Index-based slicing
	print(df[10:21])  # rows 10-21

if __name__ == "__main__":
	test_run()
```

```python
def get_max_close(symbol: str) -> float:
	"""Return max closing value for stock from symbol."""

	df = pd.read_csv(f"data/{symbol}")
	return df["Close"].max()  # get max of close
```

```python
def get_mean_volume(symbol: str) -> float:
	"""Return the mean volume for the stock"""
	df = pd.read_csv(f"data/{symbol}")
	return df["Volume"].mean()  # get mean of vol
```


##### Basic Plotting
```python
import pandas as pd
import matplotlib.pyplot as plt

def test_run():
	df = pd.read_csv("data/AAPL.csv")
	print(df["Adj Close"])

	# Plotting
	df["Adj Close"].plot()
	plt.show()  # call to show plots
```
```python
def plot_high_prices():
	df = pd.read_csv("data/IBM.csv")
	df["High"].plot()
	plt.xlabel("Date")
	plt.ylabel("IBM High Price")
	plt.show()
```
NOTES:
1. Date range indexing?
2. Multiple Stocks?
3. Align prices to dates?
4. Get proper date orders!
5. No header, axis, etc.

```python
# A Dual plot
df[["Close", "Adj Close"]].plot()
```


**Important Note:** The NYSE usually has **252** trading days per year (exclude weekends, holidays, etc.)


### Building a DataFrame
Suppose we have two dataframes (df1 \[features\], df2 \[SPY\]).
- df1 has some weekends
- they have different time ranges.
To fix this, we can use **JOINS** in Pandas.

```python
# get date range
start_date = "2010-01-22"
end_date = "2010-01-26"
dates = pd.date_range(start_date, end_date) # <class DatetimeIndex>
dates[0]  # 2010-01-22 00:00:00 (both date and time)

df1 = pd.DataFrame(index=dates)  # set index as dates.

df_spy = pd.read_csv(
	"data/SPY.csv",
	index_col="Date",  # otherwise, index is 0,1,2... not dates
	parse_dates=True,
	usecols=["Date", "Adj Close"],
	na_values=["nan"]
)
df1 = df1.join(df_spy)  # left join
df1 = df1.dropna()  # drop nan values of any type (could use how="inner")

# loop version
symbols = ["IBM", "AAPL"]
for symbol in symbols:
	df_tmp = pd.read_csv(f"data/{symbol}.csv", index_col="Date", parse_dates=True, ...)
	# Rename Adj Close to prevent clashes with prior Adj Close cols
	df_tmp = df_tmp.rename(columns={"Adj Close": symbol})
	df1 = df1.join(df_tmp)
```
```python
# Slicing
df2 = df1[start:end, ["GOOG", "GLD"]]  # [rows, cols]
# Row slicing (using ix???? nah... use .loc and .iloc)
```

#### Better Plotting
```python
# Plot SPY and IBM over a date range:
def plot_selected(df, columns, start_index, end_index):
	"""Plot the desired columns over the index values in the given range"""
	# 1. Get columns
	df_plot = df.loc[start_index:end_index, columns]
	# 2. Plot
	ax = df.plot(title="Stock Prices")
	ax.set_xlabel("Date")
	ax.set_ylabel("Price")
	plt.show()
```
```python
# Let's normalize the start prices to 1
# divide by the first row
df = df / df.iloc[0, :]  # vectorized is much faster.

ax = df.plot(title=title, fontsize=2)
ax.set_xlabel("Date")
ax.set_ylabel("Price")
plt.show()
```

---
### Examples:
Examples