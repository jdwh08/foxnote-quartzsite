---
aliases:
  - Impossibility Theorem for Clustering
tags:
  - ds/ml/cluster
edited: 2025-09-30T21:59
created: 2024-03-19T22:06
---
# Definition:
Grouping some data so that similar things are together and distant things are apart.

A form of [[Unsupervised Machine Learning]].

---
# Notes:

### Formal Problem:
- Given set of objects $X$ which has some distance measure $D(x,y)=D(y,x) \forall x,y \in X$
- We partition the data so that if x and y are in the same cluster, $P_D(x)=P_D(y)$

### Example Algorithms
- [[Single Linkage Clustering]]
- [[K-Means Clustering]]
- [[Soft Clustering]] e.g., [[Soft Clustering|Gaussian Mixture Models]]

### Ideal Properties of Clustering Algorithms
##### Richness:
- For any assignment of objects to clusters, there is **some** distance matrix that can produce a clustering $C$. (we can express all clusters)
	- E.g., cluster all points within some distance $\theta$: we can manipulate $\theta$ to represent all possible clusters. 
	- (this doesn't have scale invariance)
#### Scale-Invariance
- Scaling, e.g., measurement units, should NOT change the clustering.
	- E.g., cluster all points within some max-scaled distance $\theta / |\max D|$; this does NOT depend on scale. 
	- (this doesn't have consistency)
#### Consistency
- Shrinking distances within clusters, or growing distances between clusters does NOT change the clustering. 
	- E.g., cluster all points to form $n/2$ clusters. 
	- (this doesn't have richness)

![[Clustering Impossibility Theorem#Definition]]

In practice, people decide what they want from clustering. 

---
# Examples:
Examples

----
# Source:
GaTech ML