---
aliases:
  - Leetcode 695 Max Area of Island
tags:
  - cs/dsa/graph
  - cs/leetcode/medium
edited: 2025-08-11T17:31
created: 2025-07-23T18:42:00
---
# Problem:
Suppose we have a 2D array which is filled with 1 and 0 values.

How many "islands" are there? An island is a set of 1s all connected together and separated by 0s.

#### Bounds
- `m == grid.length`
- `n == grid[i].length`
- `1 <= m, n <= 300`
- `grid[i][j]` is `'0'` or `'1'`.

#### Examples

| 0   | 1   | 0   | 0   | 1   |
| --- | --- | --- | --- | --- |
| 0   | 0   | 0   | 1   | 1   |
| 0   | 0   | 0   | 0   | 1   |
| 0   | 0   | 0   | 0   | 0   |
- This has two islands.

---
# Notes:

> The secret is you use a [[Breadth First Search|BFS]] or [[Depth First Search|DFS]] (depends on how you want to go). Mark island land as seen, increase the island counter. Once island is done, we keep going through the array until we are finished.  
> 
> See? It's just a [[Depth First Search|DFS]] and we applying a small technique to the [[Depth First Search|DFS]]. 
> But even though I knew all these things, the very first thing I thought was...
> 	"Ohhhhh. I can't do this."
> 	
> I talked through it thinking about all the algorithms I knew, and was able to figure out that a simple search was enough to figure it out.
> 
> ~ Primagen


I'm not going to bother writing up Leetcode 695 Max Area of Island because it's literally the same solution except we keep track of island size instead of number of islands.

---
# Attempts:

##### Attempt 1
Kinda had this spoiled to me (oops!)

---
# Solution:

```python
class Solution:
    def numIslands(self, grid: List[List[str]]) -> int:
        # this is a grid with BFS over the cells
        # and DFS once we hit an island
        NUMROWS = len(grid)
        NUMCOLS = len(grid[0])

        rowidx = 0
        colidx = 0
        num_islands = 0

        # helper function to drege up la isla bonita
        islands_q = deque()

        def search_island():
            while len(islands_q) > 0:
                rowidx, colidx = islands_q.popleft()

                # base case
                if rowidx < 0 or rowidx >= NUMROWS:
                    continue
                if colidx < 0 or colidx >= NUMCOLS:
                    continue
                if grid[rowidx][colidx] != "1":
                    continue

                # set the island as "visited"
                grid[rowidx][colidx] = "0"
                # look at the neighbours BFS style
                islands_q.append((rowidx+1, colidx))
                islands_q.append((rowidx-1, colidx))
                islands_q.append((rowidx, colidx+1))
                islands_q.append((rowidx, colidx-1))

        # very inefficient search
        for rowidx in range(0, NUMROWS):
            for colidx in range(0, NUMCOLS):
                if grid[rowidx][colidx] != "1":
                    continue

                num_islands += 1
                islands_q.append((rowidx, colidx))
                search_island()

        return num_islands
```

----
# Source:
The Last Algorithms Course
https://leetcode.com/problems/number-of-islands/