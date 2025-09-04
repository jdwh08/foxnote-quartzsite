---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/backtrack
edited: 2025-08-09T20:12
created: 2025-07-23T18:42:00
---
# Problem:
Given a string containing digits from `2-9` inclusive, return all possible letter combinations that the number could represent. Return the answer in **any order**.

A mapping of digits to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

#### Bounds
- `0 <= digits.length <= 4`
- `digits[i]` is a digit in the range `['2', '9']`.

#### Examples
**Input:** `digits = "23"
**Output:** `["ad","ae","af","bd","be","bf","cd","ce","cf"]

**Input:** `digits = ""
**Output:** `[]

---
# Notes:
We use [[Backtracking]] with a [[Hashmap]] of possible actions that we can take.

---
# Attempts:

##### Attempt 1
I at first thought this was permutations (i.e. all possible orderings of all possible digits) which got me scared because that looks like some kind of two-layer backtracking but fortunately it's not.

It's a straightforward idea to use [[Hashmap]] for combinations.
We have the classic "add which letter?" which has many letters hence for loop.

---
# Solution:

```python
class Solution:

    def letterCombinations(self, digits: str) -> List[str]:
        # digits 2-9
        # mapping to chars
        # 2(abc), 3(def), 4(ghi), 5(jkl), 6(mno), 7(pqrs), 8(tuv), 9(wxyz)

        # get all possible LETTER COMBINATIONS for digits.
        # small constraints
        # list of list of char
        # backtracking!!!

        # we have two problems:
            # 1) order of digits
                # probably have a list of (seen / not-seen) which we iterate through
		    # NOPE NEVERMIND WE Don't HAVE THIS, it's combos not permutatins
            # 2) letters within each digit

        if len(digits) <= 0:
            return []

        choices: dict[str, list[str]] = {
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"]
        }

        # we're doing combinations
        # sort the digits
        output: set[tuple[str]] = set()

        def backtrack(idx: int=0, path: list[str]=[]):
            # base case:
            if idx >= len(digits):
                output.add(tuple(path))
                return

            # use the digit!
            letter_choices = choices.get(digits[idx], [])
            for letter in letter_choices:
                # add
                path.append(letter)
                backtrack(idx+1, path)
                # undo
                path.pop()

        backtrack()

        final_output: list[str] = [
            "".join(path)
            for path in output
        ]
        return final_output
```

----
# Source:
https://leetcode.com/problems/letter-combinations-of-a-phone-number/