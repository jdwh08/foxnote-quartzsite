---
aliases: 
tags:
  - ds/ml/trees
edited: 2025-02-17T09:56
created: 2024-03-19T22:06
---
# Definition:

A method for evaluating ML models built using [[Bootstrap Aggregating|Bagging]].
- On average, each tree bag will use $2/3$ of the data. Thus, we can look at the data not used in the bag.
- Average the predictions for the $1/3 * B$ smaller learners where the data is out of bag.
- This is analogous to [[Train Test Split]], so the out-of-bag data is a valid proxy for the test data.

---
# Notes:
Notes

---
# Examples:
Examples

----
# Source:
Source