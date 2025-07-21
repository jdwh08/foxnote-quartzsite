---
aliases: 
tags:
  - cs/dsa
  - cs/leetcode
edited: 2025-07-20T22:09
created: 2024-03-19T22:06
---
# Definition:
A [[ArrayList|list]] of numbers which are a cumulative total.

---
# Notes:

Very useful when we want to keep track of values across indices.

Time Complexity: [[Big O|O(n)]]
Space Complexity: [[Big O|O(n)]]

---
# Examples:
```python
def runningSum(nums: list[float]) -> list[float]:
    result = [nums[0]]

    for i in range(1, len(nums)):
        result.append(result[i - 1] + nums[i])

    return result
```

----
# Source:
Source