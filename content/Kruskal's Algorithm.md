---
aliases:
tags:
  - cs/dsa/graph/mst/kruskal
  - cs/dsa/greedy
edited: 2025-09-04T14:32
created: 2024-03-19T22:06
---
# Definition:
A [[Greedy Algorithm]] to find the [[Minimum Spanning Tree]] of a [[Graph]].

---
# Notes:

### Algorithm
1. Store edge weights in a [[Heap|Min Heap]].
2. Get cheapest edge (greedy).
3. Check if it connects components using [[Union Find]].
	1. If it does not, skip and move on.
4. Continue connecting components until we have connected everything.

That's it!

```python
### SETUP
graph: dict[int, set[int]]  # adjacency list
minheap: list[tuple[int, int, int]] = []

### Populate the min heap
for i in range(len(edges)):
	for j in range(i+1, len(edges)):
		# get distance
		dist = dist(i, j)
		# add to graph
		graph[i].add(j)
		graph[j].add(i)
		# add to minheap
		heapq.heappush(minheap, (dist, i, j))

### Union Find
parent: list[int] = [i for i in range(len(points))]
rank: list[int] = [1] * len(points)
def find_parent(node: int) -> int:
	while node != parent[node]:
		# path compression
		parent[node] = parent[parent[node]]
		node = parent[node]
	return node

best_rank = 1
def union_components(n1: int, n2: int) -> bool:
	nonlocal best_rank

	p1, p2 = find_parent(n1), find_parent(n2)
	if p1 == p2:
		return False
	
	# get the ranks
	r1, r2 = rank[n1], rank[n2]
	if r1 >= r2:
		# put r2 under r1
		parent[p2] = p1
		rank[p1] += rank[p2]
		best_rank = rank[p1] if rank[p1] > best_rank else best_rank
	elif r2 > r1:
		parent[p1] = p2
		rank[p2] += rank[p1]
		best_rank = rank[p2] if rank[p2] > best_rank else best_rank

	return True

### Greedy Connect Until Max Rank Achieved
min_cost: int = 0
while(best_rank < len(points) and len(minheap) > 0):
	# get the connection from the minheap
	cost, n1, n2 = heapq.heappop(minheap)
	# print(cost, n1, n2, parent, rank, best_rank)

	if union_components(n1, n2):
		min_cost += cost
		# print(f"UPDATED: {min_cost}")

return min_cost if best_rank == len(points) else -1
```

### Why Does [[Greedy Algorithm|Greedy]] Work?
We need to use a [[Proof by Induction]]: Prove that for some state $t$, the cheapest edge which connects components will be part of the MST.

- We can split the two connected components using a "cut".
- The cheapest edge that we found crosses the cut.
- The cheapest edge that we found is the cheapest way to cross the cut.
	- If there was a cheaper edge, we would have cleared it already since going from cheap to expensive.
- This property is known as the "cut property".

How do we know that we are on the right track? [[Proof by Contradiction]].
- Suppose we were on the wrong track, i.e., a different set of edges is actually better for the MST.
- This means that in the MST solution there was some other edge that crossed our "cut".
- Once we add our cheapest edge, it creates at least two ways to cross the cut.
	- One from the pre-existing "correct" solution
	- One from the cheapest edge that crosses the cut.
	- This creates a graph cycle!
- We can instead remove the "correct" solution edge from the MST.
	- The town is still connected!
	- Our selected cheapest edge must have been cheaper (by definition)
	- This means that the "correct" solution edge CANNOT have been the minimum cost for the tree.
	- This is a contradiction. Thus, our cheapest edge must be part of the MST.

Wrap it up!
- We have shown that for any state $t$, adding the cheapest edge that connects two components together will add an edge from the MST.
- This is true for all states. 
- Thus, using proof by contradiction, this must create the MST.

### Alternatives:
- [[Primm's Algorithm]]: Is faster for densely connected graphs. Not as easy to parallelize. Harder to use when getting multiple MSTs at once.

---
# Examples:
- [[Leetcode 1584 Min Cost to Connect All Points]]

----
# Source:
[How do you calculate a Minimum Spanning Tree](https://www.youtube.com/watch?v=Yldkh0aOEcg)