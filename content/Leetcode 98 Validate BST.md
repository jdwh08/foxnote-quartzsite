---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/tree/binary
edited: 2025-07-30T20:09
created: 2025-07-23T18:42:00
---
# Problem:
Given the `root` of a binary tree, _determine if it is a valid binary search tree (BST)_.

A **valid [[Binary Search Tree|BST]] is defined as follows:

- The left subtree contains only nodes with keys **strictly less than** the node's key.
- The right subtree contains only nodes with keys **strictly greater than** the node's key.
- Both the left and right subtrees must also be binary search trees.

#### Bounds
- The number of nodes in the tree is in the range `[1, 10^4]`.
- `-2^31 <= Node.val <= 2^31 - 1`

#### Examples
**Input:** root = `[5,1,4,null,null,3,6]
**Output:** false
**Explanation:** The root node's value is 5 but its right child's value is 4.

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
It's strictly greater for this problem on both sides.

Remember the bounds, you fool!
- BST needs to have node value less than parent if left, more than parent if right

TL;DR stop `blammo!` and pause to read out the question just in case.

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
    def isValidBST(self, root: Optional[TreeNode]) -> bool:
        def check_is_valid_bst(node: TreeNode | None, minval: int, maxval: int) -> bool:
            # base case
            if node is None:
                return True

            # RECURSION
            # pre
            if not (minval < node.val < maxval):
                return False
            # recur
            left = check_is_valid_bst(node.left, minval, node.val)
            right = check_is_valid_bst(node.right, node.val, maxval)
            # post
            output = left & right
            # return
            return output

        return check_is_valid_bst(root, -float("inf"), float("inf"))
```

----
# Source:
Source