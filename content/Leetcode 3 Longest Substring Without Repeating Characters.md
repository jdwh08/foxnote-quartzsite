---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/array/slidingwindow
  - cs/string
edited: 2025-09-24T17:05
created: 2025-07-21T19:39
---
# Problem:
Given a string `s`, find the length of the **longest** substring without duplicate characters.

#### Bounds
- `0 <= s.length <= 5 * 10^4`
- `s` consists of English letters, digits, symbols and spaces.

#### Examples
```
**Input:** s = "pwwkew"
**Output:** 3
**Explanation:** The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
```

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
It's a contiguous substring. We have clear conditions for adding characters to the substring (no repeats) and removing characters from the substring (until we clear repeats).

This is thus a classic [[Sliding Window]].

---
# Solution:

```python
class Solution:
    def lengthOfLongestSubstring(
        self, s: str
    ) -> int:
        # sliding window, keep track of current letter counts using a dictionary?
        left = 0
        right = 0
        counts: dict[str, int] = defaultdict(lambda: 0)
        best = 0
        curlen = 0

        while right < len(s):
            newchar = s[right]
            while newchar in counts:
                leftchar = s[left]
                counts[leftchar] -= 1
                curlen -= 1
                if counts[leftchar] <= 0:
                    del counts[leftchar]

                left+=1

            counts[newchar] += 1
            curlen += 1
            best = max(curlen, best)
            right += 1

        return best
```

----
# Source:
https://leetcode.com/problems/longest-substring-without-repeating-characters/