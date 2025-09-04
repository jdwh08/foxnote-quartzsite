---
aliases:
  - BST
tags:
  - cs/dsa/tree/binary
edited: 2025-07-27T16:16
created: 2024-03-19T22:06
---
# Definition:
A [[Binary Tree]] which follows the rule that LEFT $\le$ NODE < RIGHT.

---
# Notes:
This is quite similar to [[Quicksort]], where the node value acts like the pivot.
However, it's even easier!

#### Binary Tree Search
```TypeScript
function search(curr: BinaryNode<number> | null, needle: number): boolean {
	if (!curr) {
		return false;
	}
	if (curr.val === needle) {
		return true;
	}

	// recursion
	if (needle < curr.val) {
		return search(curr.left, needle);
	}
	return search(curr.right, needle);
}

export default function dfs(head: BinaryNode<number>, needle: number): boolean {
	return serach(head, needle);
}
```

#### Insertion
Note this is very naive because we aren't balancing the tree.

```psuedocode
insert(node, v):
	// note: we need a check for if the tree is empty.
	if node.val < v:
		insert(node.right, v);
	else if node.val >= v:
		insert(node.left, v);
```

#### Deletion
Cases
1. If the node is a leaf, then we can just delete it.
2. If the node has one child: we can remove the middle node. `parent.child = cur.child`
3. If the node has two children:
	1. Let's find the Max-Min, i.e., largest value in the left subtree (or Min-Max)
	2. This is guaranteed to fit the Binary Tree principle.
	3. It also has to be a leaf node (otherwise, it can't be the largest small or smallest large, as it would have a left or right).
	4. Replace the root node with this value.
	5. **Ideally, you pick this so that it balances the tree as best as possible.**

```psuedocode
delete(v):
```

### [[Big O]]:
- It's somewhere between $O(\log(N)), O(N))$, depending on how balanced your tree is.
	- More specifically, it's $O(h)$, where $h$ is the height of the tree.

At best, our tree is perfectly balanced and thus the height is $O(\log(N))$. However, we could have a terribly balanced tree like:
![[Imbalanced Binary Tree.excalidraw.png.png]]
E.g., try searching for 12 here!

Thus, we have a preference for trees which can balance themselves.

---
# Examples:

Self-balancing Trees:
- [[AVL Tree]]
- [[Red-Black Tree]]

----
# Source:
The Last Algorithms Course