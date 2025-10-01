---
aliases: 
tags:
  - finance
edited: 2025-03-11T20:49
created: 2024-03-19T22:06
---
# Definition:
A theory regarding active portfolio management.

Richard Grinhold's Fundamental Law:


perf = skill * \sqrt{breadth}$



#### Formally:

Performance over time is measured via Information Ratio.


perf=r_p(t)=\beta r_m(t) + \alpha_p(t)$


where we are using the [[Capital Asset Pricing Model|CAPM]] to model returns. We can back out the [[Sharpe Ratio]] of the $\alpha$ component:


IR=\frac{mean(\alpha_p(t))}{stdev(\alpha_p(t))}$


and we calculate this via alpha over time.

Information Coefficient is the correlation of forecasts to actual returns.

Breadth is the number of trading opportunities per year. A benchmark buy-and-hold of 20 positions is still technically 20 trading opportunities (one per holding per year).



IR=IC*\sqrt{Breadth}$


Note that often breadth is easy to improve, while skill is hard to. However, breadth grows slowly.

---
# Notes:
Notes

---
# Examples:

#### Coin Casino
Suppose we have a stock that acts like a coin.
- Coin is biased: heads $p=0.51$. This is our 'edge' $\alpha$, with uncertainty like $\beta$.
- Can bet $N$, for either a double $2N$ or nothing $0$ payout.
- Casino has 1000 tables with this coin running in parallel. Budget of 1000.


The optimal bet is to place 1 token on each table, as opposed to concentrating all tokens on one table.
- Same [[Expected Value]] in both cases because tables are [[Independent and Identically Distributed|IID]]: $1000*0.51-1000*0.49=20$.
- Risks are substantially worse in concentration case.
	- "Total Loss Risk". Concentration leads to 49% chance of total failure. Diversification leads to $(0.49)^{1000} \approx 0$.
	- [[Standard Deviation]] of bet returns. Concentration leads to $stdev(\pm 1000, 0, 0, ...)=31.62$. Diversification leads to stdev of 1.0 (?).
- Risk Adjusted Rewards ([[Sharpe Ratio]] like) are thus substantially worse in concentration.
	- Concentration leads to $20/31.62=0.63$
	- Diversification leads to $20/1=20.
	- $20 = 0.63 * \sqrt{1000}$

Thus, we can see the start of the Fundamental Law: performance is similar to skill times square root of diversification.

#### Real Examples
RenTech trades $100,000$ times per day, while Warren Buffet holds only $20$ stocks for a long time. What Gives?

Suppose Buffet only trades 120 times per year, and that RenTech's algorithms are only 1/1000th as good as Buffet. Then, to have the same information ratio, RenTech must trade:
$IC_b * \sqrt{120} = 1/1000 IC_b * \sqrt{x} \rightarrow x=$ 120,000,000.

----
# Source:
Source