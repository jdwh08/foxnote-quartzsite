---
aliases: 
tags:
  - cs/leetcode/easy
  - cs/dsa/array
edited: 2025-08-08T21:44
created: 2025-07-23T18:42:00
---
# Problem:
Given an array of integers `nums` and an integer `target`, return _indices of the two numbers such that they add up to `target`_.

You may assume that each input would have **_exactly_ one solution**, and you may not use the _same_ element twice.

You can return the answer in any order.

#### Bounds
- `2 <= nums.length <= 10^4`
- `-10^9 <= nums[i] <= 10^9`
- `-10^9 <= target <= 10^9`
- **Only one valid answer exists.**

#### Examples
**Input:** `nums = [2,7,11,15], target = 9
**Output:** `[0,1]
**Explanation:** Because `nums[0] + nums[1] == 9`, we return `[0, 1]`.

---
# Notes:
The iconic.

We use a [[Hashmap]] to save values in the array.

---
# Attempts:

##### Attempt 1
Save your complement's index in the hashmap.

---
# Solution:

```python
class Solution:

    def twoSum(self, nums: List[int], target: int) -> List[int]:
        targets: dict[int, int] = {}
        for i, num in enumerate(nums):
            if num in targets:
                return [i, targets[num]]
            targets[target - num] = i
```

----
# Source:
https://leetcode.com/problems/two-sum/description/