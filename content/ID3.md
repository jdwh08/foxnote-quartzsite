---
aliases:
tags:
  - ds/ml/trees
  - cs/dsa/greedy
edited: 2025-09-28T22:54
created: 2024-03-19T22:06
---
# Definition:
A [[Decision Trees]] training algorithm (mainly for [[Classification]]) which [[Greedy Algorithm|greedily]] chooses splits that provide the best [[Information Gain]] (or [[Mean Squared Error]]).

---
# Notes:

### Algorithm

We assume many good attributes exist, $n$ is large, and available compute is small.

```pseudocode
LOOP UNTIL DONE:

A = "best" feature to split on. (separates the values in half, where the two halves are specifically differnet)

Set A as splitting attribute for current node.

for a in A:
	create child node. (new leaves)

Sort data into leaf nodes.

if leaf is classified:
	break
else:
	for leaf in leafs:
		(repeat process)
```

```python
def build_tree(data: npt.NDArray[np.floating]) -> list[int, int, int | None, int | None]:
	"""Builds a decision tree.

	Args:
		data: npt.NDArray[np.floating]. The data to build the tree on. We assume features are in columns, and the last column is our target.

	Returns:
		list[int, int, None, None]: An output list:
		int - the node id
		int - the predicted y value
		int | None - the (relative) node id of the left node.
			e.g., 1 means the next row after this one.
		int | None - the (relative) node id of the right node.
	"""
	# Stopping conditions
	if data.shape[0] == 1:
		return [leaf, data.y, None, None]
	if all(data.y is same):
		return [leaf, data.y, None, None]

	# Determine best feature to split on.
	best_feature = get_best_split(data)
	split_val = data[:, best_feature].median()  # split on median for balancing, so tree is log2.
	left_tree: npt.NDArray[np.floating] = build_tree(
		data[data[:, i] < split_val]
	)
	right_tree: npt.NDArray[np.floating] = build_tree(
		data[data[:, i] >= split_val]
	)
	# 1 - left tree is directly after this row
	# left_tree.shape[0] + 1 - right tree is after the left tree
	root = [i, split_val, 1, left_tree.shape[0] + 1]
	return(append(root, left_tree, right_tree))

def get_best_split:
	# Information gain on Entropy is the best method of selection
	# FOR THIS PROJECT, WE USE CORRELATION. This works well enough.
	# Gini index is an alternative.
```

#### Best Attribute:
- Many different success metrics are available for this.
- Typical one is the feature that maximizes [[Information Gain]] (i.e., makes the labels as least random as possible after the split)
	- [[Information Gain]] has an [[Model Bias]] towards features with high cardinality, i.e., if feature is 1-1 with target then we can perfectly predict.

#### Limitations
- [[Model Bias]]
	- **Restriction Bias**: we aren't going to be able to represent stuff outside the space of [[Decision Trees]] (e.g., polynomial functions)
	- **Preference Bias:**
		- ID3 prefers better models over worse ones (gosh, we'd hope.)
		- ID3 is going to prefer good splits near the top of the tree.
		- ID3 is going to prefer shorter trees. We split them well near the top (and quickly), so we don't end up with longer trees with subpoptimal splits


#### Handling Continuous Features
- We can't look at each potential value because $\mathbb{R}$ is our space.
- We can't only look at training set because this doesn't generalize.
- Thus, we convert continuous features into binary ones using a comparison.
	- We would decide these splits based on the values in the training set (e.g., split on median...)
- We could split on different values for continuous variables. (Age < 20, Age < 30, ...)
- More formally, we can sort the values and look at places where the target variable "switches" from FALSE to TRUE, and then use a metric like [[Information Gain]] to see which "switch" is the best boundary (Fayyad 1991). 

#### Handling Missing Values
- Set it to the most common value in the node.
- Create a probability by looking at the feature values within the node, e.g., the average of a 0/1 column.

#### Output
- Voting-based method for 0/1 classification
- Mean for regression

#### Pruning Rules
To avoid [[Overfitting]], we can conduct "pruning" of the trees.
1. **Reduced Error Pruning**: look at subtrees. Remove the subtree starting from its root node, and replace it with the most common answer. Keep this pruning if it doesn't hurt the test-set performance.
2. **Rule Post Pruning**: 
	1. Build the decision tree on the training dataset with overfitting.
	2. Treat each "path" down the decision tree as a combined rule:
		1. E.g., is_sunny AND age > 30 AND has_car THEN true
		2. Look at each of the nodes down that path, e.g., remove is_sunny, and see if it doesn't hurt accuracy. 
			1. We can do this either on the test set OR
			2. C4.5 Algorithm **rule of thumb**: assume the training accuracy is [[Binomial]], and take the lower bound of a 95% [[Confidence Interval]] as the test accuracy.

---
# Examples:

| Row    | x2     | x10   | x11   | Y   |
| ------ | ------ | ----- | ----- | --- |
| CORR   | -0.731 | 0.406 | 0.826 |     |
| 0      | 0.885  | 0.330 | 9.1   | 4   |
| 1      | 0.725  | 0.390 | 10.9  | 5   |
| 2      | 0.560  | 0.500 | 9.4   | 6   |
| 3      | 0.735  | 0.570 | 9.8   | 5   |
| 4      | 0.610  | 0.630 | 8.4   | 3   |
| 5      | 0.260  | 0.630 | 11.8  | 8   |
| 6      | 0.500  | 0.680 | 10.5  | 7   |
| 7      | 0.320  | 0.780 | 10.0  | 6   |

| Node # | Factor | SplitVal | Left | Right |
| ------ | ------ | -------- | ---- | ----- |
| 0      | 11     | 9.9      | 1    | ???   |
We start with 11 because it has the highest $abs(corr(x,y))$
The median of factor 11 is 9.9, our splitval
Within the left data, the highest correlation is still x11. 
- If they have the same value (e.g., when we get close to zero size leafs), we can choose. They suggest deterministic pick of the first.
The median of data$[x_{11} < 9.9, x_{11}]=9.25$, our new splitval.

| Node # | Factor | SplitVal | Left | Right |
| ------ | ------ | -------- | ---- | ----- |
| 0      | 11     | 9.9      | 1    | ???   |
| 1      | 11     | 9.25     | 1    | ???   |

----
# Source:
GaTech ML Decision Trees
Mitchell 1997

Proposed by J.R. Quinlan in **Induction of Decision Trees**, 1973.