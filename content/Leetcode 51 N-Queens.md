---
aliases: 
tags:
  - cs/leetcode/hard
  - cs/dsa/backtrack
  - todo
edited: 2025-08-10T14:14
created: 2025-07-23T18:42:00
---
# Problem:
The **n-queens** puzzle is the problem of placing `n` queens on an `n x n` chessboard such that no two queens attack each other.

Given an integer `n`, return _all distinct solutions to the **n-queens puzzle**_. You may return the answer in **any order**.

Each solution contains a distinct board configuration of the n-queens' placement, where `'Q'` and `'.'` both indicate a queen and an empty space, respectively.

#### Bounds


#### Examples
**Input:** `n = 4`
**Output:** `[[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]]`

---
# Notes:
[[Backtracking]], but this was fairly challenging mainly due to the optimization required to not TLE.

When optimizing backtracking, make sure you focus primarily on the looping conditions inside the backtrack function.

---
# Attempts:

##### Attempt 1
Coded up a oneshot beautiful solution where we accurately got all the answers... in too slow of a time for $n=8$.
- Specific function to check for queen stuff by using indexes (including for the diagonals)
- We loop through every square on the chessboard and our base case is when we have placed all n queens.
	- This means that our actual checking function was something like $O(4n)$, which we use $O(n^2 \times n!)$ times, i.e., $O(4n^3 n!)$ as [[Big O]], which is much too slow.

##### Attempt 2:
Yeah okay so we need to make some optimizations.
1. Store row and column information in hash sets for easy lookup time. Note that the diagonals have properties where either their sum or difference is constant, so we can hash those as well. This brings our checking function for if a square is attacked by a queen to be $O(1)$.

2. We are getting duplicate answers in Attempt 1, which is a signal that our original looping through every square on the chessboard is duplicating work.
	1. Instead of checking each square, we know that we only need to make one placement for each row/column.
	2. Thus, our backtracking condition should be the row (or column) index, and only a single inner loop over the column (or row) options.

---
# Solution:

```python
class Solution:
    def solveNQueens(self, n: int) -> List[List[str]]:
        # place n queens on a nxn chessboard so that no queens can attack
        # output is list of lists
        # we have tiny set
        # this is backtracking

        # at most 8 queens
        queen: list[list[bool]] = [
            [False for i in range(0, n)]
            for j in range(0, n)
        ]

        queen_cols: set[int] = set()
        fwd_diag: set[int] = set()  # 0,8 1,7 2,6 ...
        back_diag: set[int] = set()  # 0,0 1,1 2,2 ...

        ####################################################

        def convert_queen_to_str(qn: list[list[bool]]) -> list[str]:
            return [
                "".join([
                    "Q" if val else "."
                    for val in row
                ])
                for row in qn
            ]

        ####################################################
        output: list[list[str]] = []

        def backtrack(
            rowidx: int = 0,
        ) -> None:

            nonlocal queen

            # base case: no more queens
            if rowidx >= n:
                # add path to output
                path = convert_queen_to_str(queen)
                output.append(path)
                return

  

            # backtracking
            for colidx in range(0,n):
                if (
                    colidx in queen_cols
                    or (rowidx+colidx) in fwd_diag
                    or (rowidx-colidx) in back_diag
                ):

                # if attacked_by_queen(rowidx, colidx):
                    continue

                # place queen
                queen[rowidx][colidx] = True
                queen_cols.add(colidx)
                fwd_diag.add(rowidx+colidx)
                back_diag.add(rowidx-colidx)

                # backtrack
                backtrack(rowidx+1)

                # undo
                queen[rowidx][colidx] = False
                queen_cols.remove(colidx)
                fwd_diag.remove(rowidx+colidx)
                back_diag.remove(rowidx-colidx)

        backtrack()

        # convert output to correct format
        return output
```

----
# Source:
https://leetcode.com/problems/n-queens/description/