---
aliases:
tags:
  - cs/dsa/graph
edited: 2025-09-30T21:59
created: 2024-03-19T22:06
---
# Definition:
A [[Data Structures and Algorithms|Data Structure]] which consists of some nodes (vertex) and links (edges) between them.

This is the "most generic" of all data structures.

---
# Notes:

### Terminology
- **Cycle**: A loop between graph nodes
- **Directed Graph**: A graph where edges have a specific route from a node to a node.
- **[[Directed Acyclic Graph]] (DAG)**: A graph which is both directed and has no cycles.

- **Weighted Graph**: A graph where each edge has a specific number associated with it (e.g., a cost)

- **Fully Connected**: A graph where all nodes can go to all other nodes
- **Connected Component**: A set of node(s) which are connected to each other by edges. 
	- **Strongly Connected Component**: #todo 

- **Path**: An ordered walk through the nodes from edge to edge.
	- **Euler Path**: A path that goes through every edge exactly once.

### Implementation Types

![[Graph Example.png]]
#### Adjacency List
- This is the most common
- We have a list of all nodes, and then a list of the nodes with connections.

```python
def convert_edges_into_adjlist_graph(
	n: int,
	weighted_edges: list[list[int]]
) -> dict[int, set[tuple[int, int]]]:
	# build the graph
	graph: dict[int, set[tuple[int, int]]] = {
		node: set()
		for node in range(0, n)
	}

	for source, target, weight in weighted_edges:
		graph[source].add((target, weight))

	return graph
```

#### Adjacency Matrix
- This is less common due to larger memory requirements $O(v^2)$
- We have a matrix of all nodes and their weight.

### Graph Search
- Graph searches work the same with BFS/DFS since trees are graphs.
- HOWEVER, we also need to have a "seen"

##### [[Breadth First Search]]
BFS on a Weighted Adjacency Matrix
```TypeScript
export default fucntion bfs(
	graph: WeightedAdjacencyMatrix,
	source: number,
	needle: number
): number[] | null {
	// Given a graph as Matrix, find the path from source to needle.
	const q: number[] = [source];  // BFS still uses queue

	// Keep track of two things:
		// PREV: what's the previous node?
		// SEEN: have I seen this node?
	const seen = new Array(graph.length).fill(false);
	const prev = new Array(graph.length).fill(-1);
	seen[source] = true;

	do {
		curr = q.shift();  /// array as queue bc lazy, should be LL

		// base case
		if cur === needle {
			break;
		}

		const adjs = graph[curr];
		for (let i = 0; i < adjs.length; ++i) {
			if (adjs[i] === 0) {
				continue;  // no edge, most common case
			}

			if (seen[i]) {
				continue;  // already processed
			}
			seen[i] = true;
			prev[i] = curr;  // path
			q.push(i);
		}
	} while (q.length);

	// traverse backwards to get final path
	if (prev[needle] === -1) {
		return null;  // no path
	}

	let curr = needle;
	const out: number[] = [];
	// go through path until you find needle or no more path
	while (prev[curr] !== -1) {
		out.push(curr);
		cur = prev[curr];
	}
	return (
		[source].concat(  // prev-1 break is missing head node
			out.reverse()  // undo the backwardsness
		)
	);
}
```

##### [[Depth First Search]]
```TypeScript
function walk(
	graph: WeightedAdjacencyList,
	curr: number,
	needle: number,
	seen: boolean[],
	path: number[]
): boolean {
	if (seen[curr]) {
		return false;
	}
	path.push(curr);
	if (curr === needle) {
		return true;
	}

	// RECUR
	// pre
	seen[curr] = true;
	// recur
	const edges = graph[curr];
	for (let i  = 0; i < list.length; ++i) { // for so we can break
		const edge = list[i];
		if (walk(graph, edge.to, needle, seen, path)) {
			return true;
		}
	}
	// post
	path.pop();
	// return
	return false;
}

export default fucntion dfs(
	graph: WeightedAdjacencyMatrix,
	source: number,
	needle: number
): number[] | null {
	const seen: boolean[] = new Array(graph.length).fill(false);
	const path: number[] = [];

	walk(graph, source, needle, seen, path);
	if (path.length === 0) {
		return null;
	}
	return path;
}
```

NOTE: This is pretty similar to [[Recursion#Maze Solver]].

##### [[Big O]] Runtimes
We visit every single node once, and check every edge from each node: $O(V+E)$.

### Shortest Path
To get the shortest path between all nodes in a graph, we use [[Dijkstra's Algorithm]] or [[Bellman-Ford Algorithm]]

### Min/Max Close


### Connected Components
You can use a typical [[Breadth First Search|BFS]] or [[Depth First Search|DFS]] to find this, or alternatively [[Union Find]].

### Strongly Connected Components

### [[Topological Sort]]
To get a ordering of things to do in a DAG, we can use [[Topological Sort|Kahn's Algorithm]] for topological sort.

---
# Examples:

Seven Bridges of Köningsburg, etc.

----
# Source:
The Last Algorithms Course