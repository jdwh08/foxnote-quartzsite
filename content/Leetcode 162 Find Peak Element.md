---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/search/binary
  - cs/dsa/array
edited: 2025-09-24T17:05
created: 2025-07-21T19:39
---
# Problem:
Problem Statement

#### Bounds
- `1 <= nums.length <= 1000`
- `-2^31 <= nums[i] <= 2^31 - 1`
- `nums[i] != nums[i + 1]` for all valid `i`.

#### Examples
```
**Input:** nums = [1,2,1,3,5,6,4]
**Output:** 5
**Explanation:** Your function can return either index number 1 where the peak element is 2, or index number 5 where the peak element is 6.
```

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
This is [[Binary Array Search]] but we're looking for either...
1. The first decreasing element
2. The last increasing element (our approach here)

We know this is [[Binary Array Search]] because...
1. We are looking at a [[Monotonic]] subsection of an [[Array]] (increasing, decreasing)
2. We are targeting a [[Big O]] of $\log n$ time.

To do this, we check each time if the value at mid is greater than prior value; if yes, then the peak must be within the mid-right range. Otherwise, the peak must be within the left-mid range.

We choose here to use an exclusive right, which means that we end when left+1 < right (or right-1).

---
# Solution:
```python
class Solution:
    def findPeakElement(self, nums: List[int]) -> int:
        # logn time suggests bsearch
        # we can convert array into
        # bools of whether arri > i-1
        # monotonically increasing during subsection so bsearch okay
        # search for last increasing or first decreasing

        left = 0
        right = len(nums)  # exclusive

        while left+1<right:
            mid = left+(right-left)//2
            midval = nums[mid]
            midprev = -float("inf") if mid <= 0 else nums[mid-1]

            if midval > midprev:
                left = mid
                continue
            elif midval <= midprev:
                right = mid
                continue

        return left
```

----
# Source:
https://leetcode.com/problems/find-peak-element