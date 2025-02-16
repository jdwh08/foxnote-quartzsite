---
aliases: 
tags:
  - finance/volatility
edited: 2025-02-15T15:55
created: 2024-01-07T11:48
---
### Definition:
Options on the [[VIX Index]]. European, cash, settle on Wednesday Morning to VRO. 
**ATM Price is based on the [[VIX Futures]] M1 pricing, not VIX pricing!**

Other: Multiplier is 100x ($3.82 price -> spend $382).

---
### Notes:
- Don't use naked short calls on this because of explosive upside nature of the VIX + gamma effects with the VVIX for front month. Use short call spreads instead.
- Going long calendarized (i.e., short M1 and long M2) is dangerous because VIX can create huge backwardation. The only hedge is futures which don't always move the same way.
- Used to calculate the [[VVIX Index]].

---
### Examples:
Examples