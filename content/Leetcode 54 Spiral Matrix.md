---
aliases:
tags:
  - cs/leetcode/medium
  - cs/dsa/array/matrix
edited: 2025-09-05T17:27
created: 2025-07-23T18:42:00
---
# Problem:
Given an `m x n` `matrix`, return _all elements of the_ `matrix` _in spiral order_.

#### Bounds
- `m == matrix.length`
- `n == matrix[i].length`
- `1 <= m, n <= 10`
- `-100 <= matrix[i][j] <= 100`

#### Examples

| 1   | 2   | 3   | 4   | 5   |
| --- | --- | --- | --- | --- |
| 12  | 13  | 14  | 15  | 6   |
| 11  | 10  | 9   | 8   | 7   |

---
# Notes:
This is a standard pattern for traversing values a [[Matrix]] in a spiral pattern.

---
# Attempts:

##### Attempt 1
We can divide this into four quadrants: going right, going down, going left, going up. We continue until we have hit the end of a direction (border, already edited values).

Note that each cycle, we reduce the number of values we can go by one, so we can track the number of cycles.

##### Attempt 2
Actually a much more elegant way to think about this:
1. Each movement (right, down, left, up) is basically saying $dx, dy = -dy, dx$; e.g., if we start going right (1,0) then we next go down (0,-1).
2. We can encode our boundaries as whether row/col is outside the bounds OR we've already seen the value "."

---
# Solution:

```python
class Solution:
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        row, col = 0,-1
        NUM_ROWS = len(matrix)
        NUM_COLS = len(matrix[0])

        output: list[int] = []

        num_cycles: int = 0

        def go_right():
            nonlocal row, col
            colmax = NUM_COLS-num_cycles
            while col < colmax:
                output.append(matrix[row][col])
                col += 1
            
            # undo last col
            col -= 1
            # TODO: start going down
        
        def go_down():
            nonlocal row, col
            rowmax = NUM_ROWS-num_cycles
            while row < rowmax:
                output.append(matrix[row][col])
                row += 1
            
            # undo last row
            row -= 1
            # TODO: start going left
        
        def go_left():
            nonlocal row, col
            colmin = num_cycles
            while col >= colmin:
                output.append(matrix[row][col])
                col -= 1
            # undo last col
            col += 1
            # TODO: start going up
        
        def go_up():
            nonlocal row, col, num_cycles
            num_cycles += 1
            rowmin = num_cycles
            while row >= rowmin:
                output.append(matrix[row][col])
                row -= 1
            
            # undo last row
            row += 1
            # TODO: start going right

        prev_output_len = -float("inf")
        while len(output) != prev_output_len:
            prev_output_len = len(output)

            # start going right
            prevrow, prevcol = row, col
            col += 1
            go_right()
            if prevcol == col:
                break

            # start going down
            prevrow, prevcol = row, col
            row += 1
            go_down()
            if prevrow == row:
                break

            # start going left
            prevrow, prevcol = row, col
            col -= 1
            go_left()
            if prevcol == col:
                break

            # start going up
            prevrow, prevcol = row, col
            row -= 1
            go_up()
            if prevrow == row:
                break

        return output
```

```python
class Solution:
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        rows, cols = len(matrix), len(matrix[0])
        x, y, dx, dy = 0, 0, 1, 0
        res = []

        for _ in range(rows * cols):
            res.append(matrix[y][x])
            matrix[y][x] = "."

            if (
	            not 0 <= x + dx < cols
	            or not 0 <= y + dy < rows
	            or matrix[y+dy][x+dx] == "."
	        ):
                dx, dy = -dy, dx

            x += dx
            y += dy
        
        return res
```

----
# Source:
https://leetcode.com/problems/spiral-matrix/