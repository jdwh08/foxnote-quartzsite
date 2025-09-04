---
aliases: 
tags:
  - cs/leetcode
  - cs/dsa/graph
edited: 2025-08-11T20:26
created: 2025-07-23T18:42:00
---
# Problem:
You are given a m×n 2D `grid` initialized with these three possible values:
1. `-1` - A water cell that _can not_ be traversed.
2. `0` - A treasure chest.
3. `INF` - A land cell that _can_ be traversed. We use the integer `2^31 - 1 = 2147483647` to represent `INF`.

Fill each land cell with the distance to its nearest treasure chest. If a land cell cannot reach a treasure chest then the value should remain `INF`.

Assume the grid can only be traversed up, down, left, or right.

Modify the `grid` **in-place**.

#### Bounds
- `m == grid.length`
- `n == grid[i].length`
- `1 <= m, n <= 100`
- `grid[i][j]` is one of `{-1, 0, 2147483647}`

#### Examples
```java
Input: [
  [inf,-1,0,inf],
  [inf,inf,inf,-1],
  [inf,-1,inf,-1],
  [0,-1,inf,inf]
]

Output: [
  [3,-1,0,1],
  [2,2,1,-1],
  [1,-1,2,-1],
  [0,-1,3,4]
]
```

---
# Notes:
Introduces [[Breadth First Search#Multi Source BFS]].

---
# Attempts:

##### Attempt 1
... I had to think about this. Clearly it's BFS, and it makes sense to find all the possible treasure points and go from treasure out to land, but how do we handle the multiple sources?

##### Attempt 2
You add them into the queue all at the end, silly.

---
# Solution:

```python
class Solution:

    def islandsAndTreasure(self, grid: List[List[int]]) -> None:
        # -1 impassible water
        # 0: treasure!
        # inf: passible land
        # fill each land with distance to nearest treasure.
        # INF if no treasure :(. modify grid in place.

        # BFS
        # find a zero, propogate values until hit.
        NUMROWS = len(grid)
        NUMCOLS = len(grid[0])

        treasures: list[tuple[int, int]] = []

        # get all treasures O(mn)
        for row in range(0, NUMROWS):
            for col in range(0, NUMCOLS):
                if grid[row][col] == 0:
                    treasures.append((row, col))

        # BFS from each treasure
        q = deque()
        def propagate_treasure():
            while len(q) > 0:
                row, col, dist = q.popleft()
                # base case
                if (
                    row < 0 or row >= NUMROWS
                    or col < 0 or col >= NUMCOLS
                ):
                    continue

                # unclaimed land or treasure
                if (grid[row][col] != 2147483647) and (grid[row][col] != 0):
                    continue

                # update distance to treasure chest
                if dist < grid[row][col]:
                    grid[row][col] = dist

                # add neighbours to queueueueueu
                q.append((row+1, col, dist+1))
                q.append((row-1, col, dist+1))
                q.append((row, col+1, dist+1))
                q.append((row, col-1, dist+1))

        # add each source to the BFS
        for row, col in treasures:
            q.append((row, col, 0))
        propagate_treasure()
```

----
# Source:
https://neetcode.io/problems/islands-and-treasure?list=neetcode150