---
aliases: 
tags:
  - cs/dsa/graph/path/bellman
edited: 2025-08-16T20:59
created: 2024-03-19T22:06
---
# Definition:
Given a [[Graph]], finds the shortest path between any two nodes.

---
# Notes:

### Handling Negative Cycles
Bellman Ford is able to handle negative weights in a graph which would mess up [[Dijkstra's Algorithm]]. 

There are two types: negative self-loops and negative cycles.
- Negative self-loops can be reached with negative inf.
- Negative cycles have a total cycle cost below zero.

We can loop through these infinitely to obtain an arbitrarily small score.
This also means that all nodes reachable from the negative cycle can also have an arbitrarily small score.

### Algorithm

#### Standard
1. Get edges, nodes, start node.
2. Create [[Array]] that tracks the best distance from the starting node to each node.
	1. Set every distance to inf
	2. Set distance to starting node to zero.
3. Update ("relax") each edge $V-1$ times:
	1. For some node $V$, loop over all edges going to this node.
	2. Calculate distance as dist going to node + edge weight
	3. Update distance if it is smaller.
4. To detect negative cycles, we run step 3 again.
	1. If we see that the node value keeps declining (shouldn't be possible), that means we have had a negative cycle.
	2. We update these values to be negative infinity.

We need to do this $V-1$ times because each loop we "propagate" values forward, and we need this to propagate to all nodes.

```python
def bellmanford(graph, n: int, src: int, dst: int) -> float:
	# graph is an adjlist with 0:n-1 and (weight, node) vals
	INF = float("inf")

	best_dist_to_node: list[float] = [INF] * n
	best_dist_to_node[src] = 0  # we are here already

	# do the first bellman ford
	for _ in range(n-1):
		updated: bool = False
		new_best_dists: list[float] = best_dist_to_node.copy()
		for node_src in graph:
			for weight, node_dst in graph.get(node_src, []):
				if node_dst == INF:
					# unreachable
					continue
				newdist = best_dist_to_node[node_src] + weight
				if newdist < best_dist_to_node[node_dst]:
					new_best_dists[node_dst] = newdist
					updated = True
		# check if no changes during pass
		if not updated:
			break
		else:
			best_dist_to_node = new_best_dists

	# do the negative weight cycle check
	neg_cycle_reachable = deque()
	seen: set[int] = set()
	for node_src in graph:
		for weight, node_dst in graph.get(node_src, []):
			if best_dist_to_node[node_src] == INF:
				continue
			if node_dst in seen:
				continue
			newdist = best_dist_to_node[node_src] + weight
			if newdist < best_dist_to_node[node_dst]:
				# we have a negative cycle!
				# add this to the list
				neg_cycle_reachable.append(node_dst)
				seen.add(node_dst)

	# use BFS*/DFS to propagate values to negative infinity
	while len(neg_cycle_reachable) > 0:
		node = neg_cycle_reachable.popleft()
		best_dist_to_node[node] = -INF

		neighbours = graph.get(node, [])
		for _, neighbour in neighbours:
			if neighbour in seen:
				continue
			neg_cycle_reachable.append(neighbour)

	return best_dist_to_node[dst]
```

#### Shortest Path Faster
An improvement on the classic Bellman-Ford which more smartly loops through values by using a queue for [[Breadth First Search|BFS]].

```python
def shortestpathfaster(graph, n: int, src: int, dst: int) -> float:
	# graph is an adjlist with 0:n-1 and (weight, node) vals
	INF = float("inf")

	best_dist_to_node: list[float] = [INF] * n
	best_dist_to_node[src] = 0.0  # we are here already

	update_count: list[int] = [0] * n  # tracks cycles

	q = deque()
	seen_in_queue: set[int] = set()  # prevents adding duplicates
	neg_cycle_reachable = deque()

	q.append(src)
	while len(q) > 0:
		node = q.popleft()
		seen_in_queue.remove(node)

		neighbours = graph.get(node, [])
		for weight, neighbour in neighbours:
			if best_dist_to_node[neighbour] == INF:
				continue

			newdist = best_dist_to_node[node] + weight
			if newdist < best_dist_to_node[neighbour]:
				best_dist_to_node[neighbour] = newdist
				update_count[neighbour] += 1
				# check negative cycles
				if update_count[neighbour] >= n:
					best_dist_to_node[neighbour] = -INF
					neg_cycle_reachable.append(node_dst)

				if neighbour not seen_in_queue:
					q.append((newdist, neighbour))
					seen_in_queue.add(neighbour)

	# use BFS*/DFS to propagate values to negative infinity
	while len(neg_cycle_reachable) > 0:
		node = neg_cycle_reachable.popleft()
		best_dist_to_node[node] = -INF

		neighbours = graph.get(node, [])
		for _, neighbour in neighbours:
			if neighbour in seen:
				continue
			neg_cycle_reachable.append(neighbour)

	return best_dist_to_node[dst]
```

### [[Big O]]
- $O(EV)$ for the traditional Bellman Ford

### Comparison to Other Shortest Path Algorithms
- [[Dijkstra's Algorithm]]: 
	- Bellman Ford has a slower time complexity ($EV$ vs ($E+V log(V)$)
	- However, Bellman Ford works when we have NEGATIVE VALUES and NEGATIVE CYCLES!

---
# Examples:
Examples

----
# Source:
Source