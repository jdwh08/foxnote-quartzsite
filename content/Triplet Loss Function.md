---
aliases: 
tags:
  - ds/ml/loss_function
edited: 2025-02-15T16:32
created: 2024-04-15T15:22
---
### Definition:
A loss function, particularly useful for [[Convolutional Neural Networks]] or [[Sentence Transformers]].

We want to train similarity, so are given three things:
1. Anchor.
2. Positive. This should be the same "class" as the anchor.
3. Negative. This should be a different "class" as the anchor.

The score function tries to $max(\text{anchor-negative})$ and $min(\text{anchor-positive})$

---
### Notes:
Notes

---
### Examples:
Examples