---
aliases:
tags:
  - cs/dsa/dp
  - cs/leetcode/medium
edited: 2025-08-30T18:57
created: 2025-07-23T18:42:00
---
# Problem:
You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and **it will automatically contact the police if two adjacent houses were broken into on the same night**.

Given an integer array `nums` representing the amount of money of each house, return _the maximum amount of money you can rob tonight **without alerting the police**_.

#### Bounds
- `1 <= nums.length <= 100`
- `0 <= nums[i] <= 400`

#### Examples
```
**Input:** nums = [1,2,3,1]
**Output:** 4
**Explanation:** Rob house 1 (money = 1) and then rob house 3 (money = 3).
Total amount you can rob = 1 + 3 = 4.
```

```
**Input:** nums = [2,7,9,3,1]
**Output:** 12
**Explanation:** Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
Total amount you can rob = 2 + 9 + 1 = 12.
```

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
Our input is an [[Array]], and our output is some maximization (robbed houses). Our choice at each step does not depend on anything but the index. Thus, it seems like [[Dynamic Programming]].

Our states are index.
Our transitions are ROB or SKIP.
- ROB transitions to the $i+2$ house.
- SKIP transitions to the $i+1$ house.

##### Attempt 2
Okay, so the issue is converting this [[Recursion]] based setup to an iterative based setup, and removing the extra memory so it $O(1)$ space.

Note that at each step we only care about two things: 
- Robbed value at prior house $i-1$
- Robbed value at priorprior house $i-2$

This suggests that we can maybe not even need to use a full $O(n)$ memo.

Neetcode makes the observation that for any given house $i$, we can either choose...
1. Rob house $i$ and the best portion of houses from $0:i-2$ (up to *prior-prior house*)
2. Skip house $i$ and rob the best portion of houses from $0:i-1$ (up to the *prior house*)

Afterwards, we move forward to the next house $i+1$. This means our frame of reference for the two options updates:
- Robbing house $i$ became robbing the *prior house*
- Skipping house $i$ and robbing up to $i-1$ became the *prior prior* house. 

---
# Solution:

```python
class Solution:
    def rob(self, nums: List[int]) -> int:
        # OH BOY I LOVE ROBBING

        # can't rob two houses next to each other
        # get maximum money

        # array input
        # max int output
        # suggests DP?
            # state = house index
            # actions: rob, norob
                # rob not okay if prior was robbed, i.e., we skip
            # track: total money
        
        # recurrence relation
        stolen_amt_memo: list[int] = [-1] * len(nums)
        best_amt_stolen: int = -1

        def stolen_amt_dp(index: int) -> int:
            nonlocal best_amt_stolen

            # base case
            if index >= len(nums):
                return 0
            
            # memo case
            if stolen_amt_memo[index] >= 0:
                return stolen_amt_memo[index]

            # recur
            # pre
            # recur
            ### STEAL
            steal = nums[index] + stolen_amt_dp(index+2)
            ### NOSTEAL
            nosteal = stolen_amt_dp(index+1)
            # post
            stolen_amt = max(steal, nosteal)
            stolen_amt_memo[index] = stolen_amt
            best_amt_stolen = stolen_amt if stolen_amt > best_amt_stolen else best_amt_stolen
            # return
            return stolen_amt

        stolen_amt_dp(0)
        return best_amt_stolen
```

```python
class Solution:
	def rob(self, nums: List[int]) -> int:
		prior_prior_houserob, prior_houserob = 0, 0

		for house in nums:
			cur_best_houserob = max(
				prior_prior_houserob + house,
				prior_houserob
			)
			prior_prior_houserob = prior_houserob
			prior_houserob = cur_best_houserob
		
		return prior_houserob
```

----
# Source:
https://leetcode.com/problems/house-robber/description/