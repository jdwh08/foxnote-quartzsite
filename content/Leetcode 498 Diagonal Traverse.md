---
aliases:
tags:
  - cs/leetcode/medium
  - cs/dsa/array/matrix
edited: 2025-09-05T21:45
created: 2025-07-21T19:39
---
# Problem:
Problem Statement

#### Bounds


#### Examples


---
# Notes:
- Hashing values which are diagonal involve $i+j$ or $i-j$. 

---
# Attempts:

##### Attempt 1


---
# Solution:

```python
class Solution:
    def findDiagonalOrder(self, mat: List[List[int]]) -> List[int]:
        diagrightvals: dict[int, list[int]] = defaultdict(list)

        ROWS = len(mat)
        COLS = len(mat[0])

        for row in range(ROWS):
            for col in range(COLS):
                diagkey = row + col
                diagrightvals[diagkey].append(mat[row][col])
        
        diagrightvals = {
	        k: v for (k, v) in sorted(diagrightvals.items())
	    }
        output: list[int] = []
        flipper = True
        for _, diagvals in diagrightvals.items():
            if flipper:
                diagvals = reversed(diagvals)
            output.extend(diagvals)
            flipper = not flipper

        return output
```

----
# Source:
https://leetcode.com/problems/diagonal-traverse/