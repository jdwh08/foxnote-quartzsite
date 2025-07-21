---
aliases: 
tags:
  - ds/ml/cluster
edited: 2025-06-11T21:02
created: 2024-03-19T22:06
---
# Definition:
[[Clustering]] by repeatedly connecting the two closest points together.

Formally, this is a [[Hierarchical Agglomerative Clustering]] method.

---
# Notes:

### Algorithm
1. Consider each object a cluster
2. Create some "inter-cluster distance" which is the distance between the **closest two points** in the clusters
	1. Distance function you choose is an important consideration.
3. Merge two closest clusters
4. Repeat $n-k$ times to make $k$ clusters.
	1. Each time you run it, you combine two clusters into one.
	2. NOTE: once data points are in the same cluster, their inter-cluster distance is ZERO. Don't forget this!

![[Single Linkage Clustering.excalidraw.png.png]]
We can also draw this as a [[Tree]] where we gradually merge everything into becoming the root node.

#### Properties
1. Deterministic
2. If distances measure edge lengths in a [[Graphs]] structure, this is equivalent to a [[Minimum Spanning Tree]]
3. Running time is [[Big O]] $O(n^3)$
	1. $n*(n-1)$ for each search; we repeat this $n-k$ times
	2. $k$ the number of final clusters does NOT matter
	3. $k$ is small or big are easy cases.

### Issues with Single Linkage Clustering
SLC is happy to string clusters together so long as they are close together, even if the distance overall becomes very far.

---
# Examples:
Examples

----
# Source:
Source