---
aliases: 
tags:
  - cs/leetcode/easy
  - cs/dsa/tree/binary
edited: 2025-07-30T17:32
created: 2025-07-23T18:42:00
---
# Problem:
Given a [[Binary Tree]], determine if it is height balanced.

#### Bounds
- The number of nodes in the tree is in the range `[0, 5000]`.
- `-10^4 <= Node.val <= 10^4`

#### Examples
root = `[1,2,2,3,3,null,null,4,4]`
This is a spindly thing where 1 -> 2, 2 and 2 -> 3,3 and 3 -> 4,4 on the left side.
`False`

---
# Notes:
[[Tree Traversal]] with [[Depth First Search|DFS]] again due to checking for heights.

---
# Attempts:

##### Attempt 1
Same problem as in [[Leetcode 543 Diameter of a Binary Tree]] where I have a [[Tree Traversal]] problem, and my target (is balanced) depends on something I need to track (the heights).

Thus we use the same template solution. It's not actually required though.

---
# Solution:

```python
class Solution:

    def isBalanced(self, root: Optional[TreeNode]) -> bool:
        # balanced if left and right subtrees differ in height by at most 1
        is_balanced: bool = True

        def get_tree_height(node: TreeNode | None, cur_height: int = 0) -> int:

            # returns the height of tree
            nonlocal is_balanced

            # base case
            if node is None:
                return 0

            if not is_balanced:
                return 0

            # pre
            # recursion
            left_height = get_tree_height(node.left, cur_height)
            right_height = get_tree_height(node.right, cur_height)
            # post
            if abs(left_height - right_height) > 1:
                is_balanced = False
                return 0

            cur_height += 1
            cur_height += max(left_height, right_height)
            return cur_height

        get_tree_height(root, 0)
        return is_balanced
```

Things I could do instead:
- You don't need a nonlocal is_balanced; you can just return -1 in those cases.
- You don't need to pass along cur_height.
- You can just return max(left, right)+1.

----
# Source:
Source