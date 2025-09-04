---
aliases:
tags:
  - cs/leetcode/medium
  - cs/dsa/dp
  - cs/dsa/array
edited: 2025-09-02T16:44
created: 2025-07-23T18:42:00
---
# Problem:
Given an integer array `nums`, return the _length_ of the longest strictly _increasing_ subsequence.

A **subsequence** is a sequence that can be derived from the given sequence by deleting some or no elements without changing the relative order of the remaining characters.

- For example, `"cat"` is a subsequence of `"crabt"`.

#### Bounds
- `1 <= nums.length <= 2500`
- `-10^4 <= nums[i] <= 10^4`

#### Examples
```
Input: nums = [9,1*,4,2*,3*,3,7*]
Output: 4 (from 1,2,3,7)
```
```
Input: nums = [0,3,1,3,2,3]
Output: 4
```

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
Backtracking is too slow, since we need something linear-ish for DP.


---
# Solution:

```python
class Solution:
    def lengthOfLIS(self, nums: List[int]) -> int:
        # length of longest STRICTLY INCREASING subsequence

        # backtracking?
        # but too slow. DP.
        # state: curidx
        # actions:
            # take: 
                # if val[curidx] > prev
                # prev = val[curidx], curidx += 1
            # skip:
                # curidx += 1
        # track:
            # prev, curidx, length
        
        # time complexity:
            # O(n*n) = O(n^2).
        
        lis_memo: dict[tuple[int, int]] = {}
        def lis_dp(idx: int, prev: int) -> int:
            # base case
            if idx >= len(nums):
                # reached end, no more lis
                return 0
            
            # memo case
            if (idx, prev) in lis_memo:
                return lis_memo[(idx, prev)]
            
            # dp recur
            # pre
            cur = nums[idx]
            # recur
            ### actions: add, skip
            add = 0
            if cur > prev:
                # can add
                add = 1 + lis_dp(idx+1, cur)

            skip = lis_dp(idx+1, prev)
            # post
            lis = max(add, skip)
            lis_memo[(idx, prev)] = lis
            # return
            return lis
        
        return lis_dp(0,-float("inf"))
```

```python
class Solution:
    def lengthOfLIS(self, nums: List[int]) -> int:
        # length of longest STRICTLY INCREASING subsequence

        # backtracking?
        # but too slow. DP.
        # state: curidx
        # actions:
            # take: 
                # if val[curidx] > prev
                # prev = val[curidx], curidx += 1
            # skip:
                # curidx += 1
        # track:
            # prev, curidx, length
        
        # time complexity:
            # O(n*n) = O(n^2).
        
        lis_incl_idx_memo: list[int] = [-1] * len(nums)
        def lis_incl_idx_dp(idx: int) -> int:
            # base case
            if idx >= len(nums):
                # reached end, no more lis
                return 0

            # memo case
            if lis_incl_idx_memo[idx] >= 0:
                return lis_incl_idx_memo[idx]

            # dp recur
            # pre
            lis = 1  # assume we added this value?
            prev = nums[idx]
            # recur
            ### options: take for each one of the remaining values.
            for jdx in range(idx+1, len(nums)):
                cur = nums[jdx]
                ### actions: add, skip
                if cur > prev:
                    # post
                    lis = max(lis, 1 + lis_incl_idx_dp(jdx))

            # cache
            lis_incl_idx_memo[idx] = lis
            # return
            return lis

        return max(lis_incl_idx_dp(startidx) for startidx in range(len(nums)))
```

```python
class Solution:
    def lengthOfLIS(self, nums: List[int]) -> int:
        l=len(nums)
        dp =[1]*l
        for j in range(1,l):
            for k in range(j):
                if nums[j]>nums[k]:
                    dp[j]=max(dp[j],dp[k]+1)

        return max(dp)
```

----
# Source:
https://leetcode.com/problems/longest-increasing-subsequence/