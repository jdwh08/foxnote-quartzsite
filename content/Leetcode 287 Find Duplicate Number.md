---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/linked_list
edited: 2025-07-27T18:59
created: 2025-07-23T18:42:00
---
# Problem:

Given an [[Array]] of integers `nums` containing `n + 1` integers where each integer is in the range `[1, n]` inclusive.

There is only **one repeated number** in `nums`, return _this repeated number_.

You must solve the problem **without** modifying the array `nums` and using only ***constant extra space.***
#### Bounds
- `1 <= n <= 105`
- `nums.length == n + 1`
- `1 <= nums[i] <= n`
- All the integers in `nums` appear only **once** except for **precisely one integer** which appears **two or more** times.

#### Examples
**Input:** `nums = [1,3,4,2,2]`
**Output:** 2

**Input:** nums = `[3,1,3,4,2]
**Output:** 3

---
# Notes:
By the [[Pidgeonhole Principle]], we know that there is at least one duplicate.

First thought was use a set to dedupe (requires extra space). Next thought was to sort the array and use a single pointer (can't modify array). 



---
# Attempts:

##### Attempt 1
I did both hashset and sorting. They work but uh not really what they want.

---
# Solution:

1. Notice that the values in the array are all valid indices of the array.
2. We can treat this as a [[Linked List]] where the node value is the INDEX and the node's next is the array value.
3. If an array value is duplicated, the node corresponding to that array will have multiple nodes pointing to it!
	1. This is a CYCLE.
	2. To find a cycle, we can use [[Fast and Slow Pointers|Floyd's Cycle Detection Algorithm]]. 
	3. We want to get the value leading things into the cycle.
4. Somehow, the distance from the FCDA converge point to the cycle entrance is the same as the distance from the head to the cycle entrance.
	1. Non-cycle portion is $p$, FCDA to converge is $x$, and remaining cycle distance is $c-x$
	2. $2s=f$, fast pointer must do $p+(c-x)+c$ while slow must do $2(p+c-x)$, thus $p=x$.
	3. Thus, use two slow pointers.

```python
def findDuplicate(self, nums: List[int]) -> int:
        fast, slow = 0, 0

        # run floyd's cycle detection algorithm
        # NOTE: you need while True break
        # don't do while fast != slow because that occurs instantly
        while True:
            slow = nums[slow]
            fast = nums[nums[fast]]
            if fast == slow:
                break

        # now fast-slow convergence is same distance away as head
        slow2 = nums[0]

        while slow2 != slow:
            slow = nums[slow]
            slow2 = nums[slow2]

        return slow
```


> "This problem is the ultimate test of whether you've seen the problem or not. But I'm going to solve it because it shows up in interviews quite a lot and it's interesting." 
> 	~ Mr. Neetcode


----
# Source:
https://leetcode.com/problems/find-the-duplicate-number/
https://www.youtube.com/watch?v=wjYnzkAhcNk
https://www.youtube.com/watch?v=pKO9UjSeLew
