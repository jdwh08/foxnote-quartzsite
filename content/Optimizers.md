---
aliases: 
tags:
  - stats
  - ds
edited: 2025-02-17T10:20
created: 2024-03-19T22:06
---
# Definition:
A process which attempts to analytically minimize some [[Loss Function]] using repeated guess-and-check.

---
# Notes:

Optimizers can do the following:
1. Find minimum values of functions
2. (used to) build parameterized models based on Data

Must provide the following:
1. A function to minimize (loss function)
2. An initial guess (random value works but is suboptimal)

---
# Examples:

**[[Gradient Descent]]**
Suppose we minimize $f(x) = (x-1.5)^2 + 0.5$. This is minimized at 1.5 because it's a parabola.
1. Test the starting guess (2.0)
2. Calculate the [[Gradient]] with respect to $x$
3. Move some distance (learning rate) in negative gradient.
4. Stop when the distance is different.

Others are available (e.g., scipy.optimize)
```python
import scipy.optimize as spo

def f(x):
	return (x - 1.5)**2 + 0.5

start_X_guess = 2.0
min_result = spo.minimize(
	f,
	start_X_guess,
	method="SLSQP",  # minimizing algorithm
	options={"disp": True}
)
```

Potential ways to defeat minimizers:
1. Portions of the function which are flat.
2. Discontinuities
3. Multiple local optima.

Easiest functions:
1. Convex: A line segment between any two points on the curve is always above the graph.

We then need to find some [[Loss Function]] for the topic (e.g., L1 / L2). 
```python
# Generate initial guess for line:
# slope 0, intercept mean of values
l = np.float32([0, np.mean(data[:, 1])])

# Plot initial guess
```

----
# Source:
GaTech OMSCS ML4T
