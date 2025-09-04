---
aliases:
tags:
  - cs/leetcode/medium
  - cs/string
edited: 2025-09-02T15:34
created: 2025-07-23T18:42:00
---
# Problem:
Given a string `s` and a dictionary of strings `wordDict`, return `true` if `s` can be segmented into a space-separated sequence of dictionary words.

You are allowed to reuse words in the dictionary an unlimited number of times. You may assume all dictionary words are unique.

#### Bounds
- `1 <= s.length <= 200`
- `1 <= wordDict.length <= 100`
- `1 <= wordDict[i].length <= 20`
- `s` and `wordDict[i]` consist of only lowercase English letters.

#### Examples
```
Input: s = "neetcode", wordDict = ["neet","code"]
Output: true
```

```
Input: s = "catsincars", wordDict = ["cats","cat","sin","in","car"]
Output: false
```

---
# Notes:

**Postmortem**:
1. DP interacting with Sliding Window is a little tricky for [[Big O]] analysis. Don't forget that multiple paths branching, so we need to be very careful about simplifying assumptions!
2. **Consider alternatives!** For word bank style problems, it looks like looping over words is often faster.

---
# Attempts:

##### Attempt 1
This feels a bit like a [[Sliding Window]] problem, except for the fact that if we hit a valid word, we need to try *both* breaking off the word AND skipping to the next char.

To do this a bit better, we can use [[Dynamic Programming]].
- Our states are the index and prior index (i.e., the left/right in sliding window)
- Our actions are making the word (if it's in the dictionary) or skipping to the next character
	- Skip: right + 1
	- Make: left, right = right + 1
- We continue until we reach the end as our base case
	- If we have the left greater than value then we end.

- So... I thought this had a [[Big O]] of $O(n)$, since we do a sliding window $O(n)$ and then use a [[Hash Function]] to check for being inside the word dictionary $O(1)$. 
	- However! This is not a true **sliding window** because we are using DP. 
	- We need to consider the full path for both paths, skip and make.
	- Because of the skip always happening, that means that worst case scenario we would need to check all the skips (i.e., all right values $O(n)$)
	- Because of the make sometimes happening, worst case we would have to do make on each one of the skips, which would then force the exploration above (i.e., $O(n*n)$)
	- Finally, don't forget that slicing in python is a $O(n)$ operation, bringing this code to $O(n^3)$ hence it being very slow.

##### Attempt 2
Great now that we have the recursive solution, we next want to do the iterative solution with DP memory loss.

Our direction in recursive was from left to right, so in iterative we want to go from right to left.

... Mr. Neetcode points out that it is actually more efficient to loop through the words in the word dictionary, and then check if those words are in the string, rather than loop through all the chars in the string.
- [[Big O]] of $O(n^2)$ for going through string char (at each char we check all other chars at worst, see above logic).
- [[Big O]] of $O(n*m)$ for going through the word dictionary. Problem says that word dictionary has fewer values than the string length, so this is generally faster.


---
# Solution:

```python
# Iterate based on sliding window.
class Solution:
    def wordBreak(self, s: str, wordDict: List[str]) -> bool:
        # convert worddict into a set for easier comparison
        wordDict = set(wordDict)

        # feels like sliding window
        # state: idx, previdx
        # actions: 
            # makeword: 
                # allow if s[previdx:idx+1] in wordDict
                # previdx = idx+1
                # idx = idx+1
            # skipchar
                # idx = idx+1

        # base case:
            # previdx >= len(s) then return True
            # idx >= len(s) then return False
        
        left, right = 0, 0
        break_word_memo: dict[tuple[int, int], bool] = {}

        def can_break_word_dp(left: int, right: int) -> bool:
            # base case
            if right >= len(s):
                return (left >= len(s))

            # memo case
            if (left, right) in break_word_memo:
                return break_word_memo[(left, right)]

            # DP recur
            # pre
            subword = s[left:right+1]
            # recur
            makeword = False
            skipchar = False
            ### Make Word
            if subword in wordDict:
                # can makeword
                makeword = can_break_word_dp(right+1, right+1)

            ### Skip Char
            skipchar = can_break_word_dp(left, right+1)

            # post
            can_break_word = makeword or skipchar
            break_word_memo[(left, right)] = can_break_word
            # return
            return can_break_word

        return can_break_word_dp(0,0)
```

```python
# Iterate based on WORD, not character sliding window.
class Solution:
    def wordBreak(self, s: str, wordDict: List[str]) -> bool:
        # convert worddict into a set for easier comparison

        left = 0
        can_break_word_memo: dict[int, bool] = {}

        def can_break_word_dp(left: int) -> bool:
            # base case
            if left >= len(s):
                return True
            
            # memo case
            if left in can_break_word_memo:
                return can_break_word_memo[left]
            
            # dp case
            # pre
            # recur
            can_break_word = False
            for word in wordDict:
                # check if word can fit
                if len(s) < left + len(word):
                    # can't fit
                    continue

                substr = s[left:left+len(word)]
                if substr != word:
                    continue

                can_break_for_word = can_break_word_dp(left+len(word))
                can_break_word = max(can_break_word, can_break_for_word)
                if can_break_word:
                    break  # we're done, no need to check more.

            # post
            can_break_word_memo[left] = can_break_word
            # return
            return can_break_word
        
        return can_break_word_dp(0)
```

----
# Source:
https://leetcode.com/problems/word-break/