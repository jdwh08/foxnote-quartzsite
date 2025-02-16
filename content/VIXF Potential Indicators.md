---
aliases: 
tags:
  - lists
  - finance/volatility
edited: 2025-02-15T15:55
created: 2024-01-06T20:18
---
- [ ] VXX Crush Level
	- [ ] https://www.volatilitytradingstrategies.com/blog/how-to-estimate-daily-vxx-decay-vxx-crush-level
	- [ ] Calculate VX30 as $M1 * M1_{DTE} * (100\% / \#\ Trading\ Days\ in\ Cycle) + M2 * (100\% - M2_{DTE} * (100\% / \#\ Trading\ Days\ in\ Cycle))$
- [ ] M1/M2 VIX Futures <higher = short vol>. Adjust this based on roll %age per day based on Futures DTE to get a constant duration matching the index.
	- [ ] Note that as DTE->0, $M1->VIX.
- [ ] M4/M7 VIX Futures <higher = short vol>. Adjust this...
- [ ] Vol Risk Premium / Trader's VRP <higher = short vol>
	- [ ] VRP = VIX Reading - (Historical annualized 30-day SPX return volatility) 
	- [ ] You can also do this on the 9D/3M/6M/1Y using [[VIX Cash Term Structure]]
- [ ] (Extreme) SPX? Put/Call Ratio <lower = short vol>
- [ ] VOL Skew between put/call options prices, or just the $SKEW index https://www.cboe.com/us/indices/dashboard/skew/
- [ ] [[VIX Index|VIX]]-[[VOLI Index|VOLI]] Residual <lower = short vol>
	- [ ] Measures excess implied vol of far out-of-the-money options
- [ ] M1/VIX roll yield <higher = short vol>
- [ ] VX30/VIX roll yield <higher = short vol>
- [ ] VIX9d/VIX ratio (fast crossover) <lower = short vol>
- [ ] VIX/VIX3m ratio (medium crossover) <lower = short vol>
- [ ] VIX/VIX6m ratio (slow crossover) <lower = short vol>
- [ ] VIX/VIX1y ratio (long crossover) <lower = short vol>
- [ ] [[VOLI Index]] <lower = short vol>
- [ ] VVIX Index <lower = short vol>
- [ ] VIXF Commitment of Traders? https://www.cftc.gov/dea/futures/deacboelf.htm
- [ ] SPX $ADD Advance/Decline Index
- [ ] SPX $TICK 
- [ ] VIX/SPX correlation 
- [ ] CDS Spreads on corpo bonds, TED spread 
- [ ] CBOE Implied Correlation Index (as a proxy for others being short vol dispersion trade)