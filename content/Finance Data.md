---
aliases: 
tags:
  - finance
  - ds/data_processing
  - ds/ml/ML4T
edited: 2025-02-25T19:25
created: 2024-03-19T22:06
---
# Notes:

#### Aggregation
Smallest unit of data is the "tick".
- Transactions happen at some time period, at some price.
- Each exchange has its own data.
- Usually consolidated into time periods, where we get the open, high, low, close, and volume.
	- Open: starting price
	- High: highest price
	- Low: lowest price
	- Close: closing price
	- Volume: total trades in the period
	- Most typical is daily data, but can work on smaller data.

#### Abnormal Changes in Stock Prices
1. [[Stock Splits]]: when a company decides to divide a high-priced stock into smaller chunks. #finance/options  are traded on 100 share chunks, and it also allows granularity without fractional shares.
2. Dividends.

To fix these, we use [[Cleaning Financial Data in Python#Adjusted Prices|Adjusted Prices]].

#### Survivorship Bias
1. We might train a strategy on data like the S&P500 stocks as of today, and then test it on those stocks in the past.
	1. This is survivorship bias! We didn't know in the past that these stocks would *exist* and *stay/enter in the S&P*.
	2. We need to pay for survivor bias free data. This is not cheap.

---
# Examples:
Examples

----
# Source:
Source