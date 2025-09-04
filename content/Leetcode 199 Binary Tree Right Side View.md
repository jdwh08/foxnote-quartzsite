---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/tree/binary
edited: 2025-07-30T18:13
created: 2025-07-23T18:42:00
---
# Problem:
You are given the `root` of a [[Binary Tree]]. Return only the values of the nodes that are visible from the right side of the tree, ordered from top to bottom.

#### Bounds
- `0 <= number of nodes in the tree <= 100`
- `-100 <= Node.val <= 100`

#### Examples
Input: `root = [1,2,3]
Output: `[1,3]

---
# Notes:
[[Tree Traversal]]. 

---
# Attempts:

##### Attempt 1
... why don't you just go to the right each time?

Oh. Right. Because sometimes the right node ends early leaving the "rightmost" value to be in the left side. That means we still need to do [[Tree Traversal]] on the entire tree.
##### Attempt 2
Okay we'll do [[Breadth First Search|BFS]] going from right to left since that seems most natural to me for a level-order traversal.

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
    def rightSideView(self, root: Optional[TreeNode]) -> List[int]:
        # level order traversal
        # but we go from right to left in each level
        # and skip level values if they are alreaady present in our output list
        q = deque()
        q.append((root, 0))
        output: list[int] = []

        while len(q) > 0:
            node, level = q.popleft()
            if not node:
                continue
            if level >= len(output):
                # we haven't seen this level yet!
                output.append(node.val)
            # standard BFS things
            q.append((node.right, level+1))
            q.append((node.left, level+1))

        return output
```

Technically you can also use DFS as well!
```python
class Solution:
    def rightSideView(self, root: Optional[TreeNode]) -> List[int]:
        res = []

        def dfs(node, depth):
            if not node:
                return None
            if depth == len(res):
                res.append(node.val)  # this ensures we only add right
            
            dfs(node.right, depth + 1)
            dfs(node.left, depth + 1)
        
        dfs(root, 0)
        return res
```

----
# Source:
Source