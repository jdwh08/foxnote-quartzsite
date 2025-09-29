---
aliases:
  - Leetcode 1765 Map of Highest Peak
tags:
  - cs/leetcode/medium
  - cs/dsa/array/matrix
  - cs/dsa/bfs
edited: 2025-09-24T17:05
created: 2025-07-21T19:39
---
# Problem:
Given an `m x n` binary matrix `mat`, return _the distance of the nearest_ `0` _for each cell_.
The distance between two cells sharing a common edge is `1`.

#### Bounds
- `m == mat.length`
- `n == mat[i].length`
- `1 <= m, n <= 10^4`
- `1 <= m * n <= 10^4`
- `mat[i][j]` is either `0` or `1`.
- There is at least one `0` in `mat`.

#### Examples


---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
Our input is a mn [[Matrix]], and our output is a mn matrix.
**BOUNDS**:
- At least $O(mn)$ for output as a minimum
- This means a simple matrix traversal [[Breadth First Search|BFS]] is acceptable.

This is a [[Breadth First Search#Multi Source BFS|Multi Source BFS]] specifically, which we can go to from the 0 values in the matrix.

---
# Solution:

```python
class Solution:
    def updateMatrix(self, mat: List[List[int]]) -> List[List[int]]:
        # input: mn matrix
        # output: mn matrix

        # bounds
            # O(mn) output wise min
        
        ROWS = len(mat)
        COLS = len(mat[0])

        output: list[list[int | None]] = []

        # BFS? from each source 0 propagating outwards
        queue = deque()

        for row in range(ROWS):
            currow = []
            for col in range(COLS):
                val = mat[row][col]
                if val == 0:
                    currow.append(val)
                    queue.append((val, row, col))
                else:
                    currow.append(None)
            output.append(currow.copy())

        neighbours = [(-1, 0), (0, -1), (1, 0), (0, 1)]
        while len(queue) > 0:
            val, row, col = queue.popleft()
            for dr, dc in neighbours:
                rown, coln = row + dr, col + dc
                if (
                    (0 <= rown <= ROWS-1)
                    and (0 <= coln <= COLS-1)
                    and output[rown][coln] is None
                ):
                    output[rown][coln] = val+1
                    queue.append((val+1, rown, coln))

        return output
```

----
# Source:
https://leetcode.com/problems/01-matrix/