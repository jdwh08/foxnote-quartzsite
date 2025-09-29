---
aliases:
tags:
  - ds/ml/theory/clt
edited: 2025-09-28T23:02
created: 2024-03-19T22:06
---
# Definition:
How well a model is able to learn from examples to true reality.
Poor performance on this is exactly what causes [[Overfitting]].

---
# Notes:

### [[Computational Learning Theory]] Perspective
Several potential issues between model and reality:
1. **[[Optimizer]] Error**: We can't find the best model given the data.
2. **Estimation Error**: Best model can be [[Overfitting]] on training data features which don't generalize well.
3. **Modelling Error**: Our [[Hypothesis Space]] for models was wrong, so even the best candidate hypothesis is wrong.
	1. Similar idea to having the wrong [[Model Bias]].

When picking approaches, we must balance between types of errors.
- Larger models, e.g., [[Deep Learning]], can represent most functions and thus have low **modelling error**, but can be harder to **optimize** or **estimate**.

### [[Statistical Learning]] Perspective
We are trying to do some function approximation for $y=f(x)+\epsilon$.
1. **[[Statistical Learning|Reducible Error]]** is most of the categories in this list.
	1. Optimizer error is not finding the right $f$
	2. Estimation error is not finding a general $f$
	3. Modelling error is not considering the correct $f$ structure
2. [[Statistical Learning|Irreducible Error]] is also a thing though!
	1. Estimation error can be caused by [[Overfitting]] when we inappropriately learn the noise $\epsilon$.
	2. **Even if we perfectly optimize, estimate on training data, and get the correct model, there is still some irreducible error from random noise!**

---
# Examples:
Examples

----
# Source:
GaTech Deep Learning (for CLT)

---
# Flashcards:
Q?A
