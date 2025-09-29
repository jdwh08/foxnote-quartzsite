---
aliases:
tags:
  - cs/leetcode/medium
  - cs/dsa/greedy
  - review
edited: 2025-09-27T20:05
created: 2025-07-21T19:39
---
# Problem:
There are `n` gas stations along a circular route, where the amount of gas at the `ith` station is `gas[i]`.

You have a car with an unlimited gas tank and it costs `cost[i]` of gas to travel from the `ith` station to its next `(i + 1)th` station. You begin the journey with an empty tank at one of the gas stations.

Given two integer arrays `gas` and `cost`, return _the starting gas station's index if you can travel around the circuit once in the clockwise direction, otherwise return_ `-1`. If there exists a solution, it is **guaranteed** to be **unique**.

#### Bounds
- `n == gas.length == cost.length`
- `1 <= n <= 10^5`
- `0 <= gas[i], cost[i] <= 10^4`

#### Examples
```
**Input:** gas = [1,2,3,4,5], cost = [3,4,5,1,2]
**Output:** 3
**Explanation:**
Start at station 3 (index 3) and fill up with 4 unit of gas. Your tank = 0 + 4 = 4
Travel to station 4. Your tank = 4 - 1 + 5 = 8
Travel to station 0. Your tank = 8 - 2 + 1 = 7
Travel to station 1. Your tank = 7 - 3 + 2 = 6
Travel to station 2. Your tank = 6 - 4 + 3 = 5
Travel to station 3. The cost is 5. Your gas is just enough to travel back to station 3.
Therefore, return 3 as the starting index.
```

---
# Notes:
Mr. Neetcode himself says this is a hard problem to recognize that it is [[Greedy Algorithm]].

---
# Attempts:

##### Attempt 1
**Brute force** would be starting from every single index $i$ and seeing if the trip is possible, which is at most $O(n^2)$. We can see from the bounds that we return one value, must check all values $O(n)$ for the task, and compute max is $O(n\log n)$. Thus, we are looking for some linear-ish time solution.

**The crucial thing to notice in this is that we can skip all indexes if we fail.** After we remove all cases where gas is less than cost, we must have *one* valid solution.
- For us to go from start $i$ to end $i+k$, we must have been nonnegative on total gas throughout.
- If we fail at $i+k$, we should restart at $i+k+1$ and **ignore the prior stretch**.
- Starting at any point between $i$ and $i+k$ means that we start off with ZERO gas, which is at least as bad as the above.
- Thus, there *cannot be any points* in between to start with. We are safe to [[Greedy Algorithm]] and skip over all of them.

Thus, we need to...
1. Ensure total gas is at least total cost.
2. Calculate difference between gas and cost.
3. Accumulate differences over indexes.
	1. If we run out of gas, we reset our current gas and starting point.


---
# Solution:

```python
class Solution:
    def canCompleteCircuit(self, gas: List[int], cost: List[int]) -> int:
        delta: list[int] = [
            g-c for (g, c) in zip(gas, cost, strict=True)
        ]

        if sum(delta) < 0:
            return -1

        curgas = 0
        startidx = 0

        for idx in range(len(gas)):
            curgas += delta[idx]
            if curgas < 0:
                curgas = 0
                startidx = idx + 1
        
        return startidx
```

----
# Source:
https://leetcode.com/problems/gas-station/description/