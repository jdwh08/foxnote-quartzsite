---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/heap
edited: 2025-08-04T20:25
created: 2025-07-23T18:42:00
---
# Problem:
Given an array of `points` where `points[i] = [xi, yi]` represents a point on the **X-Y** plane and an integer `k`, return the `k` closest points to the origin `(0, 0)`.

The distance between two points on the **X-Y** plane is the Euclidean distance (i.e., `√(x1 - x2)^2 + (y1 - y2)^2`).

You may return the answer in **any order**. The answer is **guaranteed** to be **unique** (except for the order that it is in).

#### Bounds
- `1 <= k <= points.length <= 10^4`
- `-10^4 <= xi, yi <= 10^4`

#### Examples
**Input:** points = `[[1,3],[-2,2]], k = 1
**Output:** `[[-2,2]]
**Explanation:**
The distance between (1, 3) and the origin is sqrt(10).
The distance between (-2, 2) and the origin is sqrt(8).
Since sqrt(8) < sqrt(10), (-2, 2) is closer to the origin.
We only want the closest k = 1 points from the origin, so the answer is just `[[-2,2]].

---
# Notes:
TL;DR -- when building the [[Heap]], we can use the first value as the "key" for sorting, and bundle the remaining info in the tuple.

---
# Attempts:

##### Attempt 1


---
# Solution:

```python
class Solution:

    def kClosest(self, points: List[List[int]], k: int) -> List[List[int]]:
        # simplest solution would be to make a sorted array of distances
        # with indices.

        # however, we need our solution to be in O(k log(n))
        # not O(n log(n)) therefore we need something faster
        # main way to do this faster for max/min-k is HEAP
        # we'll use a min heap of distances

        vals: list[tuple[float, int, int]] = [
	        (
		        x**2 + y**2,  # sorting key
		        x,            # payload
		        y
		    )
		    for x, y in points
	    ]

        heapq.heapify(vals)
        output = []

        i = 0
        while i < k:
            _, x, y = heapq.heappop(vals)
            output.append([x, y])
            i+=1

        return output
```

----
# Source:
https://neetcode.io/problems/k-closest-points-to-origin?list=neetcode150