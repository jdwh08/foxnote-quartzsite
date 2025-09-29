---
aliases:
tags:
  - cs/leetcode/medium
  - cs/dsa/array/interval
edited: 2025-09-09T16:47
created: 2025-07-21T19:39
---
# Problem:
Given an array of `intervals` where `intervals[i] = [start_i, end_i]`, merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

You may return the answer in **any order**.

Note: Intervals are _non-overlapping_ if they have no common point. For example, `[1, 2]` and `[3, 4]` are non-overlapping, but `[1, 2]` and `[2, 3]` are overlapping.

#### Bounds
- `1 <= intervals.length <= 10^4`
- `intervals[i].length == 2`
- `0 <= starti <= endi <= 10^4`

#### Examples
```
Input: intervals = [[1,3],[1,5],[6,7]]

Output: [[1,5],[6,7]]
```

---
# Notes:
- Sorting for intervals is usually pretty good.
- 

---
# Attempts:

##### Attempt 1
We should sort the values since it's an interval problem. I'll sort based on the left index, because that's usually the setup.

Next, we go through the intervals, and check if we have overlapping with the standard `prev[0] <= cur[0] <= prev[1]` setup.
If there is overlapping, we merge into prev using max right.
If there is not overlapping, we append to the end.

We add the final result and voila.

---
# Solution:

```python
class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        # merge all overlapping intervals
        # return array of non-overlapping
        # any order!

        # note: this is not sorted.

        # sort by startidx
        intervals = sorted(
            intervals,
            key=lambda x: x[0],
        )

        output: list[list[int]] = []
        previtv = intervals[0]

        for idx in range(1, len(intervals)):
            itv = intervals[idx]

            # check if need merge
            if previtv[0] <= itv[0] <= previtv[1]:
                # overlap, merge
                previtv[1] = max(previtv[1], itv[1])
            else:
                # no overlap, continue
                output.append(previtv)
                previtv = itv
        
        output.append(previtv)
        return output
```

----
# Source:
https://leetcode.com/problems/merge-intervals/description/