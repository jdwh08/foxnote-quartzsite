---
aliases: 
tags:
  - ds/ml/trees
edited: 2025-02-17T09:48
created: 2024-03-19T22:06
---
# Definition:
A [[Boosting (Machine Learning)|boosting]] ML model for [[Classification]], based around [[Decision Trees]].

Formally, we have some boosting algorithm:
$$F_T=\sum_{t=1}^T f_t(x)$$
where for each tree we train, we do:
$$\underset{\alpha}{\arg\min}\ L_t=\sum_i^N L_t({F_{t-1}(x_i)+\alpha \hat{f}(x_i)})$$

---
# Notes:

#### Training Algorithm
1. Give each sample a weight. We start with a [[Uniform Distribution]] weight.
2. Create a [[Decision Trees|tree]] based on the best performing feature and split (e.g., by [[Gini Index]] or [[Entropy (information theory)|entropy]])
	1. Take into account the weights, e.g., a weighted Gini Index / Entropy.
	2. OR duplicate copies of observations based on their sample weights as a more [[Bootstrap Aggregating|Bagging]]-like approach
		1. Pick a random number between 0-1.
		2. Treat the sample weights as a [[Probability Mass Function]]. Convert it into a [[Cumulative Distribution Function]] using [[Partial Sums]]. 
		3. Find out which partial sum the random number is in. Repeat.
		4. Our sample weights are thus controlled by the number of observations drawn, so we reset with [[Uniform Distribution]].
3. Determine the weight of the tree based on its performance.
	1. Obtain the [[Classification Error Rate]], but weighted for each sample: $CERw=\frac{1}{N} \sum_i^N w_i*\mathbb{1}(y_i = \hat{y_i})$
	2. Calculate the "Amount of Say": $1/2 * log\left(\frac{1-CERw + \epsilon}{CERw + \epsilon}\right)$. The better the classification, the higher the amount of say. Random gets zero. Bad gets negative weight.
	3.  ![[Adaboost_Amount_of_Say.excalidraw.png.svg|454x420]] 
4. Adjust the sample weights for the new tree.
	1. Incorrect: $w_{i}(t+1)=w_i(t) \times e^{\text{Amount of Say}}$. This increases with AoS.
	2. Correct: $w_{i}(t+1)=w_i(t) \times e^{-\text{Amount of Say}}$. This decreases with AoS.
	3. Normalize the weights to sum to 1 using $w_i / \sum w_i$.
5. Continue until reaching some [[Stopping (machine learning)]], e.g., the total number of trees $K$.

#### Inferencing Algorithm:
1. Classify the observation using all the stumps.
2. For each category $c_j$, get the total amount of say of the stumps which classify it: $\sum_i^K c_j$.
3. Chosen classification is the classification which has the most weight.

#### Difference to Random Forest
- We (usually) train trees which are **stumps**, i.e., have a max depth of 1, instead of deeper trees.
- **Boosting here by giving some trees more weight than other trees, based on their performance!**
- **Boosting here means that the errors from the existing model are used to build the next tree!** 

#### Derivation of "Amount of Say"
#todo  -- [Wikipedia](https://en.wikipedia.org/wiki/AdaBoost) has a decent enough derivation based on Rojas (2009).

---
# Examples:
Examples

----
# Source:
Source