---
aliases: 
tags:
  - cs/leetcode/easy
  - cs/dsa/tree/binary
edited: 2025-07-27T18:59
created: 2025-07-23T18:42:00
---
# Problem:
Given the `root` of a [[Binary Tree]], invert the tree, and return _its root_.

#### Bounds
- The number of nodes in the tree is in the range `[0, 100]`.
- `-100 <= Node.val <= 100`

#### Examples
`root = [4,2,7,1,3,6,9]`
**Output:** `[4,7,2,9,6,3,1]`

I.e., if we have 2<- 4 ->7 as our tree, we want to swap it so that 7 <- 4 -> 2.

---
# Notes:
This is basically just a [[Tree Traversal]] problem.

Obviously we need the tree structure, we can just flip left and right.

---
# Attempts:

##### Attempt 1
Yeah. I over thought this.

---
# Solution:

```python
class Solution:

    def invertTree(self, root: Optional[TreeNode]) -> Optional[TreeNode]:
        def flip_nodes(node: TreeNode | None) -> TreeNode:
        	# base case
            if node is None:
                return None
            if node.left is None and node.right is None:
                return node

            # pre
            # recurse
            left = flip_nodes(node.left)
            right = flip_nodes(node.right)
            # post
            node.left = right
            node.right = left
            return node

        return flip_nodes(root)
```

While this was natural to code, note you don't need a couple things:
1. The check for if node left and right is None (handled by recursion)
2. You can actually assign left and right before calling recursion
3. You don't need a separate recursion function, you can just use invertTree.

----
# Source:
https://leetcode.com/problems/invert-binary-tree/description/