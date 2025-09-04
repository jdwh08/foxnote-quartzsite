---
aliases:
  - DFS
tags:
  - cs/dsa/dfs
edited: 2025-08-11T20:16
created: 2024-03-19T22:06
---
# Definition:
A type of [[Search]] which goes down one path as far as possible before exploring other paths.

Typically uses a [[Stack]] to handle values.
Compare to [[Breadth First Search]].

---
# Notes:

### Depth First Search for a [[Tree]]
- [[Tree Traversal#Pre-Order Traversal]]
- [[Tree Traversal#In-Order Traversal]]
- [[Tree Traversal#Post-Order Traversal]]

### Depth First Search for a [[Graph]]
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

---
# Examples:

- [[Tree Traversal]]

----
# Source:
The Last Algorithms Course