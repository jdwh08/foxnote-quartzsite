---
aliases:
  - Dividend Discount Model
tags:
  - finance
  - ds/ml/ML4T
edited: 2025-02-17T14:27
created: 2024-03-19T22:06
---
# Definition:
A model of valuation based on intrinsic cash flows.

We use **discounting** for interest rates:
$$PV = FV/(1+r)^i$$

---
# Notes:
When applied to [[Intrinsic Company Value]], we treat these cash payments as dividends (and maybe buybacks). 

When applied to bonds, we use the coupon payments.

---
# Examples:
If we have a cash flow of \$1 in 1 year at interest rate of 1%, we have $\$1.00/(1+0.01)=\$0.99$

Credit risk tends to make interest rates higher, i.e., a "Discount Rate". Suppose our discount rate is 5%; the payment is $\$1.00/(1+0.05)=\$0.95$

Suppose we have infinite constant \$1 dividend payments at a discount rate of 5%. We can value as such: $\sum_{i=1}^{\infty} FV * \frac{1}{(1+r)^i}=\frac{FV}{1-(1+0.05)}=\frac{FV}{0.05}=\$20$
- Note that this is a sum of an [[Infinite Geometric Series]].

----
# Source:
Source