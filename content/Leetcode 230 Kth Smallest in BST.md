---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/tree/binary
edited: 2025-07-31T07:54
created: 2025-07-23T18:42:00
---
# Problem:
Given the `root` of a binary search tree, and an integer `k`, return _the_ `kth` _smallest value (**1-indexed**) of all the values of the nodes in the tree_.

**Follow up:** If the BST is modified often (i.e., we can do insert and delete operations) and you need to find the kth smallest frequently, how would you optimize?
#### Bounds
- The number of nodes in the tree is `n`.
- `1 <= k <= n <= 10^4`
- `0 <= Node.val <= 10^4`

#### Examples
**Input:** `root = [3,1,4,null,2], k = 1
**Output:** 1

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
I can't really see any better way than just doing an [[Tree Traversal#In-Order Traversal]] and saving the values into an array before getting the kth.

##### Attempt 2
Ah, so we can count the number of times we go LEFT as the number of times we go "smaller".

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
    def kthSmallest(self, root: Optional[TreeNode], k: int) -> int:
        vals: list[int] = []

        def dfs(node: TreeNode | None = None) -> None:
            # base case
            if node is None:
                return
            # pre
            # recur
            dfs(node.left)
            vals.append(node.val)
            dfs(node.right)
            # post
            # return

        dfs(root)
        return vals[k-1]
```

```python
class Solution:
    def kthSmallest(self, root: Optional[TreeNode], k: int) -> int:
        kval = k
        output = -1

        def dfs(node: TreeNode | None = None) -> None:
            nonlocal kval, output
            # base case
            if node is None:
                return
            # pre
            # recur
            dfs(node.left)
            kval -= 1
            if kval == 0:
                output = node.val
                return
            dfs(node.right)
            # post
            # return

        dfs(root)
        return output
```

----
# Source:
https://leetcode.com/problems/kth-smallest-element-in-a-bst/