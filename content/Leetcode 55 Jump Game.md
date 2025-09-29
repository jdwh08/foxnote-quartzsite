---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/greedy
  - cs/dsa/dp
  - cs/dsa/array
edited: 2025-09-24T17:05
created: 2025-07-21T19:39
---
# Problem:
You are given an integer [[Array]] `nums`. You are initially positioned at the array's **first index**, and each element in the array represents your maximum jump length at that position.

Return `true` _if you can reach the last index, or_ `false` _otherwise_.

#### Bounds
- `1 <= nums.length <= 10^4`
- `0 <= nums[i] <= 10^5`

#### Examples
```
**Input:** nums = [3,2,1,0,4]
**Output:** false
**Explanation:** You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.
```
```
**Input:** nums = [2,3,1,1,4]
**Output:** true
**Explanation:** Jump 1 step from index 0 to 1, then 3 steps to the last index.
```

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
**Boundary**: 
- We see runtime max bound is linearish. 
- We see min bounds are O(1) constant time.

**Brute Force**: would basically be like [[Backtracking]], where we check all possible combinations of all possible values.
- This checks all values at all times, so $O(n!)$ for [[Big O]].

We need to do better. Backtracking is wasteful because we re-do checks which we already have. **Main Pain Point is determining *HOW FAR* to jump.**

We could borrow from [[Dynamic Programming]] and create a memo of whether it is possible to reach a value or not.

OR, we can notice that this is [[Greedy Algorithm]]: 
- For any given point $i$, we always want our jump to result in the furthest possible options for the next jump
- This is because if we can jump to point $k$ next round, we can at least jump to points $i...k-1$ if they were better.
- Thus, this is **GREEDY** 

For any point $i$, we check all values $v$ that we can jump to, and pick the $v$ which allows the *next* jump to be the furthest.

##### Attempt 2
Yeah okay that's clever... but [[Dynamic Programming]] apparently turns out to be faster yet.

We can think about going from the END (which we are guaranteed to be able to hit), and working our way back to the START.
- At each prior point $i$, we check whether we are able to jump to this point.
- If yes, we move back to $i$.
- We continue until we run out of possible places to jump to.

---
# Solution:

```python
class Solution:
    def canJump(self, nums: List[int]) -> bool:
        # bounds
        # sublinear under consideration?
        
        # brute force: backtracking
        # O(n^2)

        # greedy?
        # jump to whichever allows you to jump furthest next?

        if len(nums) == 1:
            return True

        idx = 0
        previdx = -float("inf")
        while previdx != idx:
            val = nums[idx]
            bestjump = -float("inf")
            bestiv = 0

			# go over jump values
            for iv in range(val, 0, -1):
                idxv = idx + iv
                # reached end
                if idxv >= len(nums)-1:
                    return True

				# get max jump value in next round
                idxval = nums[idxv]
                newjump = idxv + idxval
                if newjump > bestjump:
                    bestjump = newjump
                    bestiv = iv

			# ensure we don't get stuck
            previdx = idx
            idx += bestiv

        return False
```

```python
class Solution:
    def canJump(self, nums: List[int]) -> bool:
        # dp???
        # traverse array backwards?
        curidx = len(nums)-1
        jumpidx = curidx-1
        while jumpidx >= 0:
            if nums[jumpidx] + jumpidx >= curidx:
                # we can reach this
                curidx = jumpidx
            jumpidx -= 1

        return (curidx == 0)
```

----
# Source:
https://leetcode.com/problems/jump-game/