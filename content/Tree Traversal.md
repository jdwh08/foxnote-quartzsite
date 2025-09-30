---
aliases: 
tags:
  - cs/dsa/tree
edited: 2025-07-31T17:07
created: 2024-03-19T22:06
---
# Definition:

Methods of going through a tree using [[Recursion]]

![[Tree Traversal.excalidraw.png.png]]

---
# Notes:

#### Pre-Order Traversal:
1. Visit the node
2. Visit the left
3. Visit the right

This is [[Depth First Search|DFS]] using [[Recursion]] and the [[Stack]].

```typescript
// add node values to array called path
// pre-order traversal
function walk(
	curr: BinaryNode<number> | null,
	path: number[]
): number[] {
	// base case
	if (!curr) {
		return path;
	}

	// pre
	path.push(curr.value);

	// recurse
	walk(curr.left, path);
	walk(curr.right, path);

	// post
	return path;
}
```

#### In-Order Traversal:
1. Visit the left
2. Visit the node
3. Visit the right

This is [[Depth First Search|DFS]] using [[Recursion]] and the [[Stack]].

```typescript
// add node values to array called path
// pre-order traversal
function walk(
	curr: BinaryNode<number> | null,
	path: number[]
): number[] {
	// base case
	if (!curr) {
		return path;
	}

	// pre

	// recurse
	walk(curr.left, path);
	path.push(curr.value);
	walk(curr.right, path);

	// post
	return path;
}
```

#### Post-Order Traversal:
1. Visit the left
2. Visit the right
3. Visit the node

This is [[Depth First Search|DFS]] using [[Recursion]] and the [[Stack]].
- Used for freeing memory.

```typescript
// add node values to array called path
// pre-order traversal
function walk(
	curr: BinaryNode<number> | null,
	path: number[]
): number[] {
	// base case
	if (!curr) {
		return path;
	}

	// pre

	// recurse
	walk(curr.left, path);
	walk(curr.right, path);

	// post
	path.push(curr.value);
	return path;
}
```

### Tree Level Traversal
1. While you have a queue:
	1. Get the next node from the queue
	2. Add the children to the queue

This is [[Breadth First Search|BFS]] using a [[Queue]]. See also [[Leetcode 102 Binary Tree Level Order]].
NOTE: This does NOT preserve tree structure (e.g., see [[Leetcode 100 Same Binary Tree]])

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

### [[Big O]]
- We must visit each node in the whole tree.
- As the tree grows by 1 node, we need to visit an additional node.
- $O(N)$ 

---
# Examples:



----
# Source:
The Last Algorithms Course