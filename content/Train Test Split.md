---
aliases:
  - Cross Validation
tags:
  - ds
  - ds/ml
edited: 2025-05-21T20:58
created: 2024-03-19T22:06
---
# Definition:
Taking our full training dataset and randomly splitting it into train and test components.
- If we evaluated (test) our sample on the same data as we used for training, then it would be an overestimate.
- This ensures we build models which learn enough on the training set but not learning noise that is not useful for the test set.
- Models will [[Overfitting|Overfit]] on the training set and do less well on the testing set.

We train the model on the training dataset, and then get a proxy of the true out-of-sample performance by running it on the test set.

NOTE: We assume that train and test data are representative of the future, e.g., a form of [[Independent and Identically Distributed]].

---
# Notes:
Traditionally we use a 60/40 split between train and test.

More sophisticated approaches might be something like [[K-Fold Cross Validation]], or [[Leave One Out Cross Validation]].

If we have [[Time Series]], it is generally suggested to train on early data and test on later data, to prevent [[Data Leakage]], called [[K-Fold Cross Validation|Roll Forward Cross Validation]].

Finally, particular models can have validation types, e.g., [[Out of Bag Cross Validation]] for bagging models.

---
# Examples:
Examples

----
# Source:
Source