---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/graph
  - cs/dsa/array
edited: 2025-08-11T20:53
created: 2025-07-23T18:42:00
---
# Problem:
You are given an `m x n` `grid` where each cell can have one of three values:
- `0` representing an empty cell,
- `1` representing a fresh orange, or
- `2` representing a rotten orange.

Every minute, any fresh orange that is **4-directionally adjacent** to a rotten orange becomes rotten.

Return _the minimum number of minutes that must elapse until no cell has a fresh orange_. If _this is impossible, return_ `-1`.

#### Bounds
- `m == grid.length`
- `n == grid[i].length`
- `1 <= m, n <= 10`
- `grid[i][j]` is `0`, `1`, or `2`.

#### Examples
**Input:** grid = `[[2,1,1],[1,1,0],[0,1,1]]`
**Output:** 4
Timeline:
- 0: Rotted fruit in the top left corner.
- 1: Expands to `[[2,2,1],[2,1,0],[0,1,1]]`
- 2: Expands to `[[2,2,2],[2,2,0],[0,1,1]]`
- 3: Expands to `[[2,2,2],[2,2,0],[0,2,1]]`
- 4: Expands to `[[2,2,2],[2,2,0],[0,2,2]]`

**Input:** grid = `[[2,1,1],[0,1,1],[1,0,1]]`
**Output:** -1
**Explanation:** The orange in the bottom left corner (row 2, column 0) is never rotten, because rotting only happens 4-directionally.

**Input:** grid = `[[0,2]]`
**Output:** 0
**Explanation:** Since there are already no fresh oranges at minute 0, the answer is just 0.

---
# Notes:
This is [[Breadth First Search#Multi Source BFS|Multi Source BFS]], similar to [[Leetcode X Islands and Treasure]] but slightly more complicated.

---
# Attempts:

##### Attempt 1
We do the standard multi-source BFS but with two array scans, one to get the rotting fruit and one to get the nice fruit. It's a bit slow.

##### Attempt 2
Why not also keep track of the number of freshers? Get the number in the same pass as finding rotting fruit at the beginning. Then, decrement each time the rot consumes.

---
# Solution:

```python
class Solution:

    def orangesRotting(self, grid: List[List[int]]) -> int:
        # 0: empty
        # 1: nice fruit
        # 2: rotd fruit

        # each min if 1 next to 2 (no diag), 1 -> 2
        # return min number of mins until no fresh fruit
        # -1 if not possible

        # this is basically just asking for the longest string of 1s
        # bordering a 2
        # ... with the caveat that if there are solitary ones, then
        # we should return -1

        # multi-source BFS again from the rotting fruits
        # and then we do a final O(mn) check for any freshers?
        ROWS = len(grid)
        COLS = len(grid[0])

        # 1. find rotting fruit O(mn)
        rotting: list[tuple[int, int]] = []
        freshers = 0
        for row in range(0, ROWS):
            for col in range(0, COLS):
                if grid[row][col] == 2:
                    rotting.append((row, col))
                elif grid[row][col] == 1:
                    freshers += 1

        # 2. Multi Source BFS O(mn)
        minute = 0
        q = deque()
        for row, col in rotting:
            q.append((row, col, 0))
        while len(q) > 0:
            row, col, time = q.popleft()
            # base case
            if row < 0 or row >= ROWS or col < 0 or col >= COLS:
                continue
            if grid[row][col] <= 0:
                # we use negative numbers to denote rotting time
                # 0 is for nonfruit
                continue

            # we have a fresh fruit which is EXPOSED.
            # the rot consumes all
            if grid[row][col] == 1:
                freshers -= 1
            grid[row][col] = -time

            # now propagate
            q.append((row+1, col, time+1))
            q.append((row-1, col, time+1))
            q.append((row, col+1, time+1))
            q.append((row, col-1, time+1))

            minute = time  # time passes

        return minute if freshers == 0 else -1
```

----
# Source:
https://leetcode.com/problems/rotting-oranges/