---
aliases: 
tags:
  - cs/leetcode/easy
  - cs/dsa/tree/binary
edited: 2025-07-30T17:32
created: 2025-07-23T18:42:00
---
# Problem:
You are given two [[Binary Tree]]. Determine whether they are equal in both shape and structure.

#### Bounds
NA

#### Examples
NA

---
# Notes:
This is a [[Tree Traversal]] problem.

Note that [[Breadth First Search|BFS]] with [[Tree Traversal#Tree Level Traversal]] completely destroys the tree order.
Instead, we should use [[Depth First Search|DFS]].

---
# Attempts:

##### Attempt 1
Primagen.

##### Attempt 2
Hey wait a minute, I did this myself!

---
# Solution:

```TypeScript
export default function compare(a: BinaryNode<number> | null, b: BinaryNode<number> | null): bool {
	// base case(s)
	if (a === null && b === null) {
		return true;
	}
	if (a === null || b === null) {
		return false;
	}
	if (a.value !== b.value) {
		return false;
	}

	// setup
	// recursion
	left_same = compare(a.left, b.left);
	right_same = compare(a.right, b.right);
	// post
	return left_same && right_same;
}
```

```python
class Solution:

    def isSameTree(self, p: Optional[TreeNode], q: Optional[TreeNode]) -> bool:

        def is_same(a: TreeNode | None, b: TreeNode | None) -> bool:

            # Base Case
            if a is None and b is None:
                return True
            if (a is None and b is not None) or (a is not None and b is None):
                return False
            if a.val != b.val:
                return False

            # Recursion
            # pre
            # recur
            left = is_same(a.left, b.left)
            right = is_same(a.right, b.right)
            # post
            both_same = left & right

            # return
            return both_same

        return is_same(p, q)
```

----
# Source:
Primagen during Interviews circa 2010. He'd probably not ask it anymore though.