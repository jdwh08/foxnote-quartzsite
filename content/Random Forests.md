---
aliases: 
tags:
  - ds/ml/trees
edited: 2025-02-17T10:00
created: 2024-03-19T22:06
---
# Definition:
An improvement on [[Bootstrap Aggregating]] for [[Decision Trees]] which attempts to reduce [[Correlation (Pearson)|Correlation]] between each tree.

We limit the possible features used to build each split at the tree to some fraction, e.g., $m \approx \sqrt{p}$ of the total features $p$. (If we set $m=p$, this is the same as [[Bootstrap Aggregating|Bagging]].)

---
# Notes:

#### Training Algorithm:
1. [[Bootstrapping|Bootstrap]] the dataset by random sampling *with replacement*. This is usually the same size as the underlying dataset.
2. For each bootstrapped dataset, build a [[Decision Trees|tree]]:
	1. For each node, randomly select $m$ features from the $p$ total as available.
	2. Use these $m$ features to determine the best feature (same as decision trees).
	3. Repeat until reaching some [[Stopping (machine learning)]].

#### Inferencing Algorithm:
1. Get the predictions for each tree, and then average them (mean/median/mode)

#### How it Works
- Suppose we only have one feature that works well. Almost all trees will use that feature as the main split(s). Thus, they will be highly similar / [[Correlation (Pearson)|Correlated]] to each other.
- Now, let's apply random forests. $(p-m)/p$ of the splits will not have the one feature that works well. Thus, they are going to be different and less correlated.
- This also creates a wide variety of trees!

#### Evaluation:
- We can use the same [[Out of Bag Cross Validation]] as in bagging.

---
# Examples:
Examples

----
# Source:
Source