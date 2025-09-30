---
aliases:
  - VIX
tags:
  - finance/volatility
edited: 2025-02-15T15:55
created: 2024-01-06T18:58
---
### Definition:
Measure of expected annualized 30-day volatility in the S&P500.
- Calculated using full set of S&P500 options implied volatilities, weighted to get to 30-days of duration.
	- Two expirations between 23 and 37 days
	- Only Friday expirations
	- Out-The-Money calls and puts starting At-The-Money until 2 consecutive zero-bids are ignored. Skip over zero-bids.
- VIX of 30 means that using options expiring in 30-days, markets expect the S&P to move $\pm30\%$ over the next year.
- You can calculate different timeframes: 
	- 1 month gives $30/\sqrt{12} =\pm 8.67\%$ w/in 1-SD using normal distribution instead of lognormal.
	- 1 week gives $30 / \sqrt{52} = \pm4.16\%$ w/in 1-SD using normal distribution instead of lognormal.
	- 1 day gives $30/\sqrt{252} = \pm1.89\%$ w/in 1-SD using normal distribution instead of lognormal.

---
### Notes:
- Vol is mean reverting because high VIX leads to situations where further volatility is unsustainable.

###### Dean Curnott's "Ten Handy Facts About Volatility"
1. Volatility is driven by realized volatility (80-85%). This effect is stronger on shorter dated contracts.
2. Implied Volatility exceeds Realized Volatility. This is what makes carry strategies for vol work.
3. Down Volatility exceeds Up Volatility. (Some exceptions, like bitcoin or soft commodities, but very rare.)
4. Vol Surface has put skew. SKEW: fix the expiration date, and go across strike price. Implied vol at ~10% below the market price is greater than at the money. Markets crash downwards so sellers want to be compensated for the convexity. This differs by asset and changes over time.
5. Implied volatility is higher for longer dated options. TERM STRUCTURE: fix the strike price, go across the strike price. This creates a carry cost and "roll down" effect. Backwardation is rare and happens after spikes in realized vol. This is what caused LCTM to provide long Vega (change in option price with change in volatility)
6. Volatility has memory. Past volatility predicts future volatility. Low vol regimes reinforce themselves (why hedge?) but this becomes dangerously short vol at the bottom. E.g. 2008 -- clustering of huge short vol position burst volatility and lead to de-risking.
7. Vol mean reverts. Central banks and cheap assets. Best to sell vol at sky high prices in an impaired market.
8. Vol regimes change. Monetary and fiscal policy, macro, financial economy, regulation.
9. Vol is reflexive. Vol dearth in 2006-7 lead to build-up in 2008. Stability for too long leads to building strategies expecting low vol.
10. Vol events occur when consensus shatters. Recency bias, failure of imagination. Emphasis on carry leads to complacency and idea that "this will never happen again".
