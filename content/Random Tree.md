---
aliases: 
tags:
  - ds/ml/trees
edited: 2025-02-17T09:01
created: 2024-03-19T22:06
---
# Definition:
Like a [[Decision Trees|Decision Tree]], but with randomization applied to speed up processing and prevent overfitting.

We use Adele Cutler's algorithm:
- We chose a RANDOM feature at each instance.
- We choose the mean of TWO RANDOM ROWS for the split value.
- (note that this is different from [[Bootstrap Aggregating|Bagging]], which is building trees on random subsets of data.)

Each individual tree is worse, but taking an [[Ensemble (Machine Learning)|ensemble]] of these random trees using [[Bootstrap Aggregating|bagging]] creates a [[Random Forests|random forest]], which gives significantly better performance.

---
# Notes:


---
# Examples:
Examples

----
# Source:
Source