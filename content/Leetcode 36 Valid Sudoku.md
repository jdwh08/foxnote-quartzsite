---
aliases:
tags:
  - cs/leetcode/medium
  - cs/dsa/array/matrix
edited: 2025-08-30T13:24
created: 2025-07-23T18:42:00
---
# Problem:
Determine if a `9 x 9` Sudoku board is valid. Only the filled cells need to be validated **according to the following rules**:

1. Each row must contain the digits `1-9` without repetition.
2. Each column must contain the digits `1-9` without repetition.
3. Each of the nine `3 x 3` sub-boxes of the grid must contain the digits `1-9` without repetition.

**Note:**

- A Sudoku board (partially filled) could be valid but is not necessarily solvable.
- Only the filled cells need to be validated according to the mentioned rules.

#### Bounds


#### Examples
```
**Input:** board = 
[["5","3",".",".","7",".",".",".","."]
,["6",".",".","1","9","5",".",".","."]
,[".","9","8",".",".",".",".","6","."]
,["8",".",".",".","6",".",".",".","3"]
,["4",".",".","8",".","3",".",".","1"]
,["7",".",".",".","2",".",".",".","6"]
,[".","6",".",".",".",".","2","8","."]
,[".",".",".","4","1","9",".",".","5"]
,[".",".",".",".","8",".",".","7","9"]]
**Output:** true
```

```
**Input:** board = 
[["!8!","3",".",".","7",".",".",".","."]
,["6",".",".","1","9","5",".",".","."]
,[".","9","!8!",".",".",".",".","6","."]
,["8",".",".",".","6",".",".",".","3"]
,["4",".",".","8",".","3",".",".","1"]
,["7",".",".",".","2",".",".",".","6"]
,[".","6",".",".",".",".","2","8","."]
,[".",".",".","4","1","9",".",".","5"]
,[".",".",".",".","8",".",".","7","9"]]
**Output:** false
**Explanation:** Same as Example 1, except with the **5** in the top left corner being modified to **8**. Since there are two 8's in the top left 3x3 sub-box, it is invalid.
```

---
# Notes:
A reminder that if checking for uniqueness, a good way to do this is with [[Hashmap]], [[Set]], and [[Hash Function]]. 

---
# Attempts:

##### Attempt 1
Our input is a matrix, and our output is a bool for if we have a valid sudoku.
- Valid sudoku means that we have unique values for each row, col, and box.
- Box can be evaluated as $(row//3, col//3)$ using integer division.
- We can use a [[Set]] with [[Hash Function]] of value, row, col, box to do this

---
# Solution:

```python
class Solution:
    def isValidSudoku(self, board: List[List[str]]) -> bool:
        # matrix input, bool output
        # sudoku values are UNIQUE by row, col, row//3 & col//3
        # we can turn this into a hash.

        row_hashes: set[tuple[int, int]] = set()  # val, row
        col_hashes: set[tuple[int, int]] = set()  # val, col
        box_hashes: set[tuple[int, tuple[int, int]]] = set()  # val, boxrow boxcol

        BOARD_DIM = len(board)
        for row in range(BOARD_DIM):
            for col in range(BOARD_DIM):
                val = board[row][col]
                if val == ".":
                    continue
                
                # make the hash
                if (val, row) in row_hashes:
                    return False
                row_hashes.add((val, row))

                if (val, col) in col_hashes:
                    return False
                col_hashes.add((val, col))

                boxhash = (row//3, col//3)
                if (val, boxhash) in box_hashes:
                    return False
                box_hashes.add((val, boxhash))
        
        return True
```

----
# Source:
https://leetcode.com/problems/valid-sudoku/?envType=daily-question