---
aliases: 
tags:
  - cs/leetcode/medium
  - todo
  - cs/dsa/backtrack
edited: 2025-08-09T19:41
created: 2025-07-23T18:42:00
---
# Problem:
Given a string `s`, partition `s` such that every of the partition is a **PALINDROME**. Return _all possible palindrome partitioning of_ `s`.

#### Bounds
- `1 <= s.length <= 16`
- `s` contains only lowercase English letters.

#### Examples
**Input:** s = "aab"
**Output:** `[["a","a","b"],["aa","b"]]`

---
# Notes:
- Don't forget about [[Sliding Window]] pattern for use with subarrays
- Don't forget palindromes with the `[: :-1]` trick
- 

---
# Attempts:

##### Attempt 1
We can use [[Backtracking]] to get all possible combinations. The question is how do we handle the states and transitions.

- I was thinking we store a start index and end index, and then loop through the value(s) in the middle (with each value as a state)
	- This kinda falls apart when thinking about how to pass information on to the path. We'd have to check if the current start-end is a palindrome and if it is add it to path, but then we'd also need to check the stuff underneath it (bleh).

##### Attempt 2
We should use [[Take or Skip]]...
- Our take action is to make a partition from start-end (if it is a valid palindrome)
- Our skip action is to move to the next letter in the window.

- Our break condition then becomes if we reach the end, instead of a much more awkward break condition for the two-pointer-middle strategy.
- This is much more natural as a [[Sliding Window]]
	- We should use a sliding window over the two pointer middle because we are looking for subarrays(!) Duh.


---
# Solution:

```python
class Solution:

    def partition(self, s: str) -> List[List[str]]:
        # split s into substrings where each substring is a palindrome
        # return list of list of possible palindromes.

        # single letter is a palindrome of itself.

        # start_idx
        # end_idx (inclusive)
        # for idx in range(start, end+1)
            # split word
            # backtrack the two portions?

        output: list[list[str]] = []
        def backtrack(start_idx: int, end_idx: int, path: list[str]):
            """Given start, end, and cur path, split values and return if partition possible."""

            # base case
            if end_idx >= len(s):
                # we're done
                if start_idx == end_idx:
                    # this is a full palindrome
                    output.append(path.copy())
                return

            # entire section choice is palindrome (we partition)
            section = s[start_idx:end_idx+1]
            if section == section[::-1]:
                # this is a palindrome!
                partition_possible = True
                path.append(section)
                # update indicies accordingly
                backtrack(end_idx+1, end_idx+1, path)
                # undo
                path.pop()

            # keep going
            backtrack(start_idx, end_idx+1, path)

        backtrack(0,0,[])
        return output
```

----
# Source:
https://leetcode.com/problems/palindrome-partitioning/