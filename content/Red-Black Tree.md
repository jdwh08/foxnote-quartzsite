---
aliases: 
tags:
  - cs/dsa/tree/binary
  - todo
edited: 2025-07-27T16:11
created: 2024-03-19T22:06
---
# Definition:
A type of self-balancing [[Binary Search Tree]] based on colouring nodes.

---
# Notes:

You colour all nodes RED or BLACK based on the following principles:
- #todo

You need to ensure that we do not have two nodes of the same colour touching.

### Comparison to [[AVL Tree]]
- Red-Black rule is more computationally efficient than AVL's rotations.
- However, it doesn't balance the tree nearly as well at all times.
- Thus Red-Black is preferred when we need to insert and delete from the tree a lot.

---
# Examples:
Examples

----
# Source:
Source