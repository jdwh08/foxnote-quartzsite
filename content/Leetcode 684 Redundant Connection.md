---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/graph
edited: 2025-08-14T17:06
created: 2025-07-23T18:42:00
---
# Problem:
You are given a connected **undirected [[Graph]]** with `n` nodes labeled from `1` to `n`. Initially, it contained no cycles and consisted of `n-1` edges.

We have now added one additional edge to the graph. The edge has two **different** vertices chosen from `1` to `n`, and was not an edge that previously existed in the graph.

The graph is represented as an array `edges` of length `n` where `edges[i] = [ai, bi]` represents an edge between nodes `ai` and `bi` in the graph.

Return an edge that can be removed so that the graph is still a connected non-cyclical graph. If there are multiple answers, return the edge that appears last in the input `edges`.

#### Bounds
- `n == edges.length`
- `3 <= n <= 100`
- `1 <= edges[i][0] < edges[i][1] <= edges.length`
- There are no repeated edges and no self-loops in the input.

#### Examples
```java
Input: edges = [[1,2],[1,3],[1,4],[3,4],[4,5]]

Output: [3,4]
```

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
We're basically saying "here's a [[Tree]], we added an extra edge, remove that last extra edge."

I tried doing this with [[Depth First Search|DFS]] using the standard "seen" cache. It is enough to detect a cycle, but couldn't figure out how to make it so that we identified the *last* edge that created the cycle from the list. Graph traversal had no guarantee of being the last edge in my view. Same issue with [[Breadth First Search|BFS]].

I then thought about different other graph algorithms. Dijkstra's makes no sense. Toposort with Kahn's didn't seem that relevant since this is undirected. Therefore, I figured we use [[Union Find]].

If we think about it, the redundant edge is the same thing as an edge which, once added, connects already connected components together. Thus, we are looking for the last instance of an edge where the find_parents function is the same for both nodes.

[[Big O]] is interesting: $O(V + (E * \alpha(V)))$ where $\alpha \approx 0$ (near constant) due to path compression and ranking.

##### Attempt 2
It turns out that you can actually do this a bunch of ways.
- [[Depth First Search|DFS]] requires you to build up the graph slowly based on the edges and DFS each time. If you ever reach an edge you've seen before (cycle), return the edge that created the cycle
- Regular [[Breadth First Search|BFS]] doesn't have a solution known, but you can use [[Topological Sort|Kahn's Algorithm]]. Note that we are treating the undirected graph as having two-way connections everywhere. This means that the minimum number of connections for Kahn's to add to queue is ONE, not ZERO. Finally, we go backwards through the edges to find the node which still has an inward degree of two.

---
# Solution:

```python
class Solution:
	# UNION FIND solution
    def findRedundantConnection(self, edges: List[List[int]]) -> List[int]:
        # we build this with UNIONFIND
        # and get the last edge which doesn't help the UNION.

        redundant_edges: list[list[int]] = []
        
        parent: list[int] = [i for i in range(0, len(edges))]
        rank: list[int] = [1] * len(edges)

        # FIND
        def find_parent(node: int) -> int:
            while parent[node] != node:
                # path compresssion
                parent[node] = parent[parent[node]]
                node = parent[node]
            
            return node
        
        # UNION
        def union(n1: int, n2: int) -> bool:
            p1, p2 = find_parent(n1), find_parent(n2)
            # print(n1, n2, p1, p2)
            # print(parent, rank)
            if p1 == p2:
                # REDUNDANT EDGE!!!!!
                redundant_edges.append([n1+1, n2+1])
                return False
            
            # Do the Union
            r1, r2 = rank[p1], rank[p2]
            if r1 >= r2:
                parent[p2] = p1
                rank[p1] += rank[p2]
            else:
                parent[p1] = p2
                rank[p2] += rank[p1]

            return True

        for n1, n2 in edges:
            union(n1-1, n2-1)  # they have 1 to n not 0 to n-1

        # return the last redundant edge?
        return redundant_edges[-1]
```

----
# Source:
https://neetcode.io/problems/redundant-connection?list=neetcode150