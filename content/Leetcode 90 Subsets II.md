---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/backtrack
edited: 2025-08-08T18:24
created: 2025-07-23T18:42:00
---
# Problem:
Given an integer array `nums` that may contain duplicates, return _all possible_ **subsets** _(the power set)_.

The solution set **must not** contain duplicate subsets. Return the solution in **any order**.

#### Bounds
- `1 <= nums.length <= 10`
- `-10 <= nums[i] <= 10`

#### Examples
**Input:** `nums = [1,2,2]
**Output:** `[[],[1],[1,2],[1,2,2],[2],[2,2]]

---
# Notes:
Clearly backtracking because all possible subsets and small bounds.

---
# Attempts:

##### Attempt 1
We use the same [[Take or Skip]] process as in [[Leetcode 78 Subsets]], with the wrinkle that we have duplicates here so we skip over duplicated values with a while loop as in [[Leetcode 40 Combination Sum II]].

---
# Solution:

```python
class Solution:

    def subsetsWithDup(self, nums: List[int]) -> List[List[int]]:
        # return all subsets without duplicate subsets
        # aren't we going to use our same set[tuple[]] approach?

        output: set[tuple[int]] = set()
        # sort nums so key is consistent
        nums = sorted(nums)

        def backtrack(index: int, path: list[int] = []) -> None:
            output.add(tuple(path))  # we'll let set handle dupes
            # base case
            if index >= len(nums):
                return

            # backtrack
            # pre
            # recur
            ## choice
            taken = nums[index]
            path.append(taken)
            backtrack(index+1, path)
            ## undo
            path.pop()
            ## skip
            while index+1 < len(nums) and nums[index] == nums[index+1]:
                index += 1
            backtrack(index+1, path)
            # post
            # return
            return

        backtrack(0, [])

        final_output: list[list[int]] = [
            list(path)
            for path in output
        ]
        return final_output
```

----
# Source:
https://leetcode.com/problems/subsets-ii/