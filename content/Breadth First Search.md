---
aliases:
  - BFS
tags:
  - cs/dsa/bfs
edited: 2025-08-11T20:21
created: 2024-03-19T22:06
---
# Definition:
A type of [[Search]] which looks at all possible options before going deeper.

Typically uses a [[Queue]] to handle ordering.
Compare to [[Depth First Search]].

---
# Notes:

### Pseudocode for a [[Tree]]
1. While you have a queue:
	1. Get the next node from the queue
	2. Add the children to the queue

```TypeScript
export default function bfs(head: BinaryNode<number>, needle: number): boolean {
	const q: (BinaryNode<number> | null)[] = [head]; // we should use a real LL-based queue to avoid O(N) shift

	while (q.length) {
		const curr = q.shift() as BinaryNode<number>;  // O(N) arr copy
		if (!curr) {
			continue;
		}

		// search
		if (curr.value === needle) {
			return true;  // marginally better to not return from loop
		}

		// add to queue
		// none case is handled up front
		q.push(curr.left);
		q.push(curr.right);
	}

	return false;
}
```

### Pseudocode for a [[Graph#Breadth First Search]]:
This is similar to the code for a tree, except we also need to consider cycles.
1. Add a "seen" array for nodes which are seen.
2. Add a "prev" array to get the node's previous.

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

### Multi Source BFS
Sometimes, you might need to propagate out from multiple different sources at once.
- Closest distance to some set of starting locations
- [[Leetcode X Islands and Treasure]]

In this case, you'd want to do Multi-Source BFS.
1. Identify all the source(s).
2. Add the sources AT THE SAME TIME to the [[Queue]].
	1. This ensures we propagate at the same time.
3. Have an additional break condition which occurs when we hit an already-reached value.

---
# Examples:

----
# Source:
The Last Algorithms Course