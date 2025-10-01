---
aliases: 
tags:
  - finance/technical
edited: 2025-02-25T19:05
created: 2024-03-19T22:06
---
# Definition:
A form of "analysis" which focuses on price and volume patterns or trends.

Contrast with [[Fundamental Analysis (finance)]]

---
# Notes:

#### Key Characteristics of Technical Analysis
1. Use historical prices and volumes only.
2. Compute statistics as indicators
3. Use indicators as trading heuristics.

#### Why Technical Analysis might work
1. Price action conveys information
2. Heuristics work in other areas.

#### When is Technical Analysis effective?
1. Combining multiple individual indicators.
	1. Individual indicators have been traded away.
	2. This is similar to an [[Ensemble (Machine Learning)]].
2. Look for contrasting bets (long/short), e.g., stock vs market.
3. Shorter time periods (trading horizon)
	1. Milliseconds - [[High Frequency Trading]]. Usually almost no effect from fundamental factors. Decisions are *simple* and *speed matters*.
	2. Days. Some impact from fundamental factors.
	3. Years. No. This is [[Fundamental Analysis (finance)]]. Decisions are *complex* and *speed doesn't matter.*

> "In the short run, the market is a voting machine. In the long run, it is a weighing machine."

---
# Examples:
- [[Simple Moving Average (technical analysis)]] of Price
- % change in volume
- [[Momentum (technical analysis)]]: Quick changes in price over time. People often go long momentum.
- [[Bollinger Bands]]


#### Normalization for [[Machine Learning]]
If using [[Technical Analysis]], we probably want to normalize the data so that all the ranges are the same. We subtract from the [[Sample Mean]] and divide by the [[Sample Standard Deviation]].


..norm = \frac{v - \bar{v}}{std(v)}$



----
# Source:
Source