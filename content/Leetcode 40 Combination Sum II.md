---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/backtrack
edited: 2025-08-08T16:41
created: 2025-07-23T18:42:00
---
# Problem:
Given a collection of candidate numbers (`candidates`) and a target number (`target`), find all unique combinations in `candidates` where the candidate numbers sum to `target`.

Each number in `candidates` may only be used **once** in the combination. (this is different from [[Leetcode 39 Combination Sum]])

**Note:** The solution set must not contain duplicate combinations.

#### Bounds
**Input:** candidates = `[10,1,2,7,6,1,5], target = 8
**Output:** 
```
[
	[1,1,6],
	[1,2,5],
	[1,7],
	[2,6]
]
```

#### Examples


---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
Isn't this basically the same thing as [[Leetcode 39 Combination Sum]], except that we are not allowed to reuse values?

##### Attempt 2
Oh, it's the issue with removing dupes -- if we don't sort the list of candidates ahead of time, we won't have the same keys for the set.

We can also add an optimization where we skip over value(s) which are duplicated using a while loop.

---
# Solution:

##### Attempt 1: Basic Backtracking
```python
class Solution:

    def combinationSum2(self, candidates: List[int], target: int) -> List[List[int]]:

        # candidates (may have dupes)
        # target (int)
        # all unique combos of candidates which sum to target
        # pick each element only once
        # no duplicate combinations?

        candidates = sorted(candidates)  # nlogn
        output: set[tuple[int]] = set()

        def backtrack(index: int, cursum: int, path: list[int]) -> None:
            # base case
            if cursum > target:
                return

            if cursum == target:
                output.add(tuple(path.copy()))
                return

            if index >= len(candidates):
                return

            # pre
            # recur
            ### take
            taken = candidates[index]
            path.append(taken)
            backtrack(index+1, cursum+taken, path)

            ### skip
            path.pop()  # undo
            while index + 1 < len(candidates) and candidates[index] == candidates[index+1]:
                index += 1
            backtrack(index+1, cursum, path)

            # post
            # return
            return

        backtrack(0, 0, [])

        # convert output from set[tuple[int]] to list[list[int]]

        final_output: list[list[int]] = [
            list(inner)
            for inner in output
        ]
        return final_output
```

----
# Source:
Source