---
aliases:
tags:
  - cs/leetcode/medium
  - cs/string
  - cs/dsa/array/slidingwindow
edited: 2025-09-01T13:26
created: 2025-07-23T18:42:00
---
# Problem:
Given a string `s`, return the number of substrings within `s` that are palindromes.
A **palindrome** is a string that reads the same forward and backward.

#### Bounds
- `1 <= s.length <= 1000`
- `s` consists of lowercase English letters.

#### Examples
Input: s = "abc"
Output: 3

Input: s = "aaa"
Output: 6
NOTE: Counts based on position not substring -- "aa" in 0-1 and "aa" in 1-2 both count.

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
This is basically the same as [[Leetcode 5 Longest Palindromic Substring]], but instead of getting the longest string we instead track a count variable. I think it's easier.

[[Sliding Window]] going outwards for palindromes. Move it across starting positions. Track both the case where the center is even and center is odd.

---
# Solution:

```python
class Solution:
    def countSubstrings(self, s: str) -> int:
        def num_palindrome_expander(left: int, right: int) -> int:
            num_palindrome = 0

            while left >= 0 and right < len(s):
                leftchar = s[left]
                rightchar = s[right]

                if leftchar != rightchar:
                    return num_palindrome
                
                num_palindrome += 1
                left -= 1
                right += 1
            
            return num_palindrome
        
        output: int = 0
        for i in range(len(s)):
            # odd number
            odd = num_palindrome_expander(i, i)
            # even number center
            even = num_palindrome_expander(i, i+1)

            output = output + odd + even
        
        return output
```

----
# Source:
https://leetcode.com/problems/palindromic-substrings/description/