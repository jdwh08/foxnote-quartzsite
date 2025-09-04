---
aliases: 
tags:
  - cs/leetcode/easy
  - cs/dsa/tree/binary
edited: 2025-07-30T17:32
created: 2025-07-23T18:42:00
---
# Problem:
Given the `root` of a [[Binary Tree]], return _its maximum depth_ (aka Height).

A binary tree's **maximum depth** is the number of nodes along the longest path from the root node down to the farthest leaf node.

#### Bounds
- The number of nodes in the tree is in the range `[0, 10^4]`.
- `-100 <= Node.val <= 100`

#### Examples
`root = [3,9,20,null,null,15,7]`
**Output:** 3
Path: 3 -> 20 -> 15/7

---
# Notes:
This is yet again a simple [[Tree Traversal]] problem.

I kinda got inspired by DP in the sense that we have a value we need to keep track of (the height). No caching though so DP not legit.

---
# Attempts:

##### Attempt 1
We build a recursive DFS solution. I did [[Tree Traversal#Post-Order Traversal]], but we really could have done anything.
- Base case is no node
- We add 1 for the current node
- Recurrence relation "choice" is to go down the left or right node, and we determine via max.


---
# Solution:

```python
class Solution:

    def maxDepth(self, root: Optional[TreeNode]) -> int:
        def get_height(node: TreeNode | None, cur_height: int = 0) -> int:
            # base case
            if node is None:
                return cur_height

            # pre-recursion
            # recursion
            left_height = get_height(node.left, cur_height)
            right_height = get_height(node.right, cur_height)

            # post-recursion
            cur_height += 1  # current node
            cur_height += max(left_height, right_height)

            # return
            return cur_height

        return get_height(root, 0)
```

----
# Source:
Source