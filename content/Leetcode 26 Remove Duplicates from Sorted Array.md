---
aliases: 
tags:
  - cs/leetcode/easy
  - todo
edited: 2025-08-07T19:46
created: 2025-07-23T18:42:00
---
# Problem:
Problem Statement

#### Bounds


#### Examples


---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
... I really have no idea why I keep failing this particular challenge. Yes I know we can do it with python, but I specifically want to do it with a while loop and checking.

Bloody hell.
#todo 

##### Attempt 2
Okay, so this is an [[Array Frontier]] pattern with basic sorting. Don't try and do it with prior checks.

---
# Solution:

```python
class Solution:
    def removeDuplicates(self, nums: List[int]) -> int:
        # frontier sorting
        read_idx = 1
        write_idx = 1

        while read_idx < len(nums):
            # check if current element is different from prior
            if nums[read_idx] != nums[write_idx-1]:
                nums[write_idx] = nums[read_idx]
                write_idx += 1
            read_idx += 1

        return write_idx
```

----
# Source:
Source