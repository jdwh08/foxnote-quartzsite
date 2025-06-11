---
aliases: 
tags:
  - cs/dsa/optimizers
edited: 2025-06-09T22:00
created: 2024-03-19T22:06
---
# Definition:

A type of [[Optimizer]] which incorporates random sampling to improve.

Useful in cases where the gradient in [[Gradient Descent]] doesn't work.

---
# Notes:

We don't keep a record of history besides current state!
We don't keep a way to handle [[Probability Density Function]] or distributions!

---
# Examples:

1. [[Hill Climbing]], and with restarts
2. [[Simulated Annealing]]
3. [[Genetic Algorithm]]
4. TABU search (avoids regions which didn't work well.)
5. MIMIC that GaTech shills

----
# Source:
Source