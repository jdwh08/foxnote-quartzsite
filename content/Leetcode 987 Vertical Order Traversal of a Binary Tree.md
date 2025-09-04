---
aliases: 
tags:
  - cs/leetcode/hard
  - cs/dsa/tree/binary
  - cs/dsa/bfs
edited: 2025-08-16T10:28
created: 2025-07-23T18:42:00
---
# Problem:
Given the `root` of a binary [[Tree]], calculate the **vertical order traversal** of the binary tree.

For each node at position `(row, col)`, its left and right children will be at positions `(row + 1, col - 1)` and `(row + 1, col + 1)` respectively. The root of the tree is at `(0, 0)`.

The **vertical order traversal** of a binary tree is a list of top-to-bottom orderings for each column index starting from the leftmost column and ending on the rightmost column. 

There may be multiple nodes in the same row and same column. In such a case, sort these nodes by their values.

Return _the **vertical order traversal** of the binary tree_.

#### Bounds
- The number of nodes in the tree is in the range `[1, 1000]`.
- `0 <= Node.val <= 1000`

#### Examples
```
**Input:** root = [3,9,20,null,null,15,7]
**Output:** [[9],[3,15],[20],[7]]
**Explanation:**
Column -1: Only node 9 is in this column.
Column 0: Nodes 3 and 15 are in this column in that order from top to bottom.
Column 1: Only node 20 is in this column.
Column 2: Only node 7 is in this column.
```

```
**Input:** root = [1,2,3,4,6,5,7]
**Output:** [[4],[2],[1,5,6],[3],[7]]
**Explanation:**
Column -2: Only node 4 is in this column.
Column -1: Only node 2 is in this column.
Column 0: Nodes 1, 6, and 5 are in this column.
          1 is at the top, so it comes first.
          6 and 5 are at the same position (2, 0), so we order them by their value, 5 before 6.
Column 1: Only node 3 is in this column.
Column 2: Only node 7 is in this column.
```
---
# Notes:
This is a fun [[Tree Traversal]] problem with a twist of sorting values.

---
# Attempts:

##### Attempt 1
This is clearly [[Tree Traversal]], so the main question is whether to use [[Breadth First Search|BFS]].
We need to sort the values by...
1. Column
2. Level (root before leaf)
3. Value (small before large)

Because we have to deal with tree level, it is probably a more natural fit to do [[Breadth First Search|BFS]] as it does a better job preserving the level order than DFS does.

We next need to figure out how to deal with "column". After some whiteboarding, this is basically looking at the number of times we go right minus the number of times we go left. E.g., column -1 must have at least one more left than right. Root is 0.

Since we are using BFS it's tricky to know exactly how many columns there are in the tree. We can either store them in a hashmap (which we sort) or have one big list and do one big sort. I'm going with a big list for now. We use a TUPLE with the same ordering as our sort criteria above.

We traverse the tree. At each step we need to know the tree level and column, so our BFS queueue is a tuple of node index, lefts, rights, and level.

Finally we need to sort the values.

---
# Solution:

```python
class Solution:
    def verticalTraversal(self, root: Optional[TreeNode]) -> List[List[int]]:
        output: list[tuple[int, int, int]] = []

        q = deque()
        q.append((root, 0, 0, 0))
        while len(q) > 0:
            node, num_left, num_right, level = q.popleft()

            # base case
            if node is None:
                continue

            nodecol = num_right - num_left
            output.append((nodecol, level, node.val))
            q.append((node.left, num_left+1, num_right, level+1))
            q.append((node.right, num_left, num_right+1, level+1))

        # sort output by key
        output = sorted(output)

        final_output: list = []
        prev_col = -float("inf")
        for col, row, val in output:
            if col != prev_col:
                final_output.append([])
                prev_col = col
            
            final_output[-1].append(val)

        return final_output
```

----
# Source:
https://leetcode.com/problems/vertical-order-traversal-of-a-binary-tree/