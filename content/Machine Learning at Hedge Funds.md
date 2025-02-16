---
aliases: 
tags:
  - ds/ml
  - finance
  - ds/ml/ML4T
edited: 2025-02-15T16:31
created: 2024-03-19T22:06
---
# Definition:
[[Machine Learning]] uses historical data to build the model, instead of theory or assumptions (e.g., [[Black-Scholes]]).

The simplest method is [[Supervised Machine Learning]] [[Regression]], though Balch shows KNN.
- Target: Stock Prices (or returns)
- Features: Engineered on OHLCV data, e.g., Bolliger Bands, Moving Average, or other features like P/E ratio ... etc.

(Historical Lucinda Research) Process:
1. Select predictive factors
2. Select target prediction
3. Select time period and stock universe (symbols)
4. Train the model on the historical data

Example:
- Forecast Date: 2015-07-17
- Factors: (from a [[Genetic Algorithm]]!?!?)
	- Average Run Up (252 days)
	- Beta (63 days)
	- EMA% (100 days)
	- Financial Stress Index (Q/Q change)
	- SMA % 100
	- SMA Momentum 100
	- S&P500 SMA Change % (100)
	- S&P500 Volatility (63)
	- Sharpe Ratio (63)
	- Volatility (63)
- Target: % change in stock price.
- Confidence: What is the [[Standard Deviation]] of returns % of the 30 [[K-Nearest Neighbours]]
	- This is not a strong measure.
- [[Backtesting]] Score: Lookback 1 month using 3 months of historical data, to see how often the predictions were correct.

---
# Notes:
**Issues with Regression Forecasts:**
1. Forecasts are noisy and uncertain. Value must be accumulated over trades.
2. Challenging to estimate confidence on predictions.
3. Determining things like holding time, allocation, etc.
4. (he doesn't say overfitting, or bias, etc.)

Balch says an alternative is [[Reinforcement Learning]] instead!!!
- Have the system learn some policy about when to buy/sell

**The Dummy Test Problem**
- Training Date Range: 2009-2010
- Testing Range: 2010-2012

---
# Examples:
Examples

----
# Source:
Source