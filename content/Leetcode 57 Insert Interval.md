---
aliases:
tags:
  - cs/leetcode/medium
  - cs/dsa/array/interval
  - cs/dsa/greedy
edited: 2025-09-09T11:02
created: 2025-07-21T19:39
---
# Problem:
You are given an array of non-overlapping intervals `intervals` where `intervals[i] = [start_i, end_i]` represents the start and the end time of the `ith` interval. `intervals` is initially sorted in ascending order by `start_i`.

You are given another interval `newInterval = [start, end]`.

Insert `newInterval` into `intervals` such that `intervals` is still sorted in ascending order by `start_i` and also `intervals` still does not have any overlapping intervals. You may merge the overlapping intervals if needed.

Return `intervals` after adding `newInterval`.

Note: Intervals are _non-overlapping_ if they have no common point. For example, `[1,2]` and `[3,4]` are non-overlapping, but `[1,2]` and `[2,3]` are overlapping.

#### Bounds
- `0 <= intervals.length <= 104`
- `intervals[i].length == 2`
- `0 <= starti <= endi <= 105`
- `intervals` is sorted by `starti` in **ascending** order.
- `newInterval.length == 2`
- `0 <= start <= end <= 105`

#### Examples
```
Input: intervals = [[1,3],[4,6]], newInterval = [2,5]
Output: [[1,6]]

Input: intervals = [[1,2],[3,5],[9,10]], newInterval = [6,7]
Output: [[1,2],[3,5],[6,7],[9,10]]
```

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
We should think about the possible scenarios when we add an interval.

A: There are no overlaps.
```
___
	___
		|___|
			  ____
```

B. There are overlaps with the prior interval(s)
```
___
	___
  |_________|
			  ____
```

C. There are overlaps with the following interval(s).
```
___
	___
         |_________|
			  ____
```

We need some way to detect overlaps.
Overlap occurs when candidate interval left occurs between the parent interval, i.e., `itvleft[0] <= itvcandidate[0] <= itvleft[1]`

We can divide the intervals into sections.
1. Intervals clearly before our new interval, i.e., their right is strictly less than new left.
	1. These can be directly added to the output.
2. An interval overlapping from the left.
	1. This needs to be merged with our new interval, i.e., left and right set to max.
	2. There can only be one of these, because the original intervals had no overlaps, and we've already removed all intervals left of the new one.
3. Any interval(s) overlapping from the right.
	1. We'll have to loop over all of these and add to the right of new interval.

Finally, we can add the new interval and any remaining intervals that still exist after handling overlaps.

### Attempt 2
Okay we can make this much better with a [[Greedy Algorithm]]. Loop over intervals
1. If our new interval is clearly before our loop interval, we're done. Add the new interval, remaining intervals, and return.
2. If our new interval is clearly after our loop interval, there's no overlap. We can add the loop interval into the output and continue
3. Otherwise, we have some overlap which means we merge the intervals together into NewInterval.

---
# Solution:

```python
class Solution:
    def insert(
        self,
        intervals: List[List[int]],
        newInterval: List[int]
    ) -> List[List[int]]:
        output: list[list[int]] = []

        # edge case where intervals length is zero
        if len(intervals) <= 0:
            output.append(newInterval)
            return output

        # add all intervals whose right < new left
        idx = 0
        while idx < len(intervals):
            itv = intervals[idx]
            if itv[1] >= newInterval[0]:
                break

            output.append(itv)
            idx += 1

        # handle overlaps...
        # with prior interval
        if (
	        (idx < len(intervals)) 
	        and (intervals[idx][0] <= newInterval[0] <= intervals[idx][1])
	    ):
            # combine them together.
            newInterval[0] = min(intervals[idx][0], newInterval[0])
            newInterval[1] = max(intervals[idx][1], newInterval[1])
            idx += 1

        # with future intervals
        while idx < len(intervals):
            if newInterval[0] <= intervals[idx][0] <= newInterval[1]:
                # combine them together.
                newInterval[1] = max(intervals[idx][1], newInterval[1])
                idx += 1
            else:
                break

        # add to output
        output.append(newInterval)
        if idx < len(intervals):
            output.extend(intervals[idx:])
        return output
```

```python
class Solution:
	def insert(
        self,
        intervals: List[List[int]],
        newInterval: List[int]
    ) -> List[List[int]]:
	    output: list[list[int]] = []
	    
	    # NOTE: this is cleaner but actually slower!

	    for idx, itv in enumerate(intervals):
		    # itv clearly after newInterval
		    if itv[0] > newInterval[1]:
			    # we're done!
			    output.append(newInterval)
			    output.extend(intervals[idx:])
			    return output
			# itv clearly before newInterval
			elif itv[1] < newInterval[0]:
				# can safely add
				output.append(itv)
			else:
				# we have to merge them
				newInterval = [
					min(newInterval[0], itv[0]),
					max(newInterval[1], itv[1])
				]
		
		# itv is done, so our newinterval must be at the end.
		output.append(newInterval)
		return output
```

----
# Source:
https://leetcode.com/problems/insert-interval/
