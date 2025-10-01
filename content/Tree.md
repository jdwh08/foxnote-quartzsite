---
aliases:
tags:
  - cs/dsa/tree
edited: 2025-09-30T19:34
created: 2024-03-19T22:06
---
# Definition:
A data structure consisting nodes which connect to each other.
- Similar to [[Linked List]], but each node can have multiple connections
- Similar to [[Graph]], but there cannot be any [[Cycles]] for connections

![[Tree.png]]

---
# Notes:

### Terminology:
- Root: Parent Node
- Leaf: Node with no children.
- Height: Length of longest path from root to leaf.
- Balanced: When the children all have the same height
- Branching Factor: Number of children a tree will have. E.g., binary tree has branching factor 2.

### [[Tree Traversal]]

---
# Examples:

- [[Binary Tree]] is the most commonly used.

- Filesystems
- DOM
- Compilers (Abstract Syntax Tree)

----
# Source:
Source