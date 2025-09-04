---
aliases: 
tags:
  - cs/leetcode/hard
  - cs/dsa/tree/binary
edited: 2025-07-31T18:14
created: 2025-07-23T18:42:00
---
# Problem:
Given the `root` of a _non-empty_ [[Binary Tree]], return the maximum **path sum** of any _non-empty_ path.

A **path** in a binary tree is a sequence of nodes where each pair of adjacent nodes has an edge connecting them. A node can _not_ appear in the sequence more than once. The path does _not_ necessarily need to include the root.

The **path sum** of a path is the sum of the node's values in the path.

#### Bounds
- `1 <= The number of nodes in the tree <= 1000`.
- `-1000 <= Node.val <= 1000`

#### Examples
Input: `root = [-15,10,20,null,null,15,5,-5]
Output: 40
- Take 15-20-5

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
I did not realize that negative numbers were required to take still so I had an option where we would check if all values were greater than 0 to "skip or take".

Also as this problem mirrors the [[Leetcode 543 Diameter of a Binary Tree]] problem, I need to remember that our value we use to check (current vals) is different from what we can return (best path).

##### Attempt 2
Modify the structure so starting values are -float("inf") to allow for taking negatives.

---
# Solution:

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right

class Solution:
    def maxPathSum(self, root: Optional[TreeNode]) -> int:
        max_path_sum = -float("inf")

        def get_path_sum(node: TreeNode | None) -> int | float:
            # base case
            if node is None:
                return -float("inf")

            nonlocal max_path_sum
            # RECURSION
            # pre
            # recur
            left = get_path_sum(node.left)
            right = get_path_sum(node.right)
            # post
            # a couple options:
            # 1) we only take the current node val
            # 2) we only take current + left
            # 3) we only take current + right
            # 4) we take current + left + right
            mps = max(
                node.val,
                node.val+left,
                node.val+right,
                node.val+left+right
            )

            # check if we have a NEW RECORD
            max_path_sum = mps if mps > max_path_sum else max_path_sum

            # return
            # must be one of the paths
            # we can't go down both left and right
            ret = max(
                node.val,
                node.val+left,
                node.val+right,
            )
            return ret

        get_path_sum(root)

  

        return max_path_sum
```

----
# Source:
Source