---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/graph
  - cs/dsa/dfs
  - todo
edited: 2025-08-12T15:20
created: 2025-07-23T18:42:00
---
# Problem:
You are given a 2-D matrix `board` containing `'X'` and `'O'` characters.

If a continous, four-directionally connected group of `'O'`s is surrounded by `'X'`s, it is considered to be **surrounded**.

Change all **surrounded** regions of `'O'`s to `'X'`s and do so **in-place** by modifying the input board.

#### Bounds
- `1 <= board.length, board[i].length <= 200`
- `board[i][j]` is `'X'` or `'O'`.

#### Examples
```java
Input: board = [
  ["X","X","X","X"],
  ["X","O","O","X"],
  ["X","O","O","X"],
  ["X","X","X","O"]
]

Output: [
  ["X","X","X","X"],
  ["X","X","X","X"],
  ["X","X","X","X"],
  ["X","X","X","O"]
]
```

---
# Notes:
This is a [[Graph]] based [[Depth First Search|DFS]] problem for traversal.

Don't forget in these problems that we can either go from source to target OR from target to source, since the graph is not directed.
- Often for trickier problems going backwards from target to source is easier.
- You should pick the one which has fewer initial starting places. In this case, the edge of the board. This is similar to [[Leetcode 417 Pacific Atlantic Water Flow]]. 

---
# Attempts:

##### Attempt 1
... A two pass [[Depth First Search|DFS]] solution where we find an "O" value, get the islands like in [[Leetcode 200 Number of Islands]], and then do a second [[Depth First Search|DFS]] or BFS to clear out each island? 
- DFS is more likely to dig to the edge of the board but in practice eh.

Bleh.

##### Attempt 2
No, much better to actually start from the edge of the board (since those positions are clear and there are only a few of them.)

---
# Solution:

```python

```

----
# Source:
Source