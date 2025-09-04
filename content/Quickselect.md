---
aliases: 
tags:
  - cs/dsa/search/quickselect
edited: 2025-08-04T21:08
created: 2024-03-19T22:06
---
# Definition:
A way to select an element in an [[Array]] or [[ArrayList]] using [[Divide and Conquer]], inspired by [[Quicksort]]'s pivot idea.

---
# Notes:
1. Split array into two halves around a pivot.
	1. We randomly pick a pivot, typically the rightmost value.
2. Go through values in the array and compare to pivot
	1. If before pivot, put it at the pivot spot and move pivot
	2. Otherwise, keep value where it is
3. After this procedure, all values before pivot spot are lower than pivot.
	1. The subarrays are NOT necessarily in sorted order though
4. Swap pivot value with pivot value.

```python
def quick_select(left, right):
	pivot, p = nums[right], left

	for i in range(left, right):
		if nums[i] <= pivot:
			nums[p], nums[i] = nums[i], nums[p]
			p += 1

	nums[p], nums[right] = pivot, nums[p]

	# check for success
	if p == target_idx:
		return nums[p]

	# divide and conquer
	if p > target_idx:
		return quick_select(left, p-1)

	return quick_select(p+1, right)
```

#### [[Big O]]
- Time complexity:
	- We iterate through the entire array, then half, then half of half then...
	- $n+n/2+n/4+...=2n$ In average case.
	- Worst case is when pivot is one of the extremes, which eliminates one value each pass, i.e., $O(n^2)$

---
# Examples:

| 3   | 2   | 1   | 5   | 6   | 4   |
| --- | --- | --- | --- | --- | --- |

Pivot is 4. We keep values 3, 2, 1 left of pivot and move it to i=4

- [[Leetcode 215 Find Kth Largest in Array]]

----
# Source:
Source