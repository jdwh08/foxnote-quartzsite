---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/graph
  - todo
edited: 2025-08-11T23:01
created: 2025-07-23T18:42:00
---
# Problem:
There is an `m x n` rectangular island that borders both the **Pacific Ocean** and **Atlantic Ocean**. The **Pacific Ocean** touches the island's left and top edges, and the **Atlantic Ocean** touches the island's right and bottom edges.

The island is partitioned into a grid of square cells. You are given an `m x n` integer matrix `heights` where `heights[r][c]` represents the **height above sea level** of the cell at coordinate `(r, c)`.

The island receives a lot of rain, and the rain water can flow to neighboring cells directly north, south, east, and west if the neighboring cell's height is **less than or equal to** the current cell's height. Water can flow from any cell adjacent to an ocean into the ocean.

Return _a **2D list** of grid coordinates_ `result` _where_ `result[i] = [ri, ci]` _denotes that rain water can flow from cell_ `(ri, ci)` _to **both** the Pacific and Atlantic oceans_.

#### Bounds
- `m == heights.length`
- `n == heights[r].length`
- `1 <= m, n <= 200`
- `0 <= heights[r][c] <= 105`

#### Examples
```
**Input:** heights = [[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]]

**Output:** [[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]]

**Explanation:** The following cells can flow to the Pacific and Atlantic oceans, as shown below:
[0,4]: [0,4] -> Pacific Ocean 
       [0,4] -> Atlantic Ocean
[1,3]: [1,3] -> [0,3] -> Pacific Ocean 
       [1,3] -> [1,4] -> Atlantic Ocean
[1,4]: [1,4] -> [1,3] -> [0,3] -> Pacific Ocean 
       [1,4] -> Atlantic Ocean
[2,2]: [2,2] -> [1,2] -> [0,2] -> Pacific Ocean 
       [2,2] -> [2,3] -> [2,4] -> Atlantic Ocean
[3,0]: [3,0] -> Pacific Ocean 
       [3,0] -> [4,0] -> Atlantic Ocean
[3,1]: [3,1] -> [3,0] -> Pacific Ocean 
       [3,1] -> [4,1] -> Atlantic Ocean
[4,0]: [4,0] -> Pacific Ocean 
       [4,0] -> Atlantic Ocean
Note that there are other possible paths for these cells to flow to the Pacific and Atlantic oceans.
```

---
# Notes:
AAAAAAAAAAAA

I guess this is multi-source DFS?

---
# Attempts:

##### Attempt 1
Can't we build an array where we track cells which go to both pacific and Atlantic? I.e., the bottom left / top right corner? From there, we propagate outwards like with Multi-Source BFS. Only allow cells which are at least the same height for water to flow down.

##### Attempt 2
No you silly, there are points which can take different paths to the pacific and atlantic. They don't have to go the same final square.

We then have to go from EVERY SINGLE BORDER cell to pacific and atlantic respectively.

This means we need some way to keep track of the values. Perhaps we do PACIFIC and then ATLANTIC, and keep track of the cell using a cell state? We replace the height value with some state indicator.

##### Attempt 3
No that doesn't work. If you replace the height value with state, how do we get the height for the second pass with Atlantic?

It turns out that [[Depth First Search|DFS]] is better for this problem. We DFS over everything in two passes: one for the top/bottom edge and one for the left/right edge.

This gives two sets of values, one for all reachable by PACIFIC and one reachable by ATLANTIC. We find the intersection.

---
# Solution:

```python
class Solution:

    def pacificAtlantic(self, heights: List[List[int]]) -> List[List[int]]:
        # pacific: top left
        # atlantic: bottom right
        # water can flow in four directions if height is AT MOST same
        # find all cells where water can go to BOTH pacific and atlantic.

        # ... can't we just build a new array where we track cells
        # which go to both pacific and atlantic?
        # we would then propagate out from these guaranteed values
        # to all value(s) which can have both?

        ROWS = len(heights)
        COLS = len(heights[0])

        pacific: set[tuple[int, int]] = set()
        atlantic: set[tuple[int, int]] = set()

        adj = [[-1,0], [1,0], [0,-1], [0,1]]

        def dfs(
            row: int, col: int,
            prevheight: int, reachableset: set
        ):
            # base case
            if row < 0 or row >= ROWS or col < 0 or col >= COLS:
                return
            if (row, col) in reachableset:
                return

            height = heights[row][col]
            # check if valid
            if height < prevheight:
                # water cannot flow down this way!
                # mark as seen
                return

            # water can flow from here to prior cells
            reachableset.add((row, col))

            for xadj, yadj in adj:
                dfs(row+xadj, col+yadj, height, reachableset)

        # DFS
        for col in range(COLS):
            dfs(0, col, heights[0][col], pacific)
            dfs(ROWS-1, col, heights[ROWS-1][col], atlantic)
        for row in range(ROWS):
            dfs(row, 0, heights[row][0], pacific)
            dfs(row, COLS-1, heights[row][COLS-1], atlantic)

        # PACIFIC and ATLANTIC
        output = pacific.intersection(atlantic)
        return [
            list(coords) for coords in output
        ]
```

----
# Source:
https://leetcode.com/problems/pacific-atlantic-water-flow/