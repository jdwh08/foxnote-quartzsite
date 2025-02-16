---
aliases:
  - vol_todo
tags:
  - lists
  - todo
  - finance/volatility
edited: 2025-02-15T15:55
created: 2024-01-01T18:02
---
- [ ] Implement the other [[VIXF Potential Indicators]]
- [ ] Implement order-level risk management: add trailing stop / bracket orders / one-triggers-other-stop-loss. Consider using [[Options Implied Probability Distributions]] to determine stop point.
- [ ] Investigate medium length 4-7mo duration and add ETFs
- [ ] Add [[VIX ETFs|SVIX, VIXY, ZIVB]] to strategy
- [ ] Predict returns for front month vix futures _w_ for 5 days ahead
- [ ] Look at SPX, SPY, ... options and [[VIX Index|VIX]], VIXY, ... options
- [ ] Calculate [[Options Implied Probability Distributions]] for the options chains above
	- [ ] Measure probs of tail events vs historical
	- [ ] Look at tail movements breaking out fast (e.g., vix calls otm)
- [ ] Options vol, regimes, edges, skew, ETFs, https://www.youtube.com/watch?v=byCVdQkCMbM
- [ ] Can't we do something with pricing VIX Futures like regular futures? I.e., $F = S_0 +$carry cost? And then use something with [[Options Implied Probability Distributions]] on the VVIX to guess the fair price of VIX futures given their DTE?
