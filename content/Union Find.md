---
aliases:
  - Disjoint Set
tags:
  - cs/dsa/graph/unionfind
edited: 2025-08-16T10:31
created: 2024-03-19T22:06
---
# Definition:
An algorithm for [[Graph]] which finds the number of connected components. 

---
# Notes:

### Psuedocode
1. Create an [[Array]] of "parent" values. Index 0 is the 0th node. Initial state is for each node to be the parent of itself.
2. Go through the edges. If a connection exists, e.g., $0 \rightarrow 1$, then we can combine the two together into a "connected component."
	1. Number of connected components reduces by one.
3. For optimization, we can keep track of the size of the connected components as a "rank" array.
	1. We should merge the smaller component into the larger one. This makes the result closer to a [[Tree]] instead of a [[Linked List]].
4. We can know that two nodes are in the same connected component if they have the same tree root.
	1. Always merge nodes into the tree root! The tree root becomes like an "index" for the entire group, similar to [[Bucket Sort]].

NOTE: this essentially results in a series of trees, one for each connected component.

We can divide this algorithm into two parts:
1. FIND: This finds the root node for a given component. 
2. UNION: This merges two components together into a single connected component.

```python
def find(node: int) -> int:
	output = node

	while output != parent[result]:
		# path compression optimizer:
		# "skip over" parent by having it be same as grandparent
		# worst case is grandparent=parent (self loop)
		parent[output] = parent[parent[output]]
		output = parent[output]

	return output

def union(n1: int, n2: int) -> bool:
	p1, p2 = find(n1), find(n2)
	if p1 == p2:
		# already same connected component
		return False

	# do the merge do the merge!
	if rank[p2] > rank[p1]:
		parent[p1] = p2
		rank[p2] += rank[p1]
	else:
		parent[p2] = p1
		rank[p1] += rank[p2]
	return True

def unionfind():
	for n1, n2 in edges:
		did_union = union(n1, n2)
		...
```

### [[Big O]]
$O(V + \alpha(E))$, basically the same as [[Depth First Search|DFS]] or [[Breadth First Search|BFS]] except for an amortization $\alpha$ which makes it slightly cheaper.

### Optimizations
1. Since each component in a Union Find is the same as a [[Tree]], for tree-efficiency purposes we want them to be as shallow as possible.
	1. Thus, we should `union` the smaller component into the larger component.
2. When using `find`, we can "compress" the path to find the root by setting parents to grandparents.

---
# Examples:

### Basic Walkthrough
Suppose we have the following node edges: $1 \leftrightarrow [2, 3]$ and $4 \leftrightarrow []$.
All nodes start off as parents of themselves.

We then go through each edge, `find` out if they already in the same component (skip if yes), and then `union` them if they are not yet combined.

| Pass | N1      | N2  | N3  | N4  |
| ---- | ------- | --- | --- | --- |
| 0    | 1       | 2   | 3   | 4   |
| 1    | 1, 2    |     |     | 4   |
| 2    | 1, 2, 3 |     |     | 4   |

### Algorithms
- [[Kruskal's Algorithm]] for minimum spanning trees

### Leetcode
- [[Leetcode 323 Number of Connected Components in Undirected Graph]]
- [[Leetcode 684 Redundant Connection]]

----
# Source:
Neetcode
https://www.youtube.com/watch?v=0jNmHPfA_yE
https://www.youtube.com/watch?v=VHRhJWacxis