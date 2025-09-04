---
aliases: 
tags:
  - cs/leetcode
  - cs/dsa/backtrack
edited: 2025-07-30T17:32
created: 2024-03-19T22:06
---
# Problem:
Given an integer [[ArrayList|list]] `nums` of **unique** elements, return _all possible_ subsets _(the [[Power Set]])_.

The solution set **must not** contain duplicate subsets. Return the solution in **any order**.

#### Bounds
- `1 <= nums.length <= 10`
- `-10 <= nums[i] <= 10`
- All the numbers of `nums` are **unique**.

#### Examples
**Input:** `nums = [1,2,3]`
**Output:** `[[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]`


---
# Notes:
The low value for the bounds means we are okay to do a very slow solution like recursion or brute or backtracking.

We know from the Neetcode category this is a [[Backtracking]] problem.
We also know that the output is a list of lists suggesting Backtracking.

We can kinda think about this like DP?
- States are the numbers
- Actions are the Take-Skip pattern
	- We check the "Take" path
	- We then undo our thing
	- We check the "Skip" path

1. Base Case: end of numbers
2. Choices: Take/Skip
3. Constraints: No constraints for actions
4. Backtrack: Undo the take action


Why can't we have Skip first before Take?
- The order we do the actions in matters because it controls when we append to the list of paths.
- If we do skip before take, it's like a DFS so the last value will be appended first, e.g., `[3,2,3]`.

---
# Attempts:

##### Attempt 1
We basically got this solved as our intro to Backtracking.


---
# Solution:

```python
class Solution:

    def subsets(self, nums: List[int]) -> List[List[int]]:
        output: list[list[int]] = []

        def backtrack(index: int, path: list[int]) -> None:
            # base case
            if index >= len(nums):
                output.append(path.copy())
                return

            # Take
            path.append(nums[index])
            backtrack(index+1, path)

            # Skip
            path.pop()  # undo this!
            backtrack(index+1, path)

        backtrack(0, [])
        return output
```

----
# Source:
https://leetcode.com/problems/subsets/description/
https://neetcode.io/problems/subsets?list=neetcode150