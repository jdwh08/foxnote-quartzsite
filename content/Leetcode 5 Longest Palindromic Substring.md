---
aliases:
tags:
  - cs/leetcode/medium
  - cs/dsa/array/slidingwindow
  - cs/string
edited: 2025-09-01T13:23
created: 2025-07-23T18:42:00
---
# Problem:
Given a string `s`, return _the longest_ palindromic substring in `s`.

#### Bounds
- `1 <= s.length <= 1000`
- `s` consist of only digits and English letters.

#### Examples
**Input:** s = "babad"
**Output:** "bab"
**Explanation:** "aba" is also a valid answer.

**Input:** s = "cbbd"
**Output:** "bb"

---
# Notes:
Don't forget the rules of working with indexes! Be explicit in thinking about whether the right / left indexes are INCLUSIVE or not, and use that to determine the +1.

---
# Attempts:

##### Attempt 1
We can try two ways of checking for palindromes: outside in or inside out. Inside out has the advantage of needing a central point and being able to clearly do a [[Sliding Window]], so we pick that option.

Pseudocode is to go through each character, slide the window out to maximum, and keep the longest window.

We also have the other case where the center is two characters, not just one, so we need to check both.

---
# Solution:

```python
class Solution:
    def longestPalindrome(self, s: str) -> str:
        # brute force
        # for char in s:
            # offset = 0
            # left, right = char-offset, char+offset
            # while left == right:
                # TODO: handle left/right index oob
                # offset + 1

            # best_len = offset
            # best_substring = s[char-offset:char+offset+1]
        # return best_substring

        # time complexity: O(n^2)
        # space: O(1)

        # palindrome start in middle and expand outward
        def palindrome_window_expander(left: int, right: int) -> tuple[int, int]:
            while left >= 0 and right < len(s):
                leftchar = s[left]
                rightchar = s[right]

                # print(f"  {left}: {leftchar}, {right}: {rightchar}")

                if leftchar != rightchar:
                    # oops! we overshot the palindrome. go back one time
                    return left+1, right-1
                
                left-=1
                right+=1

            return left+1, right-1

        best_len: int = -1
        best_idx: tuple[int, int] = ()

        for i in range(len(s)):
            i_center_palindrome = palindrome_window_expander(i,i)
            i_center_len = i_center_palindrome[1] - i_center_palindrome[0]
            if best_len < i_center_len:
                best_len = i_center_len
                best_idx = i_center_palindrome

            i_leftside_palindrome = (i,i)
            if i+1 < len(s):
                i_leftside_palindrome = palindrome_window_expander(i,i+1)
            i_leftside_len = i_leftside_palindrome[1] - i_leftside_palindrome[0]
            if best_len < i_leftside_len:
                best_len = i_leftside_len
                best_idx = i_leftside_palindrome
            
        return s[best_idx[0]:best_idx[1]+1]
```

----
# Source:
https://leetcode.com/problems/longest-palindromic-substring/description/