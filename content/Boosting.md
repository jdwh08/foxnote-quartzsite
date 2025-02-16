---
aliases: 
tags:
  - ds/ml
edited: 2025-02-15T16:31
created: 2024-03-19T22:06
---
# Definition:
A [[Ensemble (Machine Learning)]] where each model in the learner is trained so that it focuses more on the errors of the previous models.

----
# Notes:
- Because we are attempting to learn more errors as the number of models increases, we can potentially [[Overfitting|Overfit]] more than in [[Bootstrap Aggregating|Bagging]].

---
# Examples:
[[Adaboost]]
[[Gradient Boosting]]

A naive example with [[Bootstrap Aggregating]]:
1. Train the model.
2. Get the predictions from the training data.
3. Get the [[Loss function]] result for each prediction.
4. Oversample the data points which had higher loss for the next model.
5. Repeat this process for the desired number of learners.
6. Aggregate using mean or mode.

----
# Source:
Source