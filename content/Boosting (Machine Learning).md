---
aliases: 
tags:
  - ds/ml
  - ds/ml/trees
edited: 2025-02-17T10:20
created: 2024-03-19T22:06
---
# Definition:
A [[Ensemble (Machine Learning)]] approach where each additional model in the learner is trained so that it focuses more on the errors of the previous models.

----
# Notes:

##### How it Works
Each tree learns the errors from the past trees, thus learning the dataset ***slowly*** instead of all at once.

##### Overfitting
As the number of models increases, model expressiveness increases because we are constantly "learning" the past error. Thus, we can potentially [[Overfitting|Overfit]] as the number of trees grows, unlike in [[Bootstrap Aggregating|Bagging]] or [[Random Forests]].

---
# Examples:

A naive example with [[Bootstrap Aggregating]]:
1. Train the model.
2. Get the predictions from the training data.
3. Get the [[Loss Function]] result for each prediction.
4. Oversample the data points which had higher loss for the next model.
5. Repeat this process for the desired number of learners.
6. Aggregate using mean or mode.

[[AdaBoost]]
[[Gradient Boosting]]

----
# Source:
Source