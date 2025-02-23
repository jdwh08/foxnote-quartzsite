---
aliases: 
tags:
  - ds/ml
edited: 2025-02-22T15:19
created: 2024-03-19T22:06
---
# Definition:
An argument that for [[Machine Learning]] and Artificial Intelligence, ...

> Improvements in performance due to innovations in architecture or more sophisticated human bias are soon superseded simply by scaling up the training data, model size, and compute. -Bishop

This is thanks to [[Moore's Law]] generalized to cheap compute.

---
# Notes:
Learnings:
1. General purpose methods that scale with compute and data are greatly effective. Two known examples:
	1. Search
	2. Learning
2. Actual contents of minds are horrendously complicated. Stop trying to simplify them.
	1. Methods of abstraction and approximation should be done by models, not by humans.

---
# Examples:
1. Chess: Human knowledge based models were beaten by Deep Blue's hyper deep lookups
2. Go: Human knowledge of special features were made irrelevant by search at scale and self-learning via self-play.
3. Speech Recognition: Human knowledge about phonemes and biology were beaten by [[Hidden Markov Models]] relying on compute.
4. [[Computer Vision]]: Human methods like edge detection (e.g., Canny) or SIFT features are mostly discarded for [[Deep Learning]].
5. Basically everything has lost to [[Deep Learning]] using computation and massive training datasets.

----
# Source:
[(Sutton, 2019)](https://www.cs.utexas.edu/~eunsol/courses/data/bitter_lesson.pdf)
This makes me a little sad.