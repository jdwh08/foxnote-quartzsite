---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/heap
edited: 2025-09-24T17:05
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
... can't we just do this as a [[Heap|Min Heap]]?

**Boundary** [[Big O]]
- Lower: We need at least $O(k)$ to get values.
- Upper: 10^4 implies at least linearish time. Sorting would be $O(n \log n)$.

A min heap certainly would work, being $O(n) + O(k \log n)$ for the values.

##### Attempt 2
We can actually do it differently...
1. Note that we only need to store $k$ values in the heap at most.
2. We can use the heap as our backing data structure and thus not need to add even more memory.
3. Change it to be a MAX HEAP and pop out all of the values which are too large
4. The resulting values must be the minimums. 

This would be $O(n \log k)$. Eh... maybe worse. Runtime says so.

###### Alternatives:
1. [[Quickselect]] apparently works, but I can't remember that algo for the life of me.
2. [[Divide and Conquer]] by proxy would be $O(n)$ time? 

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

```python
        maxheap: list[tuple[float, int, int]] = []
        heaplen = 0

        for (x,y) in points:
            dist = x*x + y*y
            heapq.heappush(maxheap, (-dist, x, y))
            heaplen += 1
            
            if heaplen > k:
                heapq.heappop(maxheap)  # remove largest values.

        return [(x, y) for (_, x, y) in maxheap]
```

----
# Source:
https://neetcode.io/problems/k-closest-points-to-origin?list=neetcode150