---
aliases: 
tags:
  - ds/ml/ML4T
  - finance
  - ds/ml
edited: 2025-02-15T16:31
created: 2024-03-19T22:06
---
# Definition:
Testing a ML Finance System on historical data.

1. Train on some rolling window of data, to forecast future prices.
2. Simulate the trades (buy/sell) that the system would recommend.
3. Simulate the returns from executing the strategy.

Real world returns are almost never as good as bakctests.

---
# Notes:
Parameters:
1. Starting cash, time range, holding period, benchmark, transaction costs (5bps, $0.003 commission), Look Forward Range, Backtest Range

---
# Examples:
Examples

----
# Source:
Source