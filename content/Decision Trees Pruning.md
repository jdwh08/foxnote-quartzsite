---
aliases: 
tags:
  - ds/ml/trees
edited: 2025-09-23T16:16
created: 2024-03-19T22:06
---
# Definition:
The process of making a [[Decision Trees|Decision Tree]] less complex by removing some low-value splits. 
1. Start with a large tree with many splits.
2. Prune away splits to create a *subtree*.

Helps to avoid [[Overfitting]].

---
# Notes:
#### Cost Complexity Pruning
Metric for determining which splits to prune.
1. Consider only a sequence of trees indexed by a tuning parameter $\alpha$. $\alpha$ controls the relative weight of terminal nodes as opposed to the prediction loss.
2. For each $\alpha$, there is some subtree $T \subset T_0$ which makes the resulting **prediction + leaf node** size as small as possible. We choose this subtree.
	1. This is similar to [[Lasso Regularization]]'s penalty for new features.



..\min \sum_{m=1}^{|T|} \sum_{x_i \in R_m} (y_i - \hat{y}_{R_m})^2 + \alpha |T|$


- $|T|$ is the number of [[Leaf Node]]s in the tree
- Recall each leaf node corresponds to some region in the feature space $R_m$ that was partitioned.
- For each observation $x_i$ in that region, we get the loss plus $\alpha * |T|$, where $\alpha$ is the weight for additional leaf nodes.
- Note that $\alpha=0$ is the same as normal trees with no pruning.
- Branches are pruned in a very predictable fashion, so it's easy to get the best subtrees as a function of $\alpha$.

### `Pseudcode` for Regression Trees with Pruning
1. Create a tree using recursive binary splitting, e.g., [[ID3]].
2. Use cost-complexity pruning to get the sequence of best subtrees based on $\alpha$.
3. Use [[K-Fold Cross Validation]] to choose the best $\alpha$.
4. Return the pruned tree that corresponds to the best $\alpha$.

---
# Examples:
Examples

----
# Source:
Source