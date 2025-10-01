---
aliases:
tags:
  - cs/dsa/tree/binary
  - todo
edited: 2025-09-30T19:34
created: 2024-03-19T22:06
---
# Definition:
A type of self-balancing [[Binary Search Tree]]. 

Alternatives: [[Red-Black Tree]].

---
# Notes:

### Theory
Suppose we have the numbers 10, 20, 30.
Depending on the order we insert them, we can arrive at the following cases:

![[_Media/Excalidraw/AVL Tree.png]]

Inserting a node into a [[Binary Search Tree|BST]] has four possible cases:
- LL - We can actually make the tree shorter by "rotating".
	- Make the middle one the root.
- LR
- RL
- RR

### Implementation
1. Calculate the "Balance Factor": we need the longest heights of the left and right subtrees to be within 1 of each other. $abs(bf) \le 1$
2. If imbalanced, then we need to perform a rotation.

#### Tree Rotations
- LL Case: This occurs when we have two Left Inserts. Make the middle node the new root.
- LR Case: This occurs when we have a Left-Right Insert. Make the middle node the new root.
	- First, swap LR and L.
	- Second, swap with the root.

### Comparison to [[Red-Black Tree]]
- AVL's rotations lead to a tree which is almost perfectly balanced all the time.
- This makes it GREAT for search
- However, rotations are slow for insertion and deletion.
- Thus, AVL is preferred when we don't change the tree much and search a lot.

---
# Examples:
Examples

----
# Source:
Source