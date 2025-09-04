---
aliases:
tags:
  - cs/leetcode/medium
  - cs/dsa/dp
edited: 2025-09-01T22:42
created: 2025-07-23T18:42:00
---
# Problem:
Given an integer array `nums`, find a **subarray** that has the largest product within the array and return it.

A **subarray** is a contiguous non-empty sequence of elements within an array.

You can assume the output will fit into a **32-bit** integer.

#### Bounds
- `1 <= nums.length <= 1000`
- `-10 <= nums[i] <= 10`

#### Examples
```java
Input: nums = [1,2,-3,4]
Output: 4  // 4 at the end is highest
```
```java
Input: nums = [-2,-1]
Output: 2  // -2 * -1
```

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
Okay so we have a couple possible solutions I was considering.
- Brute force. This has [[Big O]] of $O(n^2)$. 
```python
# for i in range nums
	# for j in range(i: nums):
		# val = PROD(nums[i:j])  # issue: might not fit in 32bit
		# if val > best: swap
```

- Prefix Product like approach. However, this doesn't work because multiplying all values might not fit in the 32bit integer, even if the answer can.

- Sliding Window like approach. I found that while it looks intuitive to be a sliding window since we are doing subarrays, in practice this solution is very complicated and convoluted and thus a no go.
	- We can notice that if we have even negatives, we probably want to use even negatives.... except I guess zero makes things an issue.
	- For odds, we would want to use all but one of the negatives at most. Again zero is an issue.
	- We would add values until we hit zero or potentially add an extra negative value beyond what is allowed in quota.
		- We keep track of the best possible value.
	- Complications arise when we realize that the best possible value might be 0, since if we only multiply by one negative (even if there is another later on), the value is SUPER NEGATIVE and thus would get overridden by zero.
		- This means there has to be lots of logic for when to do x vs y vs z and uh oh this is a terrible idea.

- [[Dynamic Programming]] is another alternative since we have an input array and output a single value maximum.
	- To do DP, we need to identify the recurrence relation.
	- STATES: the index in the array.
	- ACTIONS: we can either add the new value to the existing subarray (multiply) OR we can create a new subarray.
		- Both advance index by 1.
		- Multiply sets new value as multiplied by current nums
		- CreateNew sets new value as current num.
	- We probably want to keep track of...
		- Index
		- Current Max
		- Current Min (this is the "SUPER NEGATIVE" which can get multiplied by $-1$ to get to SUPER POSITIVE)

Okay it looks like DP is feasible.
- New issue: it looks like while doing the standard function-relation DP, we actually can't do this effectively because we would be caching the `index, value` as the key. 
- However, there are tons and tons of values we can have!
- We need something which is space optimized, which means no recursion and instead iterative DP.
	- For num in nums:
		- Multiply by existing current max, current min
		- Alternatively get the current num
		- New max is the maximum of these three options
		- New min is the minimum of these three options
		- Output stores best new max.

---
# Solution:

```python
class Solution:
    def maxProduct(self, nums: List[int]) -> int:
        # find subarray with longest product in array and return it
        # subarray is contiguous sequence

        # isn't this just a sliding window problem?
        # we start with left, right; add values on left 
            # ... actually, no! we might have negative values
            # get a count of negative values, do two options if odd/even # of negs

        # ... okay let's uh go and do DP instead.

        ##### brute force solution
        # for i in range nums
            # for j in range(i: nums):
                # val = PROD(nums[i:j])  # issue: might not fit in 32bit
                # if val > best: swap
        
        # this is O(n^2)

        # prefix prod? but then pref[len] might not fit in 32bit
        # i mean this is python so this doesn't matter as much but still...
        
        ##### Even-Odd solution with sliding window O(n) / O(n)
        # get number of negative values.
        # if number is even:
            # return total product of everything.

        # need to do the odd case
        # odd case involves dodging the extra odd negative.
        # allowed_negs = tot_negs - 1
        # loop over left, right in range:
            # while cur_negs <= allowed_negs:
                # right += 1
                # curbest = curbest * nums[right-1]
                # if neg: add to cur_negs

            # compare global best against curbest
    
        ### DP Solution
        # state: value, index
        # actions:
            # multiply index-val to value: idx+1, val = val * index-val
            # set val to index-val: idx+1, val = idx-val

        output = -float("inf")

        minval = 1
        maxval = 1
        startnew = 0
        for num in nums:
            # DP
            # pre
            # recur (eh... no recur)
            ### for option in options
            ### multiply (we need both maxval and minval in case negative)
            multiply_maxval = maxval * num
            multiply_minval = minval * num
            ### startnew
            startnew = num
            # post
            ### swaparooni
            maxval = max(startnew, multiply_maxval, multiply_minval)
            minval = min(startnew, multiply_maxval, multiply_minval)

            # return
            output = max(output, maxval)
        
        return output
```

----
# Source:
https://leetcode.com/problems/maximum-product-subarray/