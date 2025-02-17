---
aliases:
  - CAPM
tags:
  - finance
  - ds/ml/ML4T
edited: 2025-02-16T12:02
created: 2024-03-19T22:06
---
# Definition:

The returns of any asset $i$ can be determined by a [[Linear Regression]] against the "Market [[Portfolio (Finance)|Portfolio]]" of all assets held at [[Market Cap]] weights:
$$r_i(t)=\beta_i * r_m(t) + \alpha_i(t)$$
i.e., the asset return is some [[Beta Finance]] times the market portfolio, plus some residual [[Alpha Finance]].

Or at the portfolio level:
$$r_p(t) = \sum_i w_i(\beta_i r_m(t) + \alpha_i(t)) = \beta_p r_m(t) + \sum_i w_i \alpha_i(t)$$

CAPM also argues that the [[Expected Value]] of the [[Alpha Finance]] is zero: $E[\alpha_i(t)]=0$, and alpha is **random and not predictable**.

---
# Notes:
CAPM provides theoretical support for [[Passive Investing]].
- In order to beat the market, we would have to choose our $\beta$ wisely and do [[Market Timing]] (high $\beta$ in up markets, low $\beta$ in down markets).
- [[Efficient Markets Hypothesis]] would say this is not possible.
- Thus, we can't beat the market reliably.

Active [[Portfolio Managers]] disagree, and believe that on average their alpha is positive for [[Active Investing]].

---
# Examples:
Examples

----
# Source:
Source