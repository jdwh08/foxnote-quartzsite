---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/tree/binary
edited: 2025-07-30T17:55
created: 2025-07-23T18:42:00
---
# Problem:
Given a [[Binary Search Tree]] (BST), find the lowest common ancestor (LCA) node of two given nodes in the BST.

According to the [definition of LCA on Wikipedia](https://en.wikipedia.org/wiki/Lowest_common_ancestor): “The lowest common ancestor is defined between two nodes `p` and `q` as the lowest node in `T` that has both `p` and `q` as descendants (where we allow **a node to be a descendant of itself**).”

#### Bounds
- The number of nodes in the tree is in the range `[2, 10^5]`.
- `-10^9 <= Node.val <= 10^9`
- All `Node.val` are **unique**.
- `p != q`
- `p` and `q` will exist in the BST.

#### Examples
**Input:** `root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8`
**Output:** 6
**Explanation:** The LCA of nodes 2 and 8 is 6.

**Input:** `root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4`
**Output:** 2
**Explanation:** The LCA of nodes 2 and 4 is 2, since a node can be a descendant of itself according to the LCA definition.

---
# Notes:
Seems like a simple [[Tree Traversal]] problem except for [[Binary Search Tree]].
- We code up a basic function which finds a node value from the BST
- We keep track of the path to get there as two lists.
- We find the point where the two list values are the same, working from the end.
- We return this value.

---
# Attempts:

##### Attempt 1
Blammo!

---
# Solution:

```python
class Solution:

    def lowestCommonAncestor(self, root: TreeNode, p: TreeNode, q: TreeNode) -> TreeNode:
        # DFS if we're doing O(h) time
        p_path: list[TreeNode] = []
        q_path: list[TreeNode] = []

        def find_val_path(tgt: TreeNode) -> list[TreeNode]:
            cur = root
            output: list[TreeNode] = []

            while cur.val != tgt.val:
                output.append(cur)
                if tgt.val > cur.val:
                    cur = cur.right
                else:
                    cur = cur.left

            output.append(cur)
            return output

        p_path = find_val_path(p)
        q_path = find_val_path(q)

        p_ptr = len(p_path)-1
        q_ptr = len(q_path)-1

        while p_path[p_ptr].val != q_path[q_ptr].val:
            if p_ptr > q_ptr:
                p_ptr = p_ptr - 1
            else:
                q_ptr = q_ptr - 1

        return p_path[p_ptr]
```

... How the *** did I `Blammo!` a solution which beats 98.27% of people(!!!!) What in heck!

Surprisingly, the more intuitive solution where we go a direction if both nodes go the same direction otherwise break (that's the end point) is slower(!)

```python
class Solution:
    def lowestCommonAncestor(self, root: 'TreeNode', p: 'TreeNode', q: 'TreeNode') -> 'TreeNode':
        while root:
            if root.val>p.val and root.val>q.val:
                root = root.left
            elif root.val<p.val and root.val<q.val:
                root = root.right
            else:
                break
        return root
```

----
# Source:
Source