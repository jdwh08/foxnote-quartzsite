---
aliases:
tags:
  - cs/leetcode/medium
  - cs/dsa/array/matrix
edited: 2025-09-05T19:02
created: 2025-07-21T19:39
---
# Problem:
You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).

You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.

#### Bounds
- `n == matrix.length == matrix[i].length`
- `1 <= n <= 20`
- `-1000 <= matrix[i][j] <= 1000`

#### Examples

| 1   | 2   | 3   |
| --- | --- | --- |
| 4   | 5   | 6   |
| 7   | 8   | 9   |

| 7   | 4   | 1   |
| --- | --- | --- |
| 8   | 5   | 2   |
| 9   | 6   | 3   |

---
# Notes:
For [[Matrix]] manipulation, traditional matrix operations still can apply! 

Think about matrix operations and vectorization!
- 90 degree clockwise: $i,j \rightarrow j,-i$; i.e., a transpose and then flip columns
- 180 degree: $i,j = -i,-j$; i.e., flip rows and flip columns
- 270 degree clockwise: $i,j \rightarrow -j, i$; i.e., a transpose and then flip rows

---
# Attempts:

##### Attempt 1
While I know geometrically that this maps points $i,j \rightarrow j, -i$, it was easier to see it in terms of pairwise swaps.

For some strange reason I thought it would be okay to do all four swaps for some i,j point and then iterate through the points.

##### Attempt 2
No you silly.

We can think about this using [[Matrix]] and operations!
- $i,j \rightarrow j,-i$ can be converted into...
- [[Matrix Transpose]]: $i,j \rightarrow j,i$ 
- Invert the new columns $j,i \rightarrow j,-i$


---
# Solution:

```python
class Solution:
    def rotate(self, matrix: List[List[int]]) -> None:
        """
        Do not return anything, modify matrix in-place instead.
        """
        # in a 90deg clock rotation
        # row, col -> col, N-1-row
        # this is basically a transpose and then reverse across y values.

        matrix_size = len(matrix)

        # transpose
        for row in range(matrix_size):
            for col in range(row+1, matrix_size):
                matrix[row][col], matrix[col][row] = matrix[col][row], matrix[row][col]

        # reverse y
        for row in range(matrix_size):
            for col in range(matrix_size//2):
                colflip = matrix_size-1 - col
                matrix[row][colflip], matrix[row][col] = matrix[row][col], matrix[row][colflip]

```

----
# Source:
https://leetcode.com/problems/rotate-image/