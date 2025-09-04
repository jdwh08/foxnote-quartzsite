---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/tree/binary
edited: 2025-07-30T17:59
created: 2025-07-23T18:42:00
---
# Problem:
Given the `root` of a [[Binary Tree]], return _the level order traversal of its nodes' values_. (i.e., from left to right, level by level).

#### Bounds
- The number of nodes in the tree is in the range `[0, 2000]`.
- `-1000 <= Node.val <= 1000`

#### Examples
**Input:** `root = [3,9,20,null,null,15,7]
**Output:** `[[3],[9,20],[15,7]]

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
Use a basic [[Tree Traversal#Tree Level Traversal]]

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
    def levelOrder(self, root: Optional[TreeNode]) -> List[List[int]]:
        # BFS
        # queuuququququu
        q = deque()
        q.append((root, 0))
        output: list[list[int]] = []
        while len(q) > 0:
            node, level = q.popleft()
            if node is None:
                continue

            if level >= len(output):
                output.append([node.val])
            else:
                output[level].append(node.val)

            # add next stuff to queueuquu
            q.append((node.left, level+1))
            q.append((node.right, level+1))
        return output
```

What I didn't think about was that actually a DFS solution can work too!
- Left -> Right still ensures that when appending to a level the order is okay.

----
# Source:
Source