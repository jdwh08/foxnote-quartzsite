---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/tree/binary
edited: 2025-07-30T19:21
created: 2025-07-23T18:42:00
---
# Problem:
Given a [[Binary Tree]] `root`, a node _X_ in the tree is named **good** if in the path from root to _X_ there are no nodes with a value _greater than_ X.

Return the number of **good** nodes in the binary tree.

#### Bounds
- The number of nodes in the binary tree is in the range `[1, 10^5]`.
- Each node's value is between `[-10^4, 10^4]`.

#### Examples
**Input:** `root = [3,1,4,3,null,1,5]
**Output:** `4
**Explanation:** Nodes in blue are **good**.
Root Node (3) is always a good node.
Node 4 -> (3,4) is the maximum value in the path starting from the root.
Node 5 -> (3,4,5) is the maximum value in the path
Node 3 -> (3,1,3) is the maximum value in the path.

---
# Notes:
Microsoft's Most Asked Question of ... 2021. Oof this is out of date.

---
# Attempts:

##### Attempt 1
I read the question as the number of nodes greater than the root.

##### Attempt 2
[[Depth First Search|DFS]] [[Tree Traversal]]. We keep track of the maximum value as our "state", and check if the node is at least as big as the max val.

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
    def goodNodes(self, root: TreeNode) -> int:

        def num_good_nodes(node: TreeNode, maxval = -float("inf")) -> int:
            output = 0
            # base case
            if node is None:
                return 0

            # pre
            if node.val >= maxval:
                output += 1
                maxval = node.val

            # recur
            left = num_good_nodes(node.left, maxval)
            right = num_good_nodes(node.right, maxval)

            # post
            output += (left+right)

            # return
            return output

        return num_good_nodes(root)
```

----
# Source:
Source