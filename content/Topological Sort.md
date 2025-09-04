---
aliases:
  - Kahn's Algorithm
tags:
  - cs/dsa/graph/dag/toposort
edited: 2025-08-16T16:12
created: 2024-03-19T22:06
---
# Definition:
Given a directed [[Graph]], determine the order of traversing all the nodes based on the directed node.

---
# Notes:

### Formal Definition
A topological ordering is an ordering of nodes in a directed graph where for each edge from $A \rightarrow B$, $A$ appears before $B$ in the ordering.

There can be multiple topological orderings per graph.

### Graph Requirements
1. Directed: There must be a direction for node edges.
2. Acyclic: The graph cannot have cycles. Otherwise, we'd never be able to escape the cycle.
	1. We can use [[Strongly Connected Components]] (e.g., [[Tarjan's Algorithm]]) to do this.

### Kahn's Algorithm
#### Intuition
1. Traverse the graph using [[Breadth First Search|BFS]]
2. If a node has no dependencies, remove it from the graph and add it to the ordering.
	1. This allows other nodes to have fewer dependencies
3. Repeat until either a cycle is encountered OR all nodes are added to the ordering.

#### Requirements
We need to keep track of the following:
1. Node degree for each node in an [[Array]].
2. A [[Queue]] of nodes which have degree zero.
	1. Start by adding nodes with degree zero to queue.
3. Pop from queue and add to ordering.
4. Remove degree of nodes which depend on the node.
5. Add any new nodes with degree zero to the queue.
6. Repeat

```python
def kahnsalgo(graph) -> list[int] | None:
	n = len(graph)

	# count node degrees
	in_degree = [0] * n
	for idx in range(0, n):
		for neighbour_idx in graph[idx]:
			in_degree[neighbour_idx] += 1

	# populate the queue with zero-degree nodes
	q = deque()
	for idx in range(0, n):
		if (in_degree[idx] == 0):
			q.append(idx)

	idx = 0  # index
	ordering = [0] * n  # topo order
	while len(q) > 0:
		nde = q.popleft()
		index += 1
		ordering[index] = nde
		# reduce neighbour degrees
		for neighbour_idx in graph[nde]:  # O(E_n) over all N
			in_degree[neighbour_idx] -= 1
			if in_degree[neighbour_idx] == 0:
				q.append(neighbour_idx)

	if index != n:
		return None  # we didn't get all nodes
	return ordering
```

Note that technically this implementation is actually a [[Breadth First Search#Multi Source BFS|Multi Source BFS]].

#### [[Big O]]
We go through each node. In each node, we go through each edge. Thus, $O(|E|+|V|)$

### DFS Approach
1. Make a "seen" set.
	1. There are two types of "seen" values: seen AND in the current path (TRUE) and seen but not in current path (FALSE).
	2. This distinction is important because if we re-visit a value that is both seen AND in current path, then we 
2. Use DFS with POST ORDER traversal
	1. Post Order ensures that we go down all paths before adding the node to our topo path. This guarantees that the results get added once everything else has been traversed, i.e., a "leaf".
	2. We continue going back up with post order. This results in the values being in reverse order.
3. We reverse the list.

```python
def dfs_topo(graph) -> list[int] | None:
	visited: dict[int, bool] = {}  # true for current path cycle
	output: list[int] = []

	def dfs(node: int) -> bool:
		if node in visited:
			return visited[node]

		# add to path
		visited[node] = True
		for neighbour in graph.get(node, []):
			has_cycle = dfs(neighbour)
			if has_cycle:
				return has_cycle

		# backtrack from path
		visited[node] = False  # we're done handling all dependencies
		output.append(node)

	for node in graph:
		has_cycle = dfs(node)
		if has_cycle:
			return None

	output.reverse()  # DFS appends nodes in opposite order of traversal
	return output
```

---
# Examples:
- Dependencies:
	- [[Leetcode 210 Course Schedule II]]
	- Program Building

----
# Source:
https://www.youtube.com/watch?v=cIBFEhD77b4