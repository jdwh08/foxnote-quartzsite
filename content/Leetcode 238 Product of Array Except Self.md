---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/array/prefix
edited: 2025-09-24T14:11
created: 2025-07-21T19:39
---
# Problem:
Given an integer [[Array]] nums, return an array answer such that answer\[i] is equal to the product of all the elements of nums EXCEPT nums\[i].

Write this in [[Big O]] $O(n)$ time without using division.

#### Bounds
- 2 <= nums length <= 10^5
- -30 <= nums\[i] <= 30
- Input fits into a 32-bit integer

#### Examples
Examples

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
Okay so our brute force solution would be to multiply all values from 0 to i-1, and then all values from i-1 to n.
- This is done for every $i$, so is $O(n^2)$ time.

Our other bound at 10^5 requires linearish time, and our output is $O(n)$, so problem should look for linear time.

We can see that the brute force solution has repeated work; e.g., getting product from 0 to i-1 basically gets you most of the way there when we do product from 0 to I next round.

This is similar to [[Prefix Sum]], but instead of sum we need product.
We also need to do this two ways, one for the prefix going from left to right and one for the prefix going from right to left.

Finally, we would multiply the values together.

---
# Solution:

```python
class Solution:
	def productExceptSelf(self, nums: list[int]) -> list[int]:
		left: list[int] = [1]
		right: list[int] = [1]
		prevleft = 1
		prevright = 1

		for idx in range(len(nums)-1):
			numsleft = nums[idx]
			numsright = nums[len(nums)-1-idx]
			newleft = prevleft * numsleft
			newright = prevright * nums right


			left.append(newleft)
			right.append(newright)
			prevleft = newleft
			prevright = newright

	# reverse right to be in order
	right = reversed(right)
	output = [
		l*r for l, r in zip(left, right, strict=True)
	]
	return output
```

----
# Source:
https://leetcode.com/problems/product-of-array-except-self
