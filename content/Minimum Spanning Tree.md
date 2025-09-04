---
aliases:
  - MST
tags:
  - cs/dsa/graph/mst
  - cs/dsa/tree
  - cs/dsa/greedy
edited: 2025-08-16T12:28
created: 2024-03-19T22:06
---
# Definition:
A Minimum Spanning [[Tree]] is a tree which connects all nodes in a weighted [[Graph]] for the cheapest cost possible.

---
# Notes:

### Properties
For a MST to be valid, the graph must have...
- Weights.
- Edges that connect all nodes.

We can see that to connect all nodes into a single connected component, we need $n-1$ edges for $n$ nodes. Any extra edges is overkill (cycles). This means it must be a [[Tree]]. Thus, we need to find the best combination of $n-1$ edges.

It is possible for a graph to have multiple MSTs.

### [[Kruskal's Algorithm]]
- We can use a [[Greedy Algorithm]] approach where we start by clearing the cheapest edge. Then, we keep clearing the cheapest edges so long as they connect components together (i.e., [[Union Find]]). 

### [[Primm's Algorithm]]
- We can use a [[Greedy Algorithm]] approach where we start at a node, pick the cheapest edge from that node to an unseen node, and add the neighbours to a queue. We continue until we reach $n-1$ edges.

---
# Examples:
Examples

----
# Source:
Source