---
aliases: 
tags:
  - cs/dsa/backtrack
  - cs/leetcode
edited: 2025-08-15T08:00
created: 2024-03-19T22:06
---
# Definition:
An [[Data Structures and Algorithms|algorithm]] which explores all possible paths for a solution by stopping and going backwards once the end is reached. 

This is systematic [[Brute Force]] of all combinations, hence slow.

---
# Notes:

You can (and probably should?) write this out like a [[Decision Trees|decision tree]] which is explored via [[Depth First Search|DFS]].
- Each node is a decision point
- Each branch is an action you can take

It is important to determine...
1. What is your base case for copying the path to the solution?
2. What choices are you making?
3. What constraint(s) exist for each choice?

```python
# General Backtracking Algorithm

def backtrack(start_idx, path, **params: Any):
	if base_case:  # hit end of the road
		results.append(solution.copy())
		return

	choices = get_choices(start_idx, ...)
	for choice in choices:
		if not valid(choice):
			continue

		make_choice()  # add to path, update additional states
		backtrack(start_idx + len(choice), path, ...)
		undo_choice()  # backtrack here!
```

Also note that the undo should focus ***only*** on values which were modified in the `backtrack` function and need to be un-modified. I.e., [[Pass by Reference]] as opposed to [[Pass by Value]].

It can sometimes be helpful to use a [[Stack]] to do/undo things.

---
# Examples:
- [[Leetcode 78 Subsets]]
- [[Leetcode 39 Combination Sum]]
- [[Leetcode 40 Combination Sum II]]
- [[Leetcode 46 Permutations]]
- [[Leetcode 37 Sudoku Solver]]
- [[Leetcode 51 N-Queens]]

----
# Source:
https://www.youtube.com/watch?v=p9m2LHBW81M
