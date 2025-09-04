---
aliases:
  - Leetcode 547 Number of Provinces
tags:
  - cs/leetcode/medium
  - cs/dsa/graph
  - cs/dsa/dfs
  - cs/dsa/bfs
  - cs/dsa/graph/unionfind
edited: 2025-08-14T15:21
created: 2025-07-23T18:42:00
---
# Problem:
There is an undirected graph with `n` nodes. There is also an `edges` array, where `edges[i] = [a, b]` means that there is an edge between node `a` and node `b` in the graph.

The nodes are numbered from `0` to `n - 1`.

Return the total number of connected components in that graph.

#### Bounds
- `1 <= n <= 100`
- `0 <= edges.length <= n * (n - 1) / 2`

#### Examples
```java
Input:
n=6
edges=[[0,1], [1,2], [2,3], [4,5]]

Output:
2
```

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
We convert the edges from list of list into a typical graph adjacency list structure. We then can use either [[Depth First Search|DFS]] or [[Breadth First Search|BFS]] to find the entire island of connected components and DELETE them. Finally, we increment 1 to the counter.

BLAMMO!

[[Big O]] of the standard $O(V+E)$ because we go through all nodes and edges.

##### Attempt 2
Okay, we'll try [[Union Find]], since it was meant for this problem.

---
# Solution:

```python
class Solution:
	# DFS solution
    def countComponents(self, n: int, edges: List[List[int]]) -> int:
        graph: dict[int, set[int]] = {
            i: set()
            for i in range(n)
        }
        for node1, node2 in edges:
            graph[node1].add(node2)
            graph[node2].add(node1)

        num_connected_components = 0
        seen: set[int] = set()

        def dfs(node: int):
            # base case
            if node in seen:
                return
            
            seen.add(node)
            # get neighbours
            neighbours = graph.get(node, [])
            for neighbour in neighbours:
                dfs(neighbour)
            
            # remove node from graph
            if node in graph:
                del graph[node]
        
        while len(graph) > 0:
            num_connected_components += 1
            nextnode = next(key for key in graph.keys())
            dfs(nextnode)
        
        return num_connected_components

	# DFS Solution with a Matrix (Leetcode 547)
    def findCircleNum(self, isConnected: List[List[int]]) -> int:
        num_connected_components = 0
        seen: set[int] = set()

        def dfs(node: int):
            # base case
            if node in seen:
                return
            
            seen.add(node)
            # get neighbours
            neighbours = isConnected[node]
            for neighbour, connected in enumerate(neighbours):
                if connected == 0:
                    continue
                dfs(neighbour)

        for node in range(0, len(isConnected)):
            if node not in seen:
                num_connected_components += 1
                dfs(node)
        
        return num_connected_components

	# UnionFind Solution
	def countComponents(self, n: int, edges: List[List[int]]) -> int:
        parent: list[int] = [
            i for i in range(n)
        ]
        csize: list[int] = [1] * n

        def find_parent(node: int) -> int:
            while (parent[node] != node):
                # compression
                parent[node] = parent[parent[node]]
                node = parent[node]
            return node
        
        def union_components(n1: int, n2: int) -> bool:
            p1, p2 = find_parent(n1), find_parent(n2)
            if p1 == p2:
                # same component
                return False
            
            csize1, csize2 = csize[p1], csize[p2]
            if csize1 >= csize2:
                parent[p2] = p1
                csize[p1] += csize[p2]
            else:
                parent[p1] = p2
                csize[p2] += csize[p1]
            return True

        num_ccs = n
        for n1, n2 in edges:
            did_union = union_components(n1, n2)
            if did_union:
                num_ccs -= 1
        
        return num_ccs
```

----
# Source:
https://leetcode.com/problems/number-of-connected-components-in-an-undirected-graph/
https://neetcode.io/problems/count-connected-components?list=neetcode150