---
aliases:
  - SVM
tags:
  - ds/ml/svm
edited: 2025-06-07T12:49
created: 2024-03-19T22:06
---
# Definition:

A type of [[Machine Learning]] model which attempts to...
- Draw a linear boundary between classes so they are as far apart as possible.

---
# Notes:

### Intuition
Suppose we have some **Linearly Separable** data (i.e., can split perfectly using a line or [[Hyperplane]]).
- One metric we might think about for "good" separation is that we want the line to be as far away from the data as possible. (I.e., "maximize the margin")
- This is probably better than drawing the separator close to the data, because we might imagine being too close to one class might be missing some data which is not in the training sample.
- Moving a line too close to the existing data points is thus "committing" strongly to the training data, and [[Overfitting]].
- We should thus probably put the separator in the "middle" so that it classifies points as widely as possible.

#### Formalizing the Intuition
Support Vector Machines classify things linearly:
$$\hat{y}=w^T x + b$$
- where $\hat{y} \in \{-1, 1\}$ is the prediction (Binary [[Classification]])
- where $w$ is the weights on the features and $b$ is the intercept for the hyperplane.
- The ideal model should have prediction $+1$ for the first positive classes it encounters, and $-1$ for the first negative class it encounters.
![[SVM.excalidraw.png.png]]
$$w'(x_1 - x_2)=2 \rightarrow \frac{w'}{||w||}(x_1-x_2)=\frac{2}{
||w||}$$
Because $w$ is the parameters of the hyperplane, the $w$ vector is perpendicular to the hyperplane. We [[Vector Projection|project]] $x_1 - x_2$ onto the $w$ vector; both are in the same direction so this is the vector's length.

The distance between our boundaries is $\frac{w'}{||w||}(x_1-x_2)=\frac{2}{||w||}$, or the **Margin**.
We maximize the margin using with $w$ subject to classifying the points correctly.

How do we write this condition for classifying points? In binary, this is easy:
$$\hat{y}_i (w' x_i + b) \ge 1\ \forall\ i$$

#### Derivation
$$\max_w \frac{2}{||w||} + \lambda_i \left[\hat{y}_i (w' x_i + b) \ge 1\right]\ \forall\ i$$
This is actually kinda hard; so instead we try to solve this problem instead:
$$\min_w \frac{1}{2} w'w - \sum_i \lambda_i \left[\hat{y}_i (w' x_i + b) - 1\right]$$
because [[Matrix Norm]] is always positive; it's the reciprocal in the top; and squaring is monotonic.
- This turns it into a [[Quadratic Programming]] problem, which is much easier and has known techniques to solve! But... we have to convert it once again to be in the standard form for this. Uh oh.
$$L(w, b, \lambda) = \frac{1}{2} w'w - \sum_i \lambda_i \left[\hat{y}_i (w' x_i + b) - 1\right]$$
$$\frac{\partial L}{\partial w} = w - \sum_i \lambda_i y_i x_i = 0$$
$$\frac{\partial L}{\partial b} = -\sum_i \lambda_i y_i =0$$
- Under the [[KKT Conditions]]. (Remember [[Lagrangians]] from Econ? :P)
- Stuff these back into the original [[Lagrangian]] problem
$$L(w,b,\lambda)=\frac{1}{2} w'w - \sum \lambda ywx - b \sum \lambda y + \sum \lambda$$
- Simplify! This is doing the [[Vector Dual]] version of the problem. 
$$\max w(\lambda) = \sum_i\lambda_i -1/2 \sum_{ij} \lambda_i\ \lambda_j\ y_i\ y_j\ x_i' x_j * K(x_i, x_j)$$
- such that $\lambda_i \ge 0; \sum_i \lambda_i y_i = 0$. K is the optional kernel for the [[Kernel Trick]].
- Once we find $\lambda$, we can find the $w=\sum_i \lambda_i y_i x_i$
- Key Things: 
	- $\lambda_i$ is mostly zero, i.e., most of the data is not needed.
	- These datapoints which are needed are the "Support Vectors".
	- These datapoints are the ones closest to the decision boundary
	- The $y_i\ y_j\ x_i'\ x_j$ uses the [[Dot Product]] between the $x$; this calculates how **"similar in direction" the vectors are**.

### Issues
We require the data to be linearly separable, i.e., can be cleanly divided by a [[Hyperplane]].

- Sometimes data might "intrude" on the wrong side of the decision boundary, e.g., by being a gradual transition.
	- We can fix this by penalizing incorrectly markers with some parameter.
- Sometimes the decision boundary might not be linear at all!
	- We can fix this with the [[Kernel Trick]].
	- TL;DR, we create a function $\Phi(q)$ which converts our data into a higher dimension! E.g., $(q_1, q_2)\rightarrow (q_1^2, q_2^2, \sqrt{2}q_1q_2)$
	- Our dot product $x_i' x_j$ becomes $x_1^2 y_1^2 + x_2^2 y_2^2 + 2x_1 x_2 y_1 y_2 = (x_1 y_1 + x_2 y_2)^2 = (x'y)^2$
	- Notice how this is a Circle!
	- We've exploited the **similar in direction** to become circle-like!
- The kernel encodes the domain knowledge for the function.

![[Kernel Trick Circle.excalidraw.png.png|338x442]]

After the [[Kernel Trick]], we can rewrite the problem to be 
$$\max w(\lambda) = \sum_i\lambda_i -1/2 \sum_{ij} \lambda_i\ \lambda_j\ y_i\ y_j\ K(x_i, x_j)$$

---
# Examples:
Examples

----
# Source:
GAT ML