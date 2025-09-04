---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/graph/mst
edited: 2025-08-16T10:30
created: 2025-07-23T18:42:00
---
# Problem:
Problem Statement

#### Bounds


#### Examples


---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
We use [[Kruskal's Algorithm]] but I learned it on the fly from the hints about union find.

---
# Solution:

##### [[Kruskal's Algorithm]]
```python
class Solution:
    def minCostConnectPoints(self, points: List[List[int]]) -> int:
        # (x, y) points on coordinate plane
        # MANHATTAN DISTANCE: abs(x1-x2) + abs(y1-y2)
        # Get minimum spanning tree

        # Primm's MST algorithm? How does it work?
        # nevermind, we can use UnionFind with Kruskal's?

        # we can use unionfind
        graph: dict[int, set[int]] = {
            i: set()
            for i in range(len(points))
        }
        minheap: list[tuple[int, int, int]] = []

        for i in range(len(points)):
            for j in range(i+1, len(points)):
                # get distance
                x1, y1 = points[i]
                x2, y2 = points[j]
                manhattandist = abs(x1-x2) + abs(y1-y2)
                # add to graph
                graph[i].add(j)
                graph[j].add(i)
                # add to minheap
                heapq.heappush(minheap, (manhattandist, i, j))
        
        # print(graph)

        # union find?
        parent: list[int] = [i for i in range(len(points))]
        rank: list[int] = [1] * len(points)
        def find_parent(node: int) -> int:
            while node != parent[node]:
                # path compression
                parent[node] = parent[parent[node]]
                node = parent[node]
            return node
        
        best_rank = 1
        def union_components(n1: int, n2: int) -> bool:
            nonlocal best_rank

            p1, p2 = find_parent(n1), find_parent(n2)
            if p1 == p2:
                return False
            
            # get the ranks
            r1, r2 = rank[n1], rank[n2]
            if r1 >= r2:
                # put r2 under r1
                parent[p2] = p1
                rank[p1] += rank[p2]
                best_rank = rank[p1] if rank[p1] > best_rank else best_rank
            elif r2 > r1:
                parent[p1] = p2
                rank[p2] += rank[p1]
                best_rank = rank[p2] if rank[p2] > best_rank else best_rank

            return True

        # greedy get connections until everything's connected
        min_cost: int = 0
        while(best_rank < len(points) and len(minheap) > 0):
            # get the connection from the minheap
            cost, n1, n2 = heapq.heappop(minheap)
            # print(cost, n1, n2, parent, rank, best_rank)

            if union_components(n1, n2):
                min_cost += cost
                # print(f"UPDATED: {min_cost}")
        
        return min_cost if best_rank == len(points) else -1
```
- [[Big O]] is $O(n^2 \log n)$ time and $O(n^2)$ space.

##### [[Primm's Algorithm]]
```python
class Solution:
    def minCostConnectPoints(self, points: List[List[int]]) -> int:
        # (x, y) points on coordinate plane
        # MANHATTAN DISTANCE: abs(x1-x2) + abs(y1-y2)
        # Get minimum spanning tree

        # Primm's MST algorithm? How does it work?
        # build the graph
        NUMPOINTS = len(points)
        graph: list[set[tuple[int, int]]] = [set() for i in range(NUMPOINTS)]

        # pick a point
        # seen
        # min heap of distances
        # if node in seen continue
        # otherwise add edge cost to cost
        # for neighbour in node add to minheap
        # continue until we have seen all nodes / n-1 edges

        # build the graph adjlist
        for idx in range(NUMPOINTS):
            x1, y1 = points[idx]
            for jdx in range(idx+1, NUMPOINTS):
                x2, y2 = points[jdx]
                manhattandist = abs(x2-x1) + abs(y2-y1)
                # add to graph
                graph[idx].add((manhattandist, jdx))
                graph[jdx].add((manhattandist, idx))
        
        # prim's
        cost: int = 0
        seen: set[int] = set()
        minheap: list[tuple[int, int, int]] = []
        # add first node into prim
        minheap.append((0,0,0))

        while len(minheap) > 0 and len(seen) < NUMPOINTS:
            dist, n1, n2 = heapq.heappop(minheap)
            if n2 in seen: 
                continue
            
            # add node edge bookkeeping
            cost += dist
            seen.add(n2)

            for newdist, neighbour in graph[n2]:
                if neighbour in seen:
                    continue
                heapq.heappush(minheap, (newdist, n2, neighbour))

        if len(seen) < NUMPOINTS:
            return -1
        return cost
```

We can optimize Primm's Algorithm even further, but it trips me up. See the Primm's Algorithm page. 

----
# Source:
https://leetcode.com/problems/min-cost-to-connect-all-points/description/