---
aliases: 
tags:
  - cs/leetcode
  - cs/dsa/dp
  - cs/leetcode/easy
edited: 2025-08-17T14:59
created: 2024-03-19T22:06
---
# Problem:
You are given an integer [[Array]] `cost` where `cost[i]` is the cost of `ith` step on a staircase. Once you pay the cost, you can either climb one or two steps.

You can either start from the step with index `0`, or the step with index `1`.

Return _the minimum cost to reach the top of the floor_.

#### Bounds
- `2 <= cost.length <= 1000`
- `0 <= cost[i] <= 999`
#### Examples
`[1,2,3]`: Output is 2.

```
**Input:** cost = [1,100,1,1,1,100,1,1,100,1]
**Output:** 6
**Explanation:** You will start at index 0.
- Pay 1 and climb two steps to reach index 2.
- Pay 1 and climb two steps to reach index 4.
- Pay 1 and climb two steps to reach index 6.
- Pay 1 and climb one step to reach index 7.
- Pay 1 and climb two steps to reach index 9.
- Pay 1 and climb one step to reach the top.
The total cost is 6.
```

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
This is [[Dynamic Programming]] because we're looking at a min cost problem. Our states are clearly defined as the stair level, and our transitions are going up one or two stairs. Information depends only on the stair level. Thus, DP is suitable.

We store a min_cost_to_climb_to cache which starts at the highest value inf, and set the costs for 0 and 1 to be 0 since we can start at either point there. 

Our transitions are either coming up from two floors away or one floor away. In either case the cost is `cost_to_climb_to_floor[i] + cost[i]`. We want to take the minimum.

Because of the caching, we visit each stair once and cost $O(1)$ to get values, so it has [[Big O]] time and space complexity of $O(n)$.

---
# Solution:

```python
class Solution:
    def minCostClimbingStairs(self, cost: List[int]) -> int:
        # cost i is cost of taking step from ith floor
            # can go to (i+1) or (i+2)
            # can start at 0 or 1
        
        # return minimum cost of going to top
        min_cost_to_climb_to_cache: list[int] = [float("inf")] * (len(cost)+1)

        # can start at 0/1 means free cost
        min_cost_to_climb_to_cache[0] = 0
        min_cost_to_climb_to_cache[1] = 0

        # min_cost(i) = min(min_cost(i-1), min_cost(i-2))

        def min_cost_to_climb_to_dp(stair: int) -> int:
            # base case
            if stair < 0:
                return float("inf")

            # memo case
            if min_cost_to_climb_to_cache[stair] < float("inf"):
                return min_cost_to_climb_to_cache[stair]
            
            # recursion
            # pre
            climb_up_two = float("inf")
            climb_up_one = float("inf")
            # recur
            if stair-2 >= 0:
                climb_up_two = min_cost_to_climb_to_dp(stair-2) + cost[stair-2]
            if stair-1 >= 0:
                climb_up_one = min_cost_to_climb_to_dp(stair-1) + cost[stair-1]
            # post
            cost_to_climb_to_stair = min(climb_up_two, climb_up_one)
            min_cost_to_climb_to_cache[stair] = cost_to_climb_to_stair
            # return
            return cost_to_climb_to_stair
        
        return min_cost_to_climb_to_dp(len(cost))
```

----
# Source:
Source