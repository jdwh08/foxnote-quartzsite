---
aliases: 
tags:
  - cs/dsa/array
  - cs/dsa/search
edited: 2025-07-20T22:16
created: 2025-01-05T21:10
---
### Definition:

Take advantage of **sortedness** in [[Sorted Array]] to search faster using [[Divide and Conquer]].

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
def bs_list(haystack: list[int], needle: int) -> bool:
	# DO
	lo = 0
	hi = len(haystack)
	mid = math.floor(lo + (hi - low)/2)  # offset avoids overflow
	val = haystack[mid]

	# WHILE
	while lo < high:
		if val == needle:
			return True
		elif val > needle:
			hi = mid
		else:
			# val < needle
			lo = mid + 1  # mid was searched already

		# the do stuff
		lo = 0
		hi = len(haystack)
		mid = math.floor(lo + (hi - low)/2)  # offset avoids overflow
		val = haystack[mid]

	return False
```

---
### Whiteboard
Because it's ordered, we don't need to actually start at index zero.

What's the best way to start?
- What if we jumped by 10% of the length each time to check?
	- Issue: WORST CASE is we jump through to the last section, then have to check the last section one at a time.
	- This is $O(10 + ~1/10 * n) = O(n)$. Yeah it's better but if $n \rightarrow \infty$ it's still too slow.

- Remember the optimal way to search! Cut the search space in half each time (don't ever linear scan). Stop when we find the value or have nothing to search.
	- N -> 1/2 -> 1/4 -> 1/8 ... this is $log(n)$!


---
### Notes:
Notes

---
### Examples:
Examples