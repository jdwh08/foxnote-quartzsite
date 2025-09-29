---
aliases:
tags:
  - cs/leetcode/medium
  - cs/dsa/greedy
  - cs/dsa/array
  - cs/dsa/dp
edited: 2025-09-27T18:45
created: 2025-07-21T19:39
---
# Problem:
You are given an array of integers `nums`, where `nums[i]` represents the maximum length of a jump towards the right from index `i`. For example, if you are at `nums[i]`, you can jump to any index `i + j` where:

- `j <= nums[i]`
- `i + j < nums.length`

You are initially positioned at `nums[0]`.

Return the minimum number of jumps to reach the last position in the array (index `nums.length - 1`). You may assume there is always a valid answer.

#### Bounds
- `1 <= nums.length <= 10^4`
- `0 <= nums[i] <= 1000`
- It's guaranteed that you can reach `nums[n - 1]`.

#### Examples
```
Input: nums = [2,3,1,1,4]
Output: 2
Explanation: The minimum number of jumps to reach the last index is 2. Jump 1 step from index 0 to 1, then 3 steps to the last index.
```

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
**Brute Force**: We need to check all combinations of all nums to get to the end. This is $O(n^2)$. But we have duplicated work when checking the same num multiple times. How do we fix this?

The sticking point is figuring out which value $v$ to jump to for a given index state $i$, and doing it over and over again.

We could use [[Dynamic Programming]], with states and actions, since this is getting the **minimum** jumps and state transitions are clear.

However, we can do even better than DP. Suppose we are given two places to jump to, $v_1$ and $v_2$. Upon arriving to $v_2$, suppose it allows your *next jump* to go further than $v1$, i.e., $v_2 + nums[v_2] > v_1 + nums[v_1]$. $v_2$ must be at least as good as $v_1$ because all the places we could go to in $v_1$ are also reachable.

Thus, this is a great case when [[Greedy Algorithm]] is better than [[Dynamic Programming|DP]] since at each state we always want to jump to the value which allows us to go further. There's no need to check other solutions.

Keep track of the number of jumps.

---
# Solution:

```python
class Solution:
    def jump(self, nums: List[int]) -> int:
        # minimum number of jumps to reach last position

        # isn't this basically just the same thing
        # brute force is check every nums and save, O(n^2)
        # we can do better

        num_jumps: int = 0
        idx = 0

        tmp = 0
        while idx < len(nums)-1:
            jumpval = nums[idx]

            bestjumpval = -float("inf")
            bestjumpidx = 0

            for val in range(jumpval, -1, -1):
                newidx = idx + val

                if newidx >= len(nums)-1:
                    return num_jumps+1

                newjumpval = newidx + nums[newidx]
                if newjumpval > bestjumpval:
                    bestjumpval = newjumpval
                    bestjumpidx = newidx
            
            # jump to best
            idx = bestjumpidx
            num_jumps += 1
            # tmp += 1
        
        return num_jumps
```

----
# Source:
https://leetcode.com/problems/jump-game-ii/