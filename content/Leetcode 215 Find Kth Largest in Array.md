---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/search/quickselect
edited: 2025-08-06T20:28
created: 2025-07-23T18:42:00
---
# Problem:
Given an integer array `nums` and an integer `k`, return _the_ `kth` _largest element in the array_.

Note that it is the `kth` largest element in the sorted order, not the `kth` distinct element.

Can you solve it without sorting?

#### Bounds
- `1 <= k <= nums.length <= 10^5`
- `-10^4 <= nums[i] <= 10^4`

#### Examples
**Input:** `nums = [3,2,1,5,6,4], k = 2`
**Output:** 5

---
# Notes:
Why not a Max-[[Heap]]?

Turns out, there's also [[Quickselect]]... though that is slightly annoying to remember.

---
# Attempts:

##### Attempt 1
We use a max heap which gets the top K values in the array.



---
# Solution:

```python
class Solution:
    def findKthLargest(self, nums: List[int], k: int) -> int:
        # max heap so we get k log(n)
        h = [-n for n in nums]
        heapq.heapify(h)

        while k > 1:
            heapq.heappop(h)
            k -= 1

        return -heapq.heappop(h)
```

----
# Source:
Source