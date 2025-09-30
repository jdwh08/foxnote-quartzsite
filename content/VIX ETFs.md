---
aliases: 
tags:
  - finance/volatility
edited: 2025-02-15T15:55
created: 2024-01-07T13:08
---
### Definition:
Track the [VIX futures index](https://www.spglobal.com/spdji/en/indices/indicators/sp-500-vix-short-term-index-mcap/) by using a combination of [[VIX Futures]] and "rolling" from the near month future to the far month future.

Used as a tradable proxy for the [[VIX Index]].

---
### Notes:
- Typically you see people say that because the [[VIX Futures Term Structure]] is in contango, these long vol ETFs lose money because they sell cheap short dated ETFs and buy expensive long dated ETFs. 
- VTS Brent Orsachoff argues that this is false and compares it to rebalancing a traditional stock portfolio; the NAV does not change after a rebalancing. What affects ETF pricing is the price changes in the underlying VIX Futures.

---
### Examples:
| Volatility | Leverage                                                                                  |
| ---------- | ----------------------------------------------------------------------------------------- |
| UVIX       | 2x VIX                                                                                    |
| UVXY       | 1.5x VIX                                                                                  |
| VIXY       | 1x VIX                                                                                    |
| VIXM       | 1x VIX Mid (3-5mo)                                                                        |
| Cash       | 0x                                                                                        |
| WEIX           | 0x to -0.5x VIX, based on pricing of VIX Futures. As M1+M2 average price gets above 22, it gets to -0.5x VIX. Lower VIX values result in lower exposure. NOTE: I think this setup is stupid.                                                                                          |
| SVOL       | -0.2x to - 0.3x VIX + tail risk hedges. NOTE: distributes as dividends, not price change. |
| SVXY       | -0.5x VIX                                                                                 |
| ZIVB       | -1x VIX Mid (3-5 mo)                                                                      |
| SVIX       | -1x VIX                                                                                   |
