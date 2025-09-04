---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/search/binary
edited: 2025-08-08T22:50
created: 2025-07-23T18:42:00
---
# Problem:
You are given an integer **mountain** array `arr` of length `n` where the values increase to a **peak element** and then decrease.

Return the index of the peak element.

Your task is to solve it in `O(log(n))` time complexity.

#### Bounds
- `3 <= arr.length <= 10^5`
- `0 <= arr[i] <= 10^6`
- `arr` is **guaranteed** to be a mountain array.

#### Examples
**Input:** `arr = [0,10,5,2]`
**Output:** 1

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
 We need some array search technique which is fast since $10^5$, at least linearish. Problem explicitly says [[Big O]] of logn.

 We can use [[Binary Array Search]] to find the first instance of values decreasing and call that the peak.
- No we don't need to check edge cases like "what if the peak is on the extreme left or right" because that's not valid.

---
# Solution:

```python
class Solution:

    def peakIndexInMountainArray(self, arr: List[int]) -> int:
        peak_idx = -1
        left = 0
        right = len(arr)-1

        while left <= right:
            mid = left + (right-left)//2
            # check condition
            if mid+1 < len(arr) and arr[mid] > arr[mid+1]:
                # we found a peak
                peak_idx = mid

                # all values right of this must be smaller
                right = mid-1
                continue

            # we did not find a peak
            # all values left of this must be increasing
            left = mid + 1

        return peak_idx
```

----
# Source:
https://leetcode.com/problems/peak-index-in-a-mountain-array/description/