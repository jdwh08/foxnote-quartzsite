---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/backtrack
  - todo
edited: 2025-08-08T18:05
created: 2025-07-23T18:42:00
---
# Problem:
Given an array `nums` of distinct integers, return all the possible Permutations. You can return the answer in **any order**.

#### Bounds
- `1 <= nums.length <= 6`
- `-10 <= nums[i] <= 10`
- All the integers of `nums` are **unique**.

#### Examples
**Input:** nums = `[1,2,3]`
**Output:** `[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]`

---
# Notes:
Lessons learned:
- You can keep and pass a "state" list.

---
# Attempts:

##### Attempt 1
Need to think about this. We can't do a typical [[Take or Skip]] pattern with a branch, since there are many different numbers.
- Hint suggesting that we should keep track of which ones were taken.
- This suggests we use some kind of array instead with a for loop.

---
# Solution:

```python
class Solution:

    def permute(self, nums: List[int]) -> List[List[int]]:
        output: list[list[int]] = []

        def backtrack(path: list[int]=[], needs_picked: list[bool]=[True]*len(nums)) -> None:

            # base case
            if len(path) == len(nums):
                output.append(path.copy())
                return

            for i, pick in enumerate(needs_picked):
                if not pick:
                    continue

                # go
                path.append(nums[i])
                needs_picked[i] = False
                backtrack(path, needs_picked)

                # undo
                path.pop()
                needs_picked[i] = True

        backtrack()
        return output
```

----
# Source:
https://leetcode.com/problems/permutations/description/