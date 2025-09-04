---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/backtrack
edited: 2025-08-08T16:35
created: 2025-07-23T18:42:00
---
# Problem:
Given an array of **distinct** integers `candidates` and a target integer `target`, return _a list of all **unique combinations** of_ `candidates` _where the chosen numbers sum to_ `target`_._ You may return the combinations in **any order**.

The **same** number may be chosen from `candidates` an **unlimited number of times**. Two combinations are unique if the frequency of at least one of the chosen numbers is different.

The test cases are generated such that the number of unique combinations that sum up to `target` is less than `150` combinations for the given input.

#### Bounds
- `1 <= candidates.length <= 30`
- `2 <= candidates[i] <= 40`
- All elements of `candidates` are **distinct**.
- `1 <= target <= 40`

#### Examples
**Input:** `candidates = [2,3,6,7], target = 7`
**Output:** `[[2,2,3],[7]]`
**Explanation:**
2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
7 is a candidate, and 7 = 7.
These are the only two combinations.

**Input:** candidates = `[2]`, target = 1
**Output:** `[]`

---
# Notes:
List of combinations and the really low bounds means that [[Backtracking]] is the correct approach.

---
# Attempts:

##### Attempt 1
We use backtracking with a standard take/skip.
Bounds are if index reaches the end, or if sum is over the target.
- We need to keep track of the index, current sum, and current path.

Classic [[Take or Skip]] pattern with [[Recursion]] and [[Depth First Search|DFS]].

---
# Solution:

```python
class Solution:

    def combinationSum(self, nums: List[int], target: int) -> List[List[int]]:
        # given distinct nums
        # integer target
        # ALL UNIQUE COMBINATIONS OF NUMS SUMMING TO TARGET

        # same number may be taken unlimited number of times
        output: list[list[int]] = []

        def backtrack(index: int, cursum: int = 0, path: list[int] = []) -> None:
            # base case
            if cursum > target:
                # we've gone too far!
                return

            if index >= len(nums):
                # we've not gone far enough!
                return

            if cursum == target:
                # wohoo!
                output.append(path.copy())
                return

            # pre
            # recur
            # take
            take = nums[index]
            path.append(take)
            backtrack(index, cursum + take, path)

            # skip
            path.pop()
            backtrack(index+1, cursum, path)

            # post
            # return
            return

        backtrack(0,0,[])
        return output
```

----
# Source:
Source