---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/array/interval
edited: 2025-09-24T17:05
created: 2025-07-21T19:39
---
# Problem:
Given an array of intervals `intervals` where `intervals[i] = [starti, endi]`, return _the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping_.

**Note** that intervals which only touch at a point are **non-overlapping**. For example, `[1, 2]` and `[2, 3]` are non-overlapping.

#### Bounds
- `1 <= intervals.length <= 10^5`
- `intervals[i].length == 2`
- `-5 * 10^4 <= starti < endi <= 5 * 10^4`

#### Examples


---
# Notes:
Notes

---
# Attempts:

##### Attempt 1


---
# Solution:

```python
class Solution:
    def eraseOverlapIntervals(self, intervals: List[List[int]]) -> int:
        # minimum number of intervals to remove to make non-overlapping

        # sort by left, then length
        intervals = sorted(
            intervals,
            key = lambda x: (x[0], (x[1]-x[0]))
        )

        num_removed = 0

        previtv = intervals[0]
        for idx in range(1, len(intervals)):
            itv = intervals[idx]
            # check for non-overlap
            if itv[0] >= previtv[1]:
                previtv = itv
                continue

            # set interval to current
            num_removed += 1
            # keep whichever interval ended earlier
            if itv[1] < previtv[1]:
                previtv = itv

        return num_removed
```

----
# Source:
https://leetcode.com/problems/non-overlapping-intervals/description/