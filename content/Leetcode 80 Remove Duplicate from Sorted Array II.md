---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/array
edited: 2025-08-07T19:55
created: 2025-07-23T18:42:00
---
# Problem:
Given an integer array `nums` sorted in **non-decreasing order**, remove some duplicates [**in-place**](https://en.wikipedia.org/wiki/In-place_algorithm) such that each unique element appears **at most twice**. The **relative order** of the elements should be kept the **same**.

Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the **first part** of the array `nums`. More formally, if there are `k` elements after removing the duplicates, then the first `k` elements of `nums` should hold the final result. It does not matter what you leave beyond the first `k` elements.

Return `k` _after placing the final result in the first_ `k` _slots of_ `nums`.

Do **not** allocate extra space for another array. You must do this by **modifying the input array [in-place](https://en.wikipedia.org/wiki/In-place_algorithm)** with O(1) extra memory.

#### Bounds
- `1 <= nums.length <= 3 * 10^4`
- `-10^4 <= nums[i] <= 10^4`
- `nums` is sorted in **non-decreasing** order.

#### Examples
**Input:** nums = `[1,1,1,2,2,3]`
**Output:** 5, nums = `[1,1,2,2,3,_]`
**Explanation:** Your function should return k = 5, with the first five elements of nums being 1, 1, 2, 2 and 3 respectively.
It does not matter what you leave beyond the returned k (hence they are underscores).

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
This is the same [[Array Frontier]] pattern as [[Leetcode 26 Remove Duplicates from Sorted Array]], except that we start at index 2 and check 2 before.

---
# Solution:

```python
class Solution:

    def removeDuplicates(self, nums: List[int]) -> int:
	    # base case
        if len(nums) <= 2:
            return len(nums)

        read_idx = 2
        write_idx = 2

        while read_idx < len(nums):
            # check if same as two behind?
            if nums[read_idx] != nums[write_idx-2]:
                nums[write_idx] = nums[read_idx]
                write_idx += 1
            read_idx += 1

        return write_idx
```

----
# Source:
https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/description