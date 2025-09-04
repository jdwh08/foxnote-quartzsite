---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/array/slidingwindow
edited: 2025-08-13T21:37
created: 2025-07-23T18:42:00
---
# Problem:
Given an integer [[Array]] of numbers, find all triplets which sum to zero. Do not include any duplicate triplets.

#### Bounds
- `3 <= nums.length <= 3000`
- `-10^5 <= nums[i] <= 10^5`

#### Examples
**Input:** `nums = [-1,0,1,2,-1,-4]`
**Output:** `[[-1,-1,2],[-1,0,1]]`
**Explanation:** 
`nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.`
`nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.`
`nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.`
The distinct triplets are `[-1,0,1]` and `[-1,-1,2]`.
Notice that the order of the output and the order of the triplets does not matter.

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
This is [[Leetcode 1 Two Sum]], but with a third outer bit. 
We handle the inner pointer stuff easily thanks to [[Sliding Window]].

---
# Solution:

```python
class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        nums.sort()
        output = []

        for index in range(0, len(nums)-2):
            a = nums[index]
            if ((index > 0) and (a == nums[index-1])):
                continue
            
            # TwoSum Sorted
            lndex = index + 1
            rndex = len(nums) - 1

            while (lndex < rndex):
                sum = (a + nums[lndex] + nums[rndex])
                if (sum > 0):
                    rndex -= 1
                elif (sum < 0):
                    lndex += 1
                else:
                    output.append([a, nums[lndex], nums[rndex]])
                    lndex += 1
                    while (nums[lndex] == nums[lndex-1] and lndex < rndex):
                        lndex += 1
        
        return (output)
```

----
# Source:
https://leetcode.com/problems/3sum/description/