---
aliases: 
tags:
  - finance/statarb
edited: 2025-02-25T18:38
created: 2024-03-19T22:06
---
# Definition:
A basic long-short hedging strategy derived from the [[Capital Asset Pricing Model|CAPM]] framework.

We find two baskets with $\alpha, \beta$  that we can confidently guess. Then, we adjust weights so that our market $\beta_p r_m = 0 * r_m$, i.e., eliminate the market risk. We go long the asset which has higher $\alpha$.

---
# Notes:
Notes

---
# Examples:

#### Simple Stock Pair Example
- Suppose that we have $\beta_A=1.0, \beta_B=2.0$, and predict $A$ to return $+1\%$ over market and $B$ to return $-1\%$ below market.
- We can create a long-short pair, going long A and short B.
- If the market is flat:
	- $r_A=\beta_A * r_m + \alpha_a=\alpha_a=1.0\%$
	- $r_B=\beta_B * r_m + \alpha_B = \alpha_B = -1.0\%$
	- We went long A with $50 and short B with $50, so our return is $50*0.01 + 50 * 0.01 = 1$
- If the market goes up $10\%$:
	- $r_A = 1.0 * 10 + 1=11\% \rightarrow \$5.5$
	- $r_B = 2.0 * 10 - 1 = -19\% \rightarrow -\$9.5$
	- Total: $-\$4, -4\%$
- If the market goes down 10%:
	-  $r_A = 1.0 * -10 + 1=-9\% \rightarrow \$-4.5$
	- $r_B = 2.0 * -10 - 1 = 21\% \rightarrow \$10.5$
	- Total: $\$6, 6\%$
- **Even with perfect predictions, bad portfolio allocations can matter a lot!**

#### CAPM Optimization
- $r_p = (w_a \beta_a + w_b \beta_b) r_m + w_a \alpha_a + w_b \alpha_b$
- With equal weights, $w_a=w_b=0.5$, we get a CAPM return of $(0.5*1+0.5*-2) r_m + 0.5*1\% + 0.5*-1\%$
- $0.5r_m + 1\%$
- We don't have control of the market returns $r_m$, we can set the weights such that our weight to $r_m$ is zero. $w_a=0.67, w_b=-0.33$
- **NOTE**: We still preserve our returns from $\alpha$!
- If the market goes in any direction:
	- $r_p = (0.67 * 1 - 2 * 0.33) r_m + 0.67+ 0.33= 1\%$

#### ISSUES:
1. Our $\beta$ and $\alpha$ are not set.
2. Our information might be wrong.

----
# Source:
Source