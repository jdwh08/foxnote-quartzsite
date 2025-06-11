---
aliases: 
tags:
  - ds/ml
  - todo
edited: 2025-05-21T19:48
created: 2024-03-19T22:06
---
# Definition:
[[Machine Learning]] problem where we need to predict a continuous value $y \in \mathbb{R}$ based on a set of inputs.

(Predicting discrete values is [[Classification]].)

---
# Notes:
We need a different [[Loss Function]] than used in classification.
Typically, for [[Linear Regression]], we use [[Quadratic Loss]]


**Parametric Regression**
- Come up with some set of parameters $\beta...\beta$ which are derived from the data and represent the model as a whole.

**Instance Regression**
- Use the entire historical dataset as part of the 
- This is basically just [[Nonparametric Statistics]], e.g., [[K-Nearest Neighbours]].

---
# Examples:

Suppose we are trying to predict rainfall (mm) based on the daily change in barometric pressure.
- We can start with OLS by fitting $\text{rainfall} ~ \beta * \text{barometric change} + b$
- We could make it more sophisticated by adding more terms.

----
# Source:
Source