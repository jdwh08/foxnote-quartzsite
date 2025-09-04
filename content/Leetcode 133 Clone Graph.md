---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/graph
edited: 2025-08-11T18:03
created: 2025-07-23T18:42:00
---
# Problem:
Given a reference of a node in a **[connected](https://en.wikipedia.org/wiki/Connectivity_\(graph_theory\)#Connected_graph)** undirected graph.

Return a [**deep copy**](https://en.wikipedia.org/wiki/Object_copying#Deep_copy) (clone) of the graph.

Each node in the graph contains a value (`int`) and a list (`List[Node]`) of its neighbors.

```java
class Node {
    public int val;
    public List<Node> neighbors;
}
```

**Test case format:**

For simplicity, each node's value is the same as the node's index (1-indexed). For example, the first node with `val == 1`, the second node with `val == 2`, and so on. The graph is represented in the test case using an adjacency list.

**An adjacency list** is a collection of unordered **lists** used to represent a finite graph. Each list describes the set of neighbors of a node in the graph.

The given node will always be the first node with `val = 1`. You must return the **copy of the given node** as a reference to the cloned graph.

#### Bounds
- The number of nodes in the graph is in the range `[0, 100]`.
- `1 <= Node.val <= 100`
- `Node.val` is unique for each node.
- There are no repeated edges and no self-loops in the graph.
- The Graph is connected and all nodes can be visited starting from the given node

#### Examples
... no.

---
# Notes:
You should check the bounds for the annoying no-node case.

---
# Attempts:

##### Attempt 1
This is [[Breadth First Search|BFS]] but for a [[Graph]]. We do BFS because it nicely allows us to skip nodes which we've seen already.

We can use DFS instead.

---
# Solution:

```python
"""
# Definition for a Node.
class Node:
    def __init__(self, val = 0, neighbors = None):
        self.val = val
        self.neighbors = neighbors if neighbors is not None else []
"""
class Solution:
    def cloneGraph(self, node: Optional['Node']) -> Optional['Node']:
        # oh bloody hell there's an option for no nodes.
        if node is None:
            return None

        val_to_node: dict[int, "Node"] = {}
        seen: set = set()

        output = Node(val=1)
        val_to_node[1] = output

        # traverse using BFS?
        q = deque()
        q.append(node)
        while len(q) > 0:
            nde = q.popleft()
            ndeval = nde.val
            # print(f"NODEVAL: {ndeval}")
            if ndeval in seen:
                continue

            seen.add(ndeval)
  
            if ndeval not in val_to_node:
                # make the new node
                val_to_node[ndeval] = Node(val=ndeval)

            ndeneighbours = nde.neighbors
            for neighbour in ndeneighbours:
                neighbourval = neighbour.val
                # print(f"    NEIGHBOURVAL: {neighbourval}")

                if neighbourval not in val_to_node:
                    val_to_node[neighbourval] = Node(val=neighbourval)

                # add the neighbour relationship to ndeval
                val_to_node[ndeval].neighbors.append(
	                val_to_node[neighbourval]
	            )

                # add the neighbour to the queueeuueueueu
                # this is where we do the other side of the graph
                q.append(neighbour)
        return output
```

```python
class Solution:
    def cloneGraph(self, node: Optional['Node']) -> Optional['Node']:
        oldToNew = {}

        def dfs(node):
            if node in oldToNew:
                return oldToNew[node]

            copy = Node(node.val)
            oldToNew[node] = copy
            for nei in node.neighbors:
                copy.neighbors.append(dfs(nei))  # only copy full node
            return copy

        return dfs(node) if node else None
```

----
# Source:
https://leetcode.com/problems/clone-graph/