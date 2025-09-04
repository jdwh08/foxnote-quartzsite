---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/greedy
  - cs/dsa/stack
edited: 2025-07-23T07:51
created: 2024-03-19T22:06
---
# Problem:
You are given a string `s` and two integers `x` and `y`. You can perform two types of operations any number of times.
1. Remove substring `"ab"` and gain `x` points.
2. Remove substring `"ba"` and gain `y` points.

Return _the maximum points you can gain after applying the above operations on_ `s`.

#### Examples
s = "cdbcbbaaabab", x = 4, y = 5
Answer: 19
- Remove ba from "cdbcbbaaa(ba)b" to get +5
- Remove ab from "cdbcbbaa(ab)" to get +4
- Remove ba from "cdbcb(ba)a" to get +5
- Remove ba from "cdbc(ba)" to get +5
- Total points is 19.

---
# Notes:

Okay so I think there's some kind of recursion.
My initial though as with everything is "IS IT DP"? and I think the answer is NO because removing letters changes the string state so it's not markov.

That means it's probably one of two things: BFS, DFS, or Backtracking.
I get Backtracking vibes.

I just need to return the SCORE not the final string so we don't need to store as much and can do a max compare.

Let's use a stack to save the values for backtracking because of LIFO

...
Okay it's not backtracking.
In fact, after looking at the hint, you realize that removing substrings doesn't block you from better solutions later on. I.e., we are in a [[Greedy Algorithm]] situation.
Thus, we should remove all high point substrings before removing all low point substrings.

---
# Attempts:

##### Attempt 1
*Hints* to recognize that it didn't matter figuring out the order of removing the strings, so long as we remove them in a greedy way. **THIS FACT RULES OUT BACKTRACKING SINCE THE OPTIMAL PATH IS CLEAR**. I should have whiteboarded more to get to this point. 

Once we saw that, I started sketching a solution where you remove all strings of a type until you are done. *I CHEATED AND LOOKED AT THE SOLUTION CODE TO SEE WHAT PEOPLE WERE DOING*. 

The easiest way to save the string for manipulation is a [[Stack]], because messing around with pointers shifts things each time we remove characters.

---
# Solution:

```python
def maximumGain(self, s: str, x: int, y: int) -> int:

        points = 0

        def remove_substring_to_get_points(string: str, substring: str, value: int, points: int) -> tuple[str, int]:

            if len(string) <= 0:
                return "", points

            letters = [string[0]]
            string_cut = string[1:]

            for char in string_cut:
                if (
                    len(letters) > 0
                    and letters[-1] == substring[0]
                    and char == substring[1]
                ):
                    # we have a substring match!
                    letters.pop()
                    points += value

                else:
                    letters.append(char)

            return "".join(letters), points

        if x > y:
            new_s, points = remove_substring_to_get_points(s, "ab", x, 0)
            new_s, points = remove_substring_to_get_points(new_s, "ba", y, points)

        else:
            new_s, points = remove_substring_to_get_points(s, "ba", y, 0)
            new_s, points = remove_substring_to_get_points(new_s, "ab", x, points)

        return points
```

----
# Source:
Source