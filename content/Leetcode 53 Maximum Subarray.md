---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/dp
  - cs/dsa/greedy
edited: 2025-09-24T17:05
created: 2025-07-21T19:39
---
# Problem:
Problem Statement

#### Bounds
- `1 <= nums.length <= 10^5`
- `-10^4 <= nums[i] <= 10^4`

#### Examples
```
**Input:** nums = [-2,1,-3,4,-1,2,1,-5,4]
**Output:** 6
**Explanation:** The subarray [4,-1,2,1] has the largest sum 6.
```

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
The Brute Force approach would be two pointer over every single combination of start and end value. This is $O(n^2)$.

I thought this was a sliding window problem with prefix sum since subarray? We get the prefix sum for the values, and then pick the window with the largest value?

It turns out, no. Because if we do it as a sliding window with subarrays, we'd still need to check all of the values for a given left position, which is still $O(n^2)$ and basically the same as brute force.

##### Attempt 2
BOUNDARY: 
- Brute force naive upper is $O(n^2)$. 
- We know that $10^4$ means we need a linear-ish time upper bound.
- Task might not need all values so sublinear lower is possible.
- Output is a single number so $O(1)$ for output lower bound

Since we're getting the maximum we might think about [[Dynamic Programming]]. 
- State: index
- Actions: add to window or reset window
- Transitions: move index along; current value of max in window and global max updates


Oh shoot it's DP.
Okay we'll do the classic recursion pattern.
Our DP function now becomes the maximum value up to that index.

NOTE: you silly bun you need to add a global best seen across the entire array!

##### Attempt 3
Now that we know DP works we can optimize it.
- The index value is not needed as it's a progress tracker.
- At each step we really only need to know the prior value
	- We get the maximum of prior value + cur num vs starting a new index at num.
- That's uh... that's it.

NOTE: You may see this as similar to [[Leetcode 152 Maximum Product Subarray]].

NOTE: We can also derive this using [[Greedy Algorithm]]:
- For each number, we can always do the largest of (start new, add to current).
- Keep track of largest seen value ever.
- Greedy is a perfectly fine solution here, since we are looking for the largest large.

##### Attempt 4
Apparently we can use [[Divide and Conquer]] to break this down into $\log n$ time because we don't need to scan all values...
- Use pattern inspired by [[Binary Array Search]]


---
# Solution:

```python
class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        
        subarrayval_memo: list[int] = [-float("inf")] * len(nums)
        subarrayval_memo[0] = nums[0]

        max_seen = subarrayval_memo[0]

        def subarrayval_dp(idx_right) -> int:
            """Largest subarray up to this current idx."""
            nonlocal max_seen

            # base case
            if idx_right < 0:
                return -float("inf")

            # dp case
            if subarrayval_memo[idx_right] != -float("inf"):
                return subarrayval_memo[idx_right]
            
            # recursion
            prevbest = subarrayval_dp(idx_right-1)
            subarrayval_memo[idx_right] = max(0, prevbest) + nums[idx_right]

            if subarrayval_memo[idx_right] > max_seen:
                max_seen = subarrayval_memo[idx_right]

            return subarrayval_memo[idx_right]
        
        subarrayval_dp(len(nums)-1)
        return max_seen
```

```python
class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        
        bestseen = nums[0]
        cursubarr = 0

        for num in nums:
            cursubarr = max(cursubarr + num, num)
            bestseen = max(cursubarr, bestseen)
        
        return bestseen
```
```python
class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        curval = 0
        bestval = -float("inf")

        for num in nums:
            curval = max(num, curval+num)
            if curval >= bestval:
                bestval = curval
        
        return bestval
```

----
# Source:
https://leetcode.com/problems/maximum-subarray/description/