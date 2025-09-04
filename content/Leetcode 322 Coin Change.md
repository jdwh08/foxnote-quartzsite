---
aliases:
tags:
  - cs/leetcode/medium
edited: 2025-09-01T19:55
created: 2025-07-23T18:42:00
---
# Problem:
You are given an integer array `coins` representing coins of different denominations and an integer `amount` representing a total amount of money.

Return _the fewest number of coins that you need to make up that amount_. If that amount of money cannot be made up by any combination of the coins, return `-1`.

You may assume that you have an infinite number of each kind of coin.

#### Bounds
- `1 <= coins.length <= 12`
- `1 <= coins[i] <= 2^31 - 1`
- `0 <= amount <= 10^4`

#### Examples
```
**Input:** coins = [1,2,5], amount = 11
**Output:** 3
**Explanation:** 11 = 5 + 5 + 1
```

```
**Input:** coins = [2], amount = 3
**Output:** -1
```

---
# Notes:

**Postmortem**
1. Remember to think about consideration for default values -- make sure they are not shared with other values (e.g., unreachable)
2. Take some time to consider the *direction* for DP problems.
3. Where possible, try avoiding extra state definition stuff.

---
# Attempts:

##### Attempt 1
This is DP since it's based on amount and current coin index.
- State is index and value
- Actions are take (idx, val + coin) and skip (idx+1, val)
- Base case is when we hit `amount` exactly or go over

---
# Solution:

```python
class Solution:
    def coinChange(self, coins: List[int], amount: int) -> int:
        # state: index, value
        # transitions:
            # take: idx, val += coins[idx]
            # skip: idx+1, val
        
        # conditions:
            # base case hit amt save to memo
            # go over amount return -1

        num_coins_memo: dict[int, int] = {}

        def get_num_coins_to_make_dp(val: int) -> int:
            # base case
            if val == 0:
                return 0
            if val < 0:
                return float("inf")

            # memo case
            if val in num_coins_memo:
                return num_coins_memo[val]

            # dp case
            # pre
            # recur
            best_num_coins = float("inf")
            for coin in coins:
                ### take
                take = float("inf")
                if val-coin <= amount:
                    take = 1 + get_num_coins_to_make_dp(val-coin)

                ### skip
                skip = best_num_coins
                # post
                best_num_coins = min(take, skip)

            num_coins_memo[val] = best_num_coins
            # return
            return best_num_coins

        best_num_coins_to_make = get_num_coins_to_make_dp(amount)
        if best_num_coins_to_make == float("inf"):
            return -1
        return best_num_coins_to_make

```

----
# Source:
https://leetcode.com/problems/coin-change/