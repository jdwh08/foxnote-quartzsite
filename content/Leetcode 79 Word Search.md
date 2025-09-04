---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/backtrack
edited: 2025-08-09T18:00
created: 2025-07-23T18:42:00
---
# Problem:
Given an `m x n` grid of characters `board` and a string `word`, return `true` _if_ `word` _exists in the grid_.

The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.

#### Bounds
- `m == board.length`
- `n = board[i].length`
- `1 <= m, n <= 6`
- `1 <= word.length <= 15`
- `board` and `word` consists of only lowercase and uppercase English letters.

#### Examples

| A   | B   | C   | E   |
| --- | --- | --- | --- |
| S   | F   | C   | S   |
| A   | D   | E   | E   |
**Input:** `word = "ABCCED"`
**Output:** true

**Input:** `word = "ABCB"`
**Output:** false

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
... do we save a path of files and check if the word is good at the end?
- NO! This is kinda like rewards in (reinforcement) learning where we really want faster reward feedback for good or bad things.
- We should instead check at each letter.

##### Attempt 2
- Turns out that doing `[] * len()` copies by reference not value. We need to copy by value.
- We also don't need to decrement wordidx because we pass that by value to the function, so there is no sticky side effect that must be undone when exiting the backtracking function unlike a pass-by-reference list or other thing.

##### Attempt 3
- We can improve efficiency by going backwards through the target word if the last letter is less common in the board.


---
# Solution:

```python
class Solution:

    def exist(self, board: List[List[str]], word: str) -> bool:
        # 2d grid board
        # string word
        # check if word is in grid
        # must form path
        # horizontal or vertical cells
        # cell cannot be used more than once.

        ROWS = len(board)
        COLS = len(board[0])
        board_seen: list[list[bool]] = [
	        [False for _ in range(COLS)]
	        for _ in range(ROWS)
	    ]  # if you use [] * len, it copies by REF not value.
        output: bool = False

        def backtrack(
            rowidx: int = 0,
            colidx: int = 0,
            wordidx: int = 0,
        ) -> bool:
            # base case
            if wordidx >= len(word):
                return True
            if rowidx < 0:
                return False
            if colidx < 0:
                return False
            if rowidx >= ROWS:
                return False
            if colidx >= COLS:
                return False
            if board_seen[rowidx][colidx]:
                return False
            if board[rowidx][colidx] != word[wordidx]:
                return False

            # backtracking
            # pre
            board_seen[rowidx][colidx] = True
            wordidx += 1
            # recur
            ## choices
            left = backtrack(rowidx, colidx-1, wordidx)
            right = backtrack(rowidx, colidx+1, wordidx)
            up = backtrack(rowidx-1, colidx, wordidx)
            down = backtrack(rowidx+1, colidx, wordidx)
            ## check
            output = left or right or up or down
            ## undo
            board_seen[rowidx][colidx] = False

            # NOTE: we don't need to undo the wordidx because
            # we pass by VALUE, no modifications once come back

            # post
            # return
            return output

        for row in range(0, ROWS):
            for col in range(0, COLS):
                if backtrack(row, col):
                    return True

        return False
```

----
# Source:
https://leetcode.com/problems/word-search/description/
