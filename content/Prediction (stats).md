---
aliases:
  - Reducible Error
  - Irreducible Error
tags:
  - stats
edited: 2025-02-15T15:45
created: 2024-03-19T22:06
---
# Definition:
[[Statistical Learning]] which tries to obtain guesses for $Y$ using $\hat{Y}=\hat{f}(X)$.
- Our estimating function $\hat{f}$ doesn't really matter in form, so long as it gives good predictions for $\hat{Y}$.

---
# Notes:
Prediction [[Accuracy]] depends on two things:
- Reducible error: Error coming from imperfect $\hat{f}$.
- Irreducible error: Error coming from $\epsilon$ which can't be improved upon.
	- $\epsilon > 0$ because...
		- [[Omitted Variables Bias]]: we have some $X$ that we don't know but are useful for prediction $y$



E(Y-\hat{Y})^2 = E[f(X)+\epsilon-\hat{f}(X)]^2 = [f(X)-\hat{f}(x)]^2 + Var(\epsilon)$




\text{where }Var(\epsilon)\text{ is irreducible.}$



---
# Examples:
Examples

----
# Source:
Source