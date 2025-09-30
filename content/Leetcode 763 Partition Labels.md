---
aliases:
tags:
  - cs/leetcode/medium
  - cs/dsa/array/interval
  - cs/dsa/greedy
  - cs/string
  - cs/dsa/array/2ptr/slidingwindow
edited: 2025-09-29T21:22
created: 2025-07-21T19:39
---
# Problem:
You are given a string `s` consisting of lowercase english letters.

We want to split the string into as many substrings as possible, while ensuring that each letter appears in at most one substring.

Return a list of integers representing the size of these substrings in the order they appear in the string.

#### Bounds
- `1 <= s.length <= 500`
- `s` consists of lowercase English letters.

#### Examples
```
Input: s = "xyxxyzbzbbisl"
Output: [5, 5, 1, 1, 1]
["xyxxy", "zbzbb", "i", "s", "l"]
```

---
# Notes:
yet another case with [[Greedy Algorithm]] where each time we're doing the max so it is easy to greedify, similar to [[Leetcode 846 Hand of Straights]].

---
# Attempts:

##### Attempt 1
**BRUTE FORCE**: we need to figure out where to split.
```
for unique letter in letters:
	find next position of letter
	merge all letters in between

return length of all merges
```
Okay this works but has a [[Big O]] of $O(n*u)=O(n^2)$.

What's the challenge?
- Every split we need to scan the full array to check if valid
- Better way to determine split location?

Perhaps we can just store the first and last index for each letter. This would be an $O(n)$ operation. Then, we can treat these as intervals and merge them if overlapping!

Merging intervals is $O(n)$ operation. Note that it's sorted already thanks to us going from left to right. Thus, total Big O is $O(n)$.

**BOUNDARY**: 
- Worst case scenario our output is same length as input, so $O(n)$ seems reasonable output lower bound.
- TLE Upper Bound is huge; brute force is surpassed, etc.
- Seems good enough.

Maybe we could optimize something with only the end values?

##### Attempt 2
Turns out we can use [[Greedy Algorithm]]. Notice that we're only ever using the $\max$ as our merging operation. Thus, we only ever care about our end pointer position and 
- We save the last positions for each character (don't bother with starts).
- At each step $i$ in the index, our end for the interval is the max of the current end and the per-character last position.
- We keep going until we reach the last $i$ as the end of the interval, then add the length to the output.

---
# Solution:

```python
class Solution:
    def partitionLabels(self, s: str) -> List[int]:
        # s - lowercase english
        # each letter appears in at most one substring
        # return size of substrings
            # not the substrings themselves?
        
        # brute force
        # each letter is split
        # for unique letter in letters:
            # find next position of letter
            # merge all letters in between
        # return len of each string?

        # O(n * u) = O(n^2) ish worst case
        
        # for each split we keep scanning to check if it's valid
        # determining split location is hard
        
        # for each letter store the first and last locations?
        # e.g., x: [0, 3]?
        # this is an o(n) operation
        # this then turns into an interval problem!?

        # we merge intervals together if they have overlaps, otherwise leave
        # merging intervals is also an O(n) operation.
        # so this algo is $O(n)$

        # acceptable? bounds?
            # probably need to scan everythng? o(n) worst
        
        itvs: dict[str, tuple[int, int]] = {}
        for idx, letter in enumerate(s):
            if letter in itvs:
                l, r = itvs[letter]
                itvs[letter] = (l, idx)
            else:
                itvs[letter] = (idx, idx)  # i feel like there's something here
                # e.g., only look at end idx?
                # todo

        # do interval merging
        itvslist = list(itvs.values())
        output: list[list[int, int]] = []
        for itv in itvslist:
            if len(output) <= 0:
                output.append(itv)
                continue
            
            previtv = output[-1]
            # check for overlaps
            if previtv[0] <= itv[0] <= previtv[1]:
                # overlap
                output[-1] = [previtv[0], max(previtv[1], itv[1])]
            else:
                output.append(itv)

        # convert output to sizes
        return [
            itv[1] - itv[0] + 1
            for itv in output
        ]
```

```python
class Solution:
    def partitionLabels(self, s: str) -> List[int]:
        lastIndex = {}
        for i, c in enumerate(s):
            lastIndex[c] = i

        res = []
        size = end = 0
        for i, c in enumerate(s):
            size += 1
            end = max(end, lastIndex[c])

            if i == end:
                res.append(size)
                size = 0
        return res
```
----
# Source:
https://leetcode.com/problems/partition-labels/
