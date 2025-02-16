---
aliases:
  - Cross Validation
tags:
  - ds
  - ds/ml
edited: 2025-02-15T16:31
created: 2024-03-19T22:06
---
# Definition:
Taking our full training dataset and randomly splitting it into train and test components.
- If we evaluated (test) our sample on the same data as we used for training, then it would be an overestimate.
- Models will [[Overfitting|Overfit]] on the training set and do less well on the testing set.

We train the model on the training dataset, and then get a proxy of the true out-of-sample performance by running it on the test set.

---
# Notes:
Traditionally we use a 60/40 split

If we have [[Time Series]], it is generally suggested to train on early data and test on later data, to prevent [[Data Leakage]].

More sophisticated approaches might be something like [[K-Fold Cross Validation]].

---
# Examples:
Examples

----
# Source:
Source