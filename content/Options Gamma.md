---
aliases: 
tags:
  - finance/options
edited: 2025-02-15T15:54
created: 2024-01-07T13:39
---
### Definition:
Change in [[Options Delta]] over change in price of the underlying asset.
- AKA, $\partial^2{\ \text{OptionPrice}}/\partial^2{\ \text{UnderlyingPrice}}$

---
### Notes:
- Measures convexity of derivative value with respect to underlying price.
	- Helpful for ensuring convexity is stable when [[Delta Hedging]] by also doing [[Delta-Gamma Hedging]].
- Long options is always long Gamma.
- Gamma is larger at the money, and smaller when far OTM.
- Gamma is larger near expiration, and smaller for long-dated options.
- Change in Gamma over change in underlying is Options Colour.

- Long Gamma strategies have [[Options Delta]] increase as underlying increases. You can take advantage of this by buying delta low, taking advantage of gamma to drive delta high, and then selling delta high.
- Short Gamma strategies have Gamma Risk, where losses might compound losses.
	- E.g., Delta-Neutral Short Gamma position will become more and more Delta-Negative position as underlying increases, which loses more and more money. If you capitulate and become delta-neutral again, you might face the same problem when the underlying goes back down.

---
### Examples:
Delta of +40 and Gamma of 10 means a $1 increase in the underlying price would result in the option becoming Delta +50.
