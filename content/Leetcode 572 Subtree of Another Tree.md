---
aliases: 
tags:
  - cs/leetcode/easy
  - cs/dsa/tree/binary
edited: 2025-07-30T17:15
created: 2025-07-23T18:42:00
---
# Problem:
Given the roots of two binary trees `root` and `subRoot`, return `true` if there is a subtree of `root` with the same structure and node values of `subRoot` and `false` otherwise.

A subtree of a binary tree `tree` is a tree that consists of a node in `tree` and all of this node's descendants. The tree `tree` could also be considered as a subtree of itself.

#### Bounds
- The number of nodes in the `root` tree is in the range `[1, 2000]`.
- The number of nodes in the `subRoot` tree is in the range `[1, 1000]`.
- `-10^4 <= root.val <= 10^4`
- `-10^4 <= subRoot.val <= 10^4`

#### Examples
**Input:** `root = [3,4,5,1,2], subRoot = [4,1,2]`
**Output:** true

**Input:** `root = [3,4,5,1,2,null,null,null,null,0], subRoot = [4,1,2]`
**Output:** false

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
Pretty straightforward, I redid the [[Depth First Search|DFS]] solution for [[Tree Traversal]] as in [[Leetcode 100 Same Binary Tree]].
- Add another function to run for each node in the main tree.
- Don't forget to check the case where the main is None!

---
# Solution:

```python
class Solution:  

    def isSubtree(self, root: Optional[TreeNode], subRoot: Optional[TreeNode]) -> bool:

        def is_same_tree(t1, t2) -> bool:
            # base case
            if t1 is None and t2 is None:
                return True
            if t1 is None and t2 is not None:
                return False
            if t1 is not None and t2 is None:
                return False
            if t1.val != t2.val:
                return False

            # Recursion
            # pre
            # recur
            left = is_same_tree(t1.left, t2.left)
            right = is_same_tree(t1.right, t2.right)
            # post
            same_tree = left and right
            # return
            return same_tree

        def check_subtree(main, msub) -> bool:
            # base case
            if is_same_tree(main, msub):
                return True
            if main is None and msub is not None:
	            # I forgot this base case.
                return False
            # recursion
            # pre
            # recur
            left = check_subtree(main.left, msub)
            if left:
                return True
            right = check_subtree(main.right, msub)
            if right:
                return True
            # post
            # return
            return False

        return check_subtree(root, subRoot)
```

----
# Source:
Source