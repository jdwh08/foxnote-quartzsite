---
aliases: 
tags:
  - cs/leetcode/easy
  - cs/dsa/tree/binary
  - review
edited: 2025-07-27T18:59
created: 2025-07-23T18:42:00
---
# Problem:
Given the `root` of a [[Binary Tree]], return _the length of the **diameter** of the tree_.

The **diameter** of a binary tree is the **length** of the longest path between any two nodes in a tree. This path may or may not pass through the `root`.

The **length** of a path between two nodes is represented by the number of edges between them.

#### Bounds
- The number of nodes in the tree is in the range `[1, 10^4]`.
- `-100 <= Node.val <= 100`

#### Examples
**Input:** root = `[1,2,3,4,5]`
**Output:** 3
**Explanation:** 3 is the length of the path `[4,2,1,3]` or `[5,2,1,3]`.

---
# Notes:
Obviously another [[Tree Traversal]] problem.
It seems clear that [[Depth First Search|DFS]] is the right solution because we only care about tree depth.

Issue I have is the following:
- Our target is the Diameter, i.e., at every node, the sum of $L+R$.
	- We count the path length (up L, down R). Not $L+R+1$ because it's the number of CONNECTIONS, not nodes.
	- Note that for this to work, we need to have L and R be the longest possible L and R.
- To recurse, we can't return the diameter, since that would end up summing the entire tree.

I needed a better way to pass the diameter information while also figuring out what we need to pass for recursion.
- For recursion, I said earlier that for L and R to work we need them to be the longest possible
- Therefore, our recursion must return the $max(L+R)+1$, where the +1 is for the current node. 

---
# Attempts:

##### Attempt 1
What trips me up is the target thing: our target we need to check is L+R maximum, but our recursion function needs to return $max(L,R)+1$. Thus, we need some good way to pass both bits of information.

##### Attempt 2
- It turns out that we are best suited to have our target be a `nonlocal` variable. 
- We return the recursion solution as per usual.

---
# Solution:

```python
class Solution:

    def diameterOfBinaryTree(self, root: Optional[TreeNode]) -> int:
        output = 0

        def get_path_length(
            node: TreeNode | None,
            cur_length: int = 0
        ) -> int:
            # base case
            if node is None:
                return 0

            # pre
            cur_length += 1  # for the node

            # recursion
            left_length = get_path_length(node.left)
            right_length = get_path_length(node.right)

            # post
            nonlocal output
            output = max(output, left_length + right_length)
            cur_length += max(left_length, right_length)

            # return
            return cur_length

        get_path_length(root)
        return output
```

----
# Source:
https://leetcode.com/problems/diameter-of-binary-tree/description/