---
aliases: 
tags:
  - cs/leetcode/easy
  - cs/dsa/array/interval
edited: 2025-09-24T17:05
created: 2025-07-21T19:39
---
# Problem:
Given a set of intervals which represent meetings for a person, determine if they can attend all the meetings.

#### Bounds


#### Examples


---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
We sort the intervals by starting position. This is typically a good thing to do for interval problems.

Next, we check whether the meeting is between the prior meeting times.

---
# Solution:

```python
"""
Definition of Interval:
class Interval(object):
    def __init__(self, start, end):
        self.start = start
        self.end = end
"""

class Solution:
    def canAttendMeetings(self, intervals: List[Interval]) -> bool:
        # sort by interval start time
        # see next interval start is within prior interval start

        if len(intervals) == 0:
            return True

        intervals = sorted(
            intervals,
            key=lambda x: x.start,
        )

        previtv = intervals[0]
        for i in range(1, len(intervals)):
            itv = intervals[i]

            if previtv.start <= itv.start < previtv.end:
                # NOTE: itv.start = previtv.end is fine
                return False

            previtv = itv
        
        return True
```

----
# Source:
https://neetcode.io/problems/meeting-schedule