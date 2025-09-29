---
aliases:
tags:
  - cs/leetcode/medium
  - cs/dsa/dp
edited: 2025-09-04T18:17
created: 2025-07-23T18:42:00
---
# Problem:
You are given an array of positive integers `nums`.

Return `true` if you can partition the array into two subsets, `subset1` and `subset2` where `sum(subset1) == sum(subset2)`. Otherwise, return `false`.

#### Bounds
- `1 <= nums.length <= 200`
- `1 <= nums[i] <= 100`

#### Examples
**Input:** nums = `[1,5,11,5]`
**Output:** true
**Explanation:** The array can be partitioned as `[1, 5, 5]; [11]`.

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
We can think about this as starting off with all values in the left array and none in the right.
We progressively test whether we can move enough values into the right array so that it equals the left.
- I.e., the right array is 1/2 of the total sum.
- We also need to check the sum to make sure it's **even**.

Our states are probably based on the current index and our current sum in the right side.
- This is 2D [[Dynamic Programming]]
- Our actions are whether to move value to the right array or keep in left array.
- Transitions are +1 to index always, and `val_right + nums[idx]` if we move to right.

##### Attempt 2
Yes okay but now we get memory issues in the official Leetcode solution, so we need to make this not 2D.

We'll start by making it iterative.

---
# Solution:

```python
class Solution:
    def canPartition(self, nums: List[int]) -> bool:
        
        keptsum = sum(nums)
        target = keptsum // 2

        if keptsum % 2 != 0:
            return False

        # for idx, takeval, skipval in nums:
            # try adding nums[idx] to takeval and removing from skipval
            # if they are the same then return True
                # recur down both take and skip routes?

        can_partition_memo: dict[tuple[int, int]] = {}

        def can_partition_dp(idx: int, keptsum: int) -> bool:
            # Base Case
            if keptsum == target:
                return True
            if keptsum < target:
                return False
            if idx >= len(nums):
                return False

            # Memo Case
            if (idx, keptsum) in can_partition_memo:
                return can_partition_memo[(idx, keptsum)]
            
            # DP RECUR
            # pre
            # recur
            keep = can_partition_dp(idx+1, keptsum)
            switch = can_partition_dp(idx+1, keptsum-nums[idx])
            # post
            can_partition = keep or switch
            can_partition_memo[(idx, keptsum)] = can_partition
            # return
            return can_partition
        
        return can_partition_dp(0, keptsum)
```

----
# Source:
https://leetcode.com/problems/partition-equal-subset-sum/