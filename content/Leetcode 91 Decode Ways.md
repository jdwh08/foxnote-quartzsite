---
aliases:
tags:
  - cs/leetcode/medium
  - cs/dsa/dp
  - cs/string
edited: 2025-09-01T14:56
created: 2025-07-23T18:42:00
---
# Problem:
A string consisting of uppercase English characters can be encoded to a number using the following mapping:

```java
'A' -> "1"
'B' -> "2"
...
'Z' -> "26"
```

To **decode** a message, digits must be grouped and then mapped back into letters using the reverse of the mapping above. There may be multiple ways to decode a message. For example, `"1012"` can be mapped into:

- `"JAB"` with the grouping `(10 1 2)`
- `"JL"` with the grouping `(10 12)`

The grouping `(1 01 2)` is invalid because `01` cannot be mapped into a letter since it contains a leading zero.

Given a string `s` containing only digits, return the number of ways to **decode** it. You can assume that the answer fits in a **32-bit** integer.

#### Bounds
- `1 <= s.length <= 100`
- `s` consists of digits

#### Examples
```
Input: s = "12"
Output: 2
Explanation: "12" could be decoded as "AB" (1 2) or "L" (12).
```

```
Input: s = "01"
Output: 0
```

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
- A-1 char mapping
- digits are grouped and converted into numbers
- Count **number of ways** to decode.

Input is array/string, output is a number with NUMBER OF WAYS. Current number of ways does not depend on prior number of ways directly, i.e., independent subproblems. This suggests [[Dynamic Programming]]. 

What is the recurrence relation?
- States are the index in string
- Transition is taking one character or taking two characters.
	- Take 1 character moves $i \rightarrow i+1$. Valid so long as $i+1$ is not "0" since no leading zeros.
	- Take 2 character moves $i \rightarrow i+2$. Valid so long as $i+2$ is not "0" since no leading zeros. AND also `s[i:i+2]` must be a valid character (under 26).

- We track the number of ways (i.e., reach end), and progress via the char index. 
	- To get ways at index, we get the sum of take 1 and take 2.

OOPS: Edge case -- we don't actually check if the string is valid, only if the strings we get after action are valid. Thus, we actually need to have an initial validity check if `s[0] = "0"`.

Time and space [[Big O]] are usual for DP, i.e., we go over all characters $O(n)$ and it takes $O(1)$ to calculate each one, so $O(n)$.

##### Attempt 2
Okay now we should try the uncomfortable way to do this. 
Our intuitive recursive solution goes from index 0 to $n$, so the loop iterative version should go the other way from $n-1$ to $-1$. 

We still store all of our stuff in a DP memo. 
Our conditions are:
- Base Case: there is one way to get to the end $len+1$.
- Take 1: we get the prior way `memo[i+1]` IF the current value is not "0".
- Take 2: we get the prior way `memo[i+2]` IF the current value is not "0" AND $s[i:i+2] < 26$.

We can consolidate this into one single check for `s[i] == "0" continue`.

##### Attempt 3
Now we can actually space efficient make this, so it's $O(1)$. Notice how we only need two values for the recurrence relation: `memo[i+1], memo[i+2]`, regardless of our input size $n$. This means we can make our memory $O(1)$!

Basically we can 

---
# Solution:

```python
class Solution:
    def numDecodings(self, s: str) -> int:
        # a-1 char mapping
        # digits are grouped and converted into numbers
            # 1012 can be JAB (10, 1, 2) or JL (10, 12)
            # note no zero char nor leading zeros.

        if s[0] == "0":
            return 0

        ways_memo: list[int] = [-1] * len(s)

        def can_take_one(idx: int) -> bool:
            if idx+1 < len(s) and s[idx+1] == "0":
                return False
            return True

        def can_take_two(idx: int) -> bool:
            if idx+1 >= len(s):
                return False
            if idx+2 < len(s) and s[idx+2] == "0":
                return False
            if int(s[idx:idx+2]) > 26:
                return False
            return True

        def get_ways_at_idx_dp(idx: int) -> int:
            # base case
            if idx >= len(s):
                # we're done
                return 1

            # memo case
            if ways_memo[idx] >= 0:
                return ways_memo[idx]
            
            # DP
            # recur
            take_one = (
                get_ways_at_idx_dp(idx+1)
                if can_take_one(idx)
                else 0
            )
            take_two = (
                get_ways_at_idx_dp(idx+2)
                if can_take_two(idx)
                else 0
            )
            # post
            num_ways_at_idx = take_one + take_two
            ways_memo[idx] = num_ways_at_idx
            # return
            return num_ways_at_idx
        
        output = get_ways_at_idx_dp(0)
        return output
```

```python
class Solution:
    def numDecodings(self, s: str) -> int:
        ways_memo: list[int] = [-1] * (len(s)+1)
        ways_memo[len(s)] = 1

        for idx in range(len(s)-1, -1, -1):
            if s[idx] == "0":
                ways_memo[idx] = 0
                continue

            # Take 1
            ways_memo[idx] = ways_memo[idx+1]

            # Take 2
            if idx+1 < len(s) and int(s[idx:idx+2]) <= 26:
                ways_memo[idx] += ways_memo[idx+2]
        
        return ways_memo[0]
```

----
# Source:
Source