---
aliases: 
tags:
  - cs/leetcode/easy
  - cs/dsa/heap
edited: 2025-08-16T10:29
created: 2025-07-23T18:42:00
---
# Problem:
You are given an array of integers `stones` where `stones[i]` is the weight of the `ith` stone.

We are playing a game with the stones. On each turn, we choose the **heaviest two stones** and smash them together. Suppose the heaviest two stones have weights `x` and `y` with `x <= y`. The result of this smash is:

- If `x == y`, both stones are destroyed, and
- If `x != y`, the stone of weight `x` is destroyed, and the stone of weight `y` has new weight `y - x`.

At the end of the game, there is **at most one** stone left.

Return _the weight of the last remaining stone_. If there are no stones left, return `0`.

#### Bounds
- `1 <= stones.length <= 30`
- `1 <= stones[i] <= 1000`

#### Examples
**Input:** `stones = [2,7,4,1,8,1]
**Output:** 1
**Explanation:** 
We combine 7 and 8 to get 1 so the array converts to `[2,4,1,1,1]`
We combine 2 and 4 to get 2 so the array converts to `[2,1,1,1]`
We combine 2 and 1 to get 1 so the array converts to `[1,1,1]`
We combine 1 and 1 to get 0 so the array converts to `[1]`.

---
# Notes:

TL;DR -- use negative of values to get a MAX HEAP in python to more efficiently choose the heaviest stones each time.

---
# Attempts:

##### Attempt 1
Need to remember how to use python's [[Heap]] for a MAX HEAP
- We only have a min heap, so need to multiply values by -1 to get max heap.
- it'It's `heapq.heapify(stones)` followed by `heapq.heappop(stones)` or `heapq.heappush(stones, new)`

---
# Solution:

```python
class Solution:

    def lastStoneWeight(self, stones: List[int]) -> int:
        # array ints weights of stones
        # choose two heaviest stones x, y -> smash
            # x == y -> both destroyed
            # x < y  -> x destroyed, y is now y-x
        # get the weight of the last stone, or 0 if none remain

        # issue is we always need the heaviest two stones.
        # therefore, a max heap is probably a good idea.
        stones = [-stone for stone in stones]
        heapq.heapify(stones)

        while len(stones) > 1:
            stone1 = -heapq.heappop(stones)
            stone2 = -heapq.heappop(stones)
            newstone1 = stone1 - stone2
            if newstone1 > 0:
                heapq.heappush(stones, -newstone1)

        if len(stones) <= 0:
            return 0

        return -heapq.heappop(stones)
```

----
# Source:
https://leetcode.com/problems/last-stone-weight/