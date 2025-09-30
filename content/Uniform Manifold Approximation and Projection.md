---
aliases:
  - UMAP
tags:
  - ds/dimension_reduction
edited: 2025-09-28T23:42
created: 2024-03-26T22:42
---
# Definition:
Nonlinear [[Dimension Reduction]] via [[Manifold]], as opposed to [[Principal Component Analysis]].

---
# Notes:

### Algorithm
We assume the [[Manifold Learning]] hypothesis is true.

Starting with some high dimensional data, move the points around in lower-dimensional space until they form similar clusters in lower-dimensions.

1. Calculate similarity scores. Calculate distances between high-dimension points. Place them on the lower dimensional axis at the prior distance.
2. Then consider the number of high dimensional neighbours (typically 15, including self).
3. Take $log_2(neighbours)$ to calculate a curve for the similarity scores. The curve is set up so the sum of y-coordinate for the nearest neighbours adds up to $log_2(neighbours)$.

![[UMAP_Dimension.excalidraw.png.svg|600x100%]]

- Notice how the similarity scores are computed for each point? This means that A-B similarity can be different from B-A. This is "averaged" out.
- Forcing the similarities to equal a constant $log_2(neighbours)$ also means each point will have some point with higher similarity scores.

4. Create a low dimensional graph of the data. Randomly select a pair of points (higher similarity score means more likely to select the pair.)
5. Move points closer together. Randomly choose the direction A $\rightarrow$ B, or A $\leftarrow$ B. Then randomly pick a point that is far away from the point being moved (e.g., B should be far from F). 
6. Calculate low-dimensionality similarity scores for A-B, and B-F. Use the same fixed [[t-Distribution]] for this. Nudge the point very slightly. Increase A-B similarity score (since moving closer together) and decrease B-F similarity score (since moving further apart).
7. Repeat. 

---
### Notes:
- Fast even with large datasets.
- Similar data clusters together.

- Number of neighbours affects local vs global structure:
	- Low number of neighbours gives a lot for small independent clusters. (Local)
	- High number of neighbours focuses on the overall picture. (Global)

- This is similar to [[t-SNE]], however...
	- t-SNE randomizes the positions for the low dimensional data, instead of UMAP which uses fixed points coming from spectral embeddings. 
	- UMAP can move just one point at a time, whereas t-SNE must move all points every time. This makes UMAP more scalable.

---
### Math:
**Formula** for similarity score is $e^{-(\text{raw distance - distance to nearest neighbour}) / \sigma}$.
- E.g., consider our case where A-B is closest, the distance is 0.5, and $\sigma=1$. Then, our similarity score for B from A is $e^0=1$.
- Now we look for A-C: $e^{-(2.4-0.5)/1}=0.15$ 
- Points very far from A get similarity scores near 0.
- We need to change the value of $\sigma$ until the sum of the similarity scores equals $log_2(N neighbours)$. Each point we get has different distances and thus different $\sigma$.


**Formula** for making scores symmetrical between A-B and B-A: $(S_1 + S_2) - S_1S_2$
- E.g,. $0.6 + 1.0 - (0.6 * 1.0) = 1.0$
- This formula is the "Fuzzy Union" operation from [[Topology]] and [[Fuzzy Set]] theory.


**Formula** for calculating low-dimensionality similarity scores using the [[t-Distribution]]:
$$\frac{1}{1+\alpha d^{2\beta}}$$
where $d$ is low-dimensional distance and $\alpha, \beta$ are parameters that control how tight the points should be. (UMAP uses: $\alpha=1.577$, $\beta=0.8951$; t-SNE uses 1 & 1)


**Cost function** for UMAP moving a point B closer to A and further from F:
8. Calculate the low-dimensionality score for B-A (e.g., 0.14) "neighbour"
9. Calculate the low-dimensionality score for B-F (e.g., 0.23) "nonneighbour"
10. Cost function is $log(1/\text{neighbour}) + log(1/(\text{1-nonneighbour}))$
	1. E.g., $log(1/0.14)+log(1/(1-0.23))$
	2. Use [[Stochastic Gradient Descent]] to minimize the cost function. This does introduce some randomness.

---
### Sources:
Statquest
https://pair-code.github.io/understanding-umap/