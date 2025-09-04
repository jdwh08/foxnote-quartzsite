---
aliases: 
tags:
  - cs/dsa/greedy
  - cs/dsa/graph/path/dijkstra
edited: 2025-08-16T19:41
created: 2024-03-19T22:06
---
# Definition:
Given a [[Graph]], finds the shortest path between any two nodes.

![[Dijkstras Algorithm.excalidraw.png.png]]

---
# Notes:
- It's a [[Greedy Algorithm]].
- It's similar to [[Primm's Algorithm]] for finding minimum spanning trees in a graph.
- **It doesn't work for negative weights!**
	- Suppose we have a graph with a cycle whose total cycle value is negative.
	- Then, under Dijkstra's we would loop through negative cycles forever...

### Algorithm
1. Get the node with the lowest known distance
2. Get the edges of the node
3. Calculate distance as dist to lowest node + edge weight
4. Update distance if smaller

Because we keep getting the shortest distance node(s), this is [[Greedy Algorithm]].

#### Code
```TypeScript
function has_unvisited(seen: boolean[], dists: number[]): boolean {
	for (let i = 0; i < seen.length; ++i) {
		// not seen AND connection exists (i.e., dist < infty)
		if (!seen[i] && dists[i] < Infinity) {
			return true;
		}
	}
	return false;

	// fancy version
	// return seen.some((s, i) => !s && dists[i] < Infinity)l
}

function get_lowest_unvisited(
	seen: boolean[], dists: number[]
): number {
	let idx = -1;
	let lowest_dist = Infinity;

	for (let i = 0; i < seen.length; ++i) {
		if (seen[i]) {
			continue;
		}

		if (lowest_dist > dists[i]) {
			lowest_dist = dists[i];
			idx = i;
		}
	}
	return idx;
}

export default function dijkstra_list(
	source: number,
	sink: number,
	arr: WeightedAdjacencyList
): number[] {

	const seen = new Array(arr.length).fill(false);
	const prev = new Array(arr.length).fill(-1);
	const dist = new Array(arr.length).fill(Infinity);
	dists[source] = 0;

	while (has_unvisited(seen, dists)) {
		const curr = get_lowest_unvisited(seen, dists);
		seen[curr] = true;

		// get edges
		const edges = arr[curr];
		// go through edges
		for (let i = 0; i < edges.length; ++i) {
			const edge = edges[i];
			if (seen[edge.to]) {
				continue;
			}
			// distance from start to node is prev dist + weight
			const dist = dists[curr] + edge.weight;
			if (dist < dists[edge.to]) {
				dists[edge.to] = dist;
				prev[edge.to] = curr;
			}
		}
	}

	// walk backwards from goal to start
	const out: number[] = [];
	let curr = sink;

	while (prev[curr] !== -1) {
		out.push(curr);
		curr = prev[curr];
	}
	// add the source (doesn't get added since prev is -1)
	out.push(source);
	return out.reverse();
}
```

```python
def dijkstra(
	graph: dict[int, set[tuple[int, int]]],  # weighted adjlist
	startnode: int
) -> dict[int, int]:
	seen: set[int] = set()
	output: dict[int, int] = defaultdict(
		lambda: float("inf")
	)
	minheap = [(startnode, 0)]  # minheap brings cost down to logn
	heapq.heapify(minheap)

	while len(minheap) > 0:
		dist, node = heapq.heappop(minheap)
		if node in seen:
			continue

		seen.add(node)
		neighbours = graph.get(node, set()):
		for neighbour, edgeweight in neighbours:
			totdist = dist + edgeweight
			if totdist < output[node]:
				output[node] = totdist

			if neighbour not in seen:
				seen.add(neighbour)

	return output
```

### [[Big O]] Runtime
#### Original: $O(V^2 + E)$

This is annoyingly complicated.
- Creating the prev, seen, dists arrays are all $O(V)$.
- We have to go through every node in worst case $O(V)$.
	- We loop through the edges.
	- In that loop, we call `has_unvisited` and `get_lowest`
	- `has_unvisited` has to loop through the array $O(V)$
	- `get_lowest` has to loop through the array $O(V)$
	- WEIRD NOTE: Despite looping over edges, we actually loop through edges connected to the node at each node. The adjacency list is **sparse**.
		- Once we've seen a node, we never look at the edges going from that node again!
		- This means that we see each edge twice: once from the first node, and once from the second node.
		- Hence, this is $O(E)$ instead of $O(V*E)$.
- Thus, each loop has cost of $O(V^2 + E)$.

#### Improved with MinHeap: $O(V\log(V)+E)$
- Note that we are always trying to find the **lowest** distance value.
- This is a perfect tool for a [[Heap|Min Heap]]! Allowing us to add and remove with $O(\log V)$ at worst.

### Comparison to Other Algorithms
- [[Bellman-Ford Algorithm]]: 
	- Dijkstra's is much faster $O(V \log V + E)$ vs $O(EV)$. 
	- However, Dijkstra's can't handle negative edge weights.

---
# Examples:
Examples

----
# Source:
The Last Algorithms Course