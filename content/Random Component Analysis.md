---
aliases:
  - Random Projection
tags:
  - ds/ml/featureeng
edited: 2025-06-20T16:30
created: 2024-03-19T22:06
---
# Definition:

Similar to [[Principal Component Analysis|PCA]] or [[Independent Components Analysis]], where we find some new features which are smaller but still try to represent the data. HOWEVER, we select them randomly.

---
# Notes:

It works surprisingly well if the next step is [[Classification]], because it reduces the [[Curse of Dimensionality]].
- It still picks up some correlations.
- Doesn't quite condense as much as [[Principal Component Analysis|PCA]].

### Theory
The [[Johnson Lindenstrauss Lemma]] states that a set of $N$ points in high dimensional Euclidean space can be embedded in a lower dimensional space so that pairwise distances are approximately preserved.

This is Fast / Cheap / Easy compared to PCA.

---
# Examples:
Examples

----
# Source:
Source