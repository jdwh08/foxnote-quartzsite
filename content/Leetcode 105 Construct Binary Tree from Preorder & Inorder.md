---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/tree/binary
  - todo
edited: 2025-07-31T17:21
created: 2025-07-23T18:42:00
---
# Problem:
Given two integer arrays `preorder` and `inorder` where `preorder` is the [[Tree Traversal#Pre-order Traversal|Pre-Order Traversal]] of a [[Binary Tree]] and `inorder` is the [[Tree Traversal#In-Order Traversal|In-order Traversal]] of the same tree, construct and return _the binary tree_.

#### Bounds
- `1 <= preorder.length <= 3000`
- `inorder.length == preorder.length`
- `-3000 <= preorder[i], inorder[i] <= 3000`
- `preorder` and `inorder` consist of **unique** values.
- Each value of `inorder` also appears in `preorder`.
- `preorder` is **guaranteed** to be the preorder traversal of the tree.
- `inorder` is **guaranteed** to be the inorder traversal of the tree.

#### Examples
**Input:** `preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
**Output:** `[3,9,20,null,null,15,7]

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
... Not sure how to approach this. Whiteboarded. Noticed that preorder gets you the root node up front, but not where to go from here.

##### Attempt 2
Okay, we need to do the following:
1. Preorder's 0th node is the root.
2. In Order by definition divides the array into two halves: LEFT, root, RIGHT.
3. Thus, we need to find the index of the root node within the array.
	1. This divides the tree into left and right.
4. Within each subtree, we need to find the new root
	1. Preorder always has the root up front.
5. Repeat.

Example:
`preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
1. Root node is 3. Root index in In-Order is 1.
2. LEFT in in-order is 9, RIGHT is 15, 20, 7.
3. What are the roots for the left and right trees?
	1. LEFT root tree is 9.
	2. RIGHT root tree is 20.
4. We can split preorder into NODE, LEFT, RIGHT.
	1. Drop NODE, so our new index starts at 1.
	2. LENGTH of the LEFT subtree is LENGTH of values before root in IN-ORDER.
	3. LENGTH of the RIGHT subtree is LENGTH of values after root in IN-ORDER.
	4. We can use these lengths to determine indexing.
5. Notice the index for this in preorder:
	1. LEFT node is 1 (same as root index in inorder)
	2. RIGHT node is 2.
	3. Thus, array bounds are from `1: idx+1` for LEFT, and `idx+1:` for RIGHT.
6. This is thus recursive, though we could make it iterative with a hashmap.

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
    def buildTree(
        self,
        preorder: List[int],
        inorder: List[int]
    ) -> Optional[TreeNode]:
        if len(preorder) <= 0 or len(inorder) <= 0:
            return None

        pre_idx = 0
        root = TreeNode(preorder[pre_idx])
        root_idx = inorder.index(preorder[pre_idx])  
        root.left = self.buildTree(preorder[1:root_idx+1], inorder[:root_idx])
        root.right = self.buildTree(preorder[root_idx+1:], inorder[root_idx+1:])

        return root
```

----
# Source:
https://neetcode.io/problems/binary-tree-from-preorder-and-inorder-traversal
