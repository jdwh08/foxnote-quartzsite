---
aliases:
  - K-Medians Clustering
tags:
  - ds/ml/cluster
edited: 2025-06-14T11:23
created: 2024-03-19T22:06
---
# Definition:
[[Clustering]] by picking "middle" points that define each cluster, and moving the "middle" points until things stop moving.

---
# Notes:

### Algorithm
1. Pick $k$ centers at random
2. Determine which points are closest to each center
	1. Break ties consistently
3. Recompute the centers by averaging all their clustered points
	1. Alternatives: Median instead of Mean
4. Repeat until we converge.

#### Properties
1. Each iteration is in polynomial time $O(kn)$ where $k$ is clusters (reassign all points $n$ based on all centers $k$)
2. We have a finite number of iterations; the most possible states is $O(k^n)$ since each point $n$ can be in at most $k$ different choices
3. Error decreases until we converge, so long as ties are broken consistently.
4. Can converge.
5. Might result in terrible configurations, [[Local Optima]]!
	1. For example, if some cluster centers are really close to each other, and then we have a mass of far away points which will never be considered.
	2. Solutions: [[Hill Climbing]] random restart OR find points which are spread out
6. Might result in tiebreaking points.
7. Does not satisfy [[Clustering#Consistency]]

### Proof as [[Optimizer|Optimization]]
Suppose we have $P^t(x)$ which are the clusters, $C_i^t$ are the points in the cluster $P(i)$, and the center of each cluster.
$$P^t(x) = \underset{i}{\arg\min} ||x-\text{center}_i^{t-1}||_2^2$$ (assign to closest center using distance)
$$\text{center}_i^t = \sum_{y \in C_i^t}^t=\frac{y}{|c_i|}$$

- Our configuration is the centers of each cluster
- Our scores are the [[Mean Squared Error]] between the center and each point in the cluster.
- Our "neighbourhood" is where we keep the centers the same and change the clusters, or keep the clusters the same and change the centers.
- NOTE: this is basically just [[Hill Climbing]]
	- When we reassign points, that happens only when it is closer in distance to a new center. Thus, our metric can never go down.
	- When we recalculate centers, the mean will always be the thing that minimizes [[Mean Squared Error]] (remember calculus?)
	- Thus, this function is [[Monotonic]] and [[Decreasing]].
	- We have a finite set of configurations because the centers cannot change without changing the partitions.
	- Eventually, we will stop seeing better configurations and thus configure.

---
# Examples:
Examples

----
# Source:
GaTech ML