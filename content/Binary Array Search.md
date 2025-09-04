---
aliases: 
tags:
  - cs/dsa/array
  - cs/dsa/search/binary
edited: 2025-08-08T22:48
created: 2025-01-05T21:10
---
# Definition:

Take advantage of a [[Sorted Array]] to search faster using [[Divide and Conquer]] and [[Two Pointer]].
- Find current value, search left if target is smaller or right if target is larger.
- This recursively divides the data structure into half, so [[Big O]] of $log_2(N)$

---
# Whiteboard
Because it's ordered, we don't need to actually start at index zero.

What's the best way to start?
- What if we jumped by 10% of the length each time to check?
	- Issue: WORST CASE is we jump through to the last section, then have to check the last section one at a time.
	- This is $O(10 + ~1/10 * n) = O(n)$. Yeah it's better but if $n \rightarrow \infty$ it's still too slow.

- Remember the optimal way to search! **Cut the search space in half each time** (don't ever linear scan). Stop when we find the value or have nothing to search.
	- N -> 1/2 -> 1/4 -> 1/8 ... this is $log(n)$!
	- okay technically there are some rare exceptions, where this repeated division actually requires the square root, see [[Leetcode X Two Crystal Ball]].


---
# Notes:

### Use Cases
1. Find a value in a sorted array (the textbook)
2. Find ANYTHING in a *monotonically increasing subsequence*
	1. E.g., convert array into boolean values, and find the first True value index.

### Psuedocode
```psuedocode
search(arr, needle, lo, hi):

DO THIS
	mid = floor(low + (high-low)/2)
	value = arr[mid]

	if value == needle:
		return True

	elif val > needle:
		# it's sorted!
		# search the lower side
		# move high accordingly
		hi = mid  # always have hi be exclusive

	else:
		# search the higher side
		lo = mid + 1  # mid was searched already

WHILE lo < hi

RETURN false
```

```python
# Basic Binary Search
def bs_list(haystack: list[int], needle: int) -> bool:

	# YOU NEED TO KEEP THIS CONSISTENT.
	# EITHER YOU LET RIGHT BE EXCLUSIVE (set low < high, use right=mid/len)
	# OR YOU LET RIGHT BE INCLUSIVE

	# DO
	lo = 0
	hi = len(haystack)-1
	mid = lo + (hi - low)//2  # offset avoids overflow
	val = haystack[mid]

	# WHILE
	while lo <= high:  # we're inclusive here
		if val == needle:
			return True
		elif val > needle:
			hi = mid - 1  # we're inclusive
		else:
			# val < needle
			lo = mid + 1  # mid was searched already

		# the do stuff
		mid = lo + (hi - low)//2  # offset avoids overflow
		val = haystack[mid]

	return False
```

```python
### General Binary Search
def gen_binary_search(arr: list[int], target: int) -> int:
	left = 0
	right = len(arr)-1
	first_true_idx = -1  # this is what we are searching for

	while left < right:
		mid = left + (right - left)//2
		if is_feasible_solution(mid):  # convert arr idx into condition
			first_true_idx = mid  # everything right must be TRUE
			right = mid-1
		else:
			left = mid+1  # everything left must be FALSE

	return first_true_idx
```

---
### Examples:
- [[Leetcode 153 Find Minimum in Rotated Sorted Array]]
	- This is a General Binary Search problem
	- Any element which is less than last element is part of the "rotated section"
	- We can convert the array into True/False
- [[Leetcode 852 Peak Index of Mountain Array]] 
	- This is a General Binary Search Problem
	- Any element which is greater than its next is part of the "downslope"
	- We can convert the array into True/False