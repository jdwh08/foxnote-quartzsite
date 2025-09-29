---
aliases:
tags:
  - cs/dsa/graph/mst/primm
  - cs/dsa/greedy
edited: 2025-09-27T20:51
created: 2024-03-19T22:06
---
# Definition:
A [[Greedy Algorithm]] to find the [[Minimum Spanning Tree]] of a [[Graph]].

---
# Notes:

### Lazy Version
1. Maintain a [[Heap|Min Heap]] for edge costs.
2. Start at a node $s$. Mark it as seen. Add it to the min heap.
3. While [[Heap|Min Heap]] is not empty AND tree edges < nodes-1:
	1. Get the cheapest edge and node from the min heap.
	2. If we have seen the node, skip. (It's redundant and would add a cycle.)
	3. Add the edge to our tree.
	4. For each neighbour in $s$
		1. Add it to the [[Heap|Min Heap]].

```python
def primmst(start_node: int) -> tuple[list[tuple[float, int, int]], float]:
	graph: list[list[int | None]]  # primm's is better for dense graph-matrix
	minheap: list[tuple[float, int, int]] = []

	mst: list[tuple[float, int, int]] = []
	cost = 0
	seen: set[int] = set()

	# populate the initial heap
	for neighbour, dist in graph[start_node]:
		if dist is None:
			continue
		heapq.heappush(minheap, (dist, start_node, neighbour))
	seen.add(start_node)

	while len(minheap) > 0 and len(mst) < len(graph)-1:
		dist, old_node, new_node = heapq.heappop(minheap)

		if new_node in seen:
			continue

		seen.add(new_node)
		mst.append((dist, old_node, new_node))
		cost += dist

		for neighbour, dist in graph[new_node]:
			if dist is None:
				continue
			heapq.heappush(minheap, (dist, new_node, neighbour))

	# return
	if len(mst) != len(graph)-1:
		# we didn't get to all nodes!
		return float("inf"), []
	return cost, mst
```

[[Big O]]: $O((|V| + |E|) \log |V|) = O(|E| \log |V|)$ in general with a adjlist. However, this particular one is using a adjmatrix.
- For our matrix scan, for each node $|V|$ we scan all other nodes $|V|$ which is thus $O(V^2)$.
- For our heap operations, our heap is invoked for each edge $E$ and costs $\log$ heap size to run, so $O(E \log H) = O(E \log V^2) = O(E \log V)$
- Thus, our big O for this particular implementation is $O(V^2 + E\log V)$
- If we use an adjacency list instead, we can get $O(E \log V)$ time (but may not be faster).

### Eager Version
We can improve on the [[Lazy Algorithm]] version by removing processing of edges which lead to already-connected nodes.

For any MST, each node has exactly ONE edge going out of the node (except start node).
Instead of adding edges to the [[Heap]], we update the neighbour's cheapest edge instead.

This might be done with a indexed heap. (mix a hash table and heap)

#todo: add implementation that makes sense to me.

---
# Examples:
- [[Leetcode 1584 Min Cost to Connect All Points]]

----
# Source:
https://www.youtube.com/watch?v=jsmMtJpPnhU
https://www.youtube.com/watch?v=xq3ABa-px_g