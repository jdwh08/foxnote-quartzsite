---
aliases: 
tags:
  - cs/leetcode/hard
  - cs/dsa/graph/path/dijkstra
  - cs/dsa/graph/unionfind
edited: 2025-08-16T12:31
created: 2025-07-23T18:42:00
---
# Problem:
You are given an `n x n` integer matrix `grid` where each value `grid[i][j]` represents the elevation at that point `(i, j)`.

It starts raining, and water gradually rises over time. At time `t`, the water level is `t`, meaning **any** cell with elevation less than equal to `t` is submerged or reachable.

You can swim from a square to another 4-directionally adjacent square if and only if the elevation of both squares individually are at most `t`. You can swim infinite distances in zero time. Of course, you must stay within the boundaries of the grid during your swim.

Return _the minimum time until you can reach the bottom right square_ `(n - 1, n - 1)` _if you start at the top left square_ `(0, 0)`.

#### Bounds
- `n == grid.length`
- `n == grid[i].length`
- `1 <= n <= 50`
- `0 <= grid[i][j] < n2`
- Each value `grid[i][j]` is **unique**.

#### Examples
```
**Input:** grid = 
[00,01,02,03,04]
[24,23,22,21,05]
[12,13,14,15,16]
[11,17,18,19,20]
[10,09,08,07,06]

**Output:** 16
**Explanation:** The final route is
0-1-2-3-4-5-16-15-14-13-12-11-19-9-8-7-8-6

We need to wait until time 16 so that (0, 0): 5 and (4, 4): 16 are connected.
```

---
# Notes:


---
# Attempts:

##### Attempt 1
This is a [[Graph]] problem. We are trying to find the route closest to the end.
Our movement is 4-way, with restriction that the value of the cell must be at least same as time $t$.

Initial thought is to use [[Breadth First Search|BFS]] since it's shortest path. We can keep track of the time, and then have transitions going right, down, left, up (favour down and left). We'll keep track of the seen as having value of inf in the grid. 

For neighbour in neighbours:
- Check if feasible (grid bounds, cell value)
- If yes, add to queue.
- If it is not feasible, we have to wait to time (min neighbour value) to progress.
- We can keep track of the values as such. 

... except for the fact that no, we don't actually want the traversal time! instead, we want the SMALLEST VALUE in the grid. Notice how in the example we'd wait until 16 and then keep moving 10 more squares until reaching the end? 

Thus, instead of wanting traversal time, we actually want the *largest value in the path* where the path is made of the *smallest values possible*. (maximin).

##### Attempt 2
Now that it is a path problem with positive weights, we clearly should use [[Dijkstra's Algorithm]]. 
- Distance is not `dist_to_node + node_weight` as in standard Dijkstra's, since our distance weighting is just the largest value in path. Instead, it's `max(dist_to_node, node_weight)`

There's also a slight issue that if you code it so the base case checks in the function itself instead of inside the neighbours loop, we actually Time Limit Exceed TLE on Leetcode (!)
- To optimize, we can break early the first time we reach the end state, since we are greedy it has to be the cheapest route.

##### Attempt 3
You can also do this with [[Union Find]] similar to [[Kruskal's Algorithm]]! The optimal path from top-left to bottom-right can be thought of as a [[Minimum Spanning Tree]] between the points. 

We can't really use Primm's Algorithm I don't think because we don't know stopping condition.

Apparently we can also use DFS + Binary Search...

Anyway, end results are [[Big O]] of $O(n^2 \log n)$

---
# Solution:

```python
class Solution:
    def swimInWater(self, grid: List[List[int]]) -> int:
        GRID_SIZE = len(grid)
        seen: set[tuple[int, int]] = set()
        seen.add((0,0))

        # cheapest edge for all neighbours
        minheap: list[tuple[int, int, int]] = []
        minheap.append((grid[0][0], 0, 0))

        actions: tuple[tuple[int]] = ((1, 0), (0, 1), (-1, 0), (0, -1))

        while len(minheap) > 0:
            # get new value
            maxval, x, y = heapq.heappop(minheap)

            if x == GRID_SIZE-1 and y == GRID_SIZE-1:
                return maxval

            # get neighbours
            for deltax, deltay in actions:
                newx = x + deltax
                newy = y + deltay

                # check if valid
                if newx < 0 or newx >= GRID_SIZE:
                    continue
                if newy < 0 or newy >= GRID_SIZE:
                    continue
                if (newx, newy) in seen:
                    # seen, continue
                    continue

                # mark xy as seen
                seen.add((newx,newy))

                # update maxval if cheaper
                newmaxval = max(maxval, grid[newx][newy])

                # add to minheap
                heapq.heappush(minheap, (newmaxval, newx, newy))
```

----
# Source:
https://leetcode.com/problems/swim-in-rising-water/