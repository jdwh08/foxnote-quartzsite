---
aliases:
tags:
  - cs/leetcode/medium
  - cs/dsa/dp
edited: 2025-08-30T19:13
created: 2025-07-23T18:42:00
---
# Problem:
You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed. All houses at this place are **arranged in a circle.** That means the first house is the neighbor of the last one. Meanwhile, adjacent houses have a security system connected, and **it will automatically contact the police if two adjacent houses were broken into on the same night**.

Given an integer array `nums` representing the amount of money of each house, return _the maximum amount of money you can rob tonight **without alerting the police**_.

NOTE: 
- Basically [[Leetcode 198 House Robber]] except now we have a circle of houses, so there is "wrap-around" neighbours from index $0$ to $len-1$.

#### Bounds
- `1 <= nums.length <= 100`
- `0 <= nums[i] <= 100`

#### Examples
```java
Input: nums = [2,9,8,3,6]

Output: 15
```

Explanation: 
- You cannot rob `nums[0] + nums[2] + nums[4] = 16` because `nums[0]` and `nums[4]` are adjacent houses (unlike in the prior House Robber). 
- The maximum you can rob is `nums[1] + nums[4] = 15`.

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
Okay we start with the recursive solution. We know this is clearly [[Dynamic Programming]] since it's the sequel to the prior DP problem. 

The main question is how we deal with the circular houses.
Doing some whiteboarding, we see that this mainly affects checking the final house, i.e., if we are at the final house index and we also robbed house 0.

This means our DP now has two dimensions: the index that we are at, and a boolean for whether we robbed house 0 or not.

##### Attempt 2
And that is an inefficient solution since we make memory of size $O(2n)$. So how do we shrink this even further?

The wraparound only affects the house selection in two ways: 
1. We pick the first house, we can't pick the last house.
2. We don't pick the first house, we can pick the last house.

This means that we can use the solution from [[Leetcode 198 House Robber]], but do it twice!

---
# Solution:

```python
class Solution:
    def rob(self, nums: List[int]) -> int:
        # houses are in a CIRCLE!
        # cannot rob two adjacent houses

        # maximum amount without alerting

        # this is the same as house robber, except we
        # need some conditions for "stopping" in DP
        # and to handle the wrap-around stuff.

        # [1, 2, 3, 4, 5, 6]
        # x      x     x  
        #     x     x     x 

        # [2, 9, 8, 3, 6]
        #     x        x  = 15
        #  x     x     x  would have been valid without wraparound.

        rob_idx_memo: list[int] = [[-1] * 2 for _ in range(len(nums))]
        max_rob: int = -1

        def rob_amt_idx_dp(idx: int, robbed_house_zero: bool = False) -> int:
            # base case
            if idx >= len(nums):
                return 0
            
            # memo case
            if rob_idx_memo[idx][robbed_house_zero] >= 0:
                return rob_idx_memo[idx][robbed_house_zero]

            # RECUR
            # pre
            # recur
            ### Rob House
            ### # check if possible (wraparound)
            #### idx len-1 -> check if robbed 0
            rob: int = 0
            if not (idx == len(nums)-1 and robbed_house_zero):
                rob = nums[idx] + rob_amt_idx_dp(idx+2, robbed_house_zero or idx==0)

            ### Skip House
            skip = rob_amt_idx_dp(idx+1, robbed_house_zero)
            # post
            rob_amt_idx = max(rob, skip)
            rob_idx_memo[idx][robbed_house_zero] = rob_amt_idx

            nonlocal max_rob
            max_rob = rob_amt_idx if rob_amt_idx > max_rob else max_rob
            # return
            return rob_amt_idx

        rob_amt_idx_dp(0)
        return max_rob
```

```python
class Solution:

    def rob(self, nums: List[int]) -> int:
        return max(
	        nums[0],
	        self.house_rob_subarray(nums[1:]),
	        self.house_rob_subarray(nums[:-1])
	    )

    def house_rob_subarray(self, nums):
	    # our original house robber solution
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
Source