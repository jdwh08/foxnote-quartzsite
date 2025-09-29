---
aliases:
tags:
  - cs/leetcode/medium
  - cs/dsa/array
  - cs/dsa/greedy
  - cs/dsa/search/linear
edited: 2025-09-28T19:50
created: 2025-07-21T19:39
---
# Problem:
You are given a 2D array of integers `triplets`, where `triplets[i] = [ai, bi, ci]` represents the `ith` **triplet**. You are also given an array of integers `target = [x, y, z]` which is the triplet we want to obtain.

To obtain `target`, you may apply the following operation on `triplets` zero or more times:

Choose two **different** triplets `triplets[i]` and `triplets[j]` and update `triplets[j]` to become `[max(ai, aj), max(bi, bj), max(ci, cj)]`.  
* E.g. if `triplets[i] = [1, 3, 1]` and `triplets[j] = [2, 1, 2]`, `triplets[j]` will be updated to `[max(1, 2), max(3, 1), max(1, 2)] = [2, 3, 2]`.

Return `true` if it is possible to obtain `target` as an **element** of `triplets`, or `false` otherwise.

#### Bounds
- `1 <= triplets.length <= 10^5`
- `triplets[i].length == target.length == 3`
- `1 <= ai, bi, ci, x, y, z <= 1000`

#### Examples
```
**Input:** triplets = [[2,5,3],[1,8,4],[1,7,5]], target = [2,7,5]
**Output:** true
**Explanation:** Perform the following operations:
- Choose the first and last triplets [[2,5,3],[1,8,4],[1,7,5]]. Update the last triplet to be [max(2,1), max(5,7), max(3,5)] = [2,7,5]. triplets = [[2,5,3],[1,8,4],[2,7,5]]
The target triplet [2,7,5] is now an element of triplets.
```
```
**Input:** triplets = [[3,4,5],[4,5,6]], target = [3,2,5]
**Output:** false
**Explanation:** It is impossible to have [3,2,5] as an element because there is no 2 in any of the triplets.
```

---
# Notes:
I'm really quite chuffed about this one.
**The Brute Force -> articulate the suck -> fix the suck -> Big O -> approval -> code pattern really seems to be working well for me.**

---
# Attempts:

##### Attempt 1
We have triplets we are trying to create.

**[[Brute Force]]** would give us something like:
```
for i in triplets
	for j in triplets[i]
		merge
		check
		backtrack
```
which sucks because we're potentially checking all combinations which is $O(n!)$.

Why does this suck? Well, we don't know which triplets to check, so we're checking all of them. Can we fix this?

Look at how we're merging triplets. We are using `max`. This saves us.
Max has two [[Invariant]] properties:
1. It only picks one of the values fed into it. We can't "manufacture" new values!
2. Max always picks the larger value even if you want it to do something different.

This means we need the following:
- Three candidates x, y, z which have their values the same as the target
- AND whose other values aren't larger so they mess up merging
- This is [[Greedy Algorithm]] since we only need to check these values, and skip others.

We can therefore use a [[Linear Array Search]] to find this. This means our [[Big O]] is $O(n)$, and our space is $O(1)$.

---
# Solution:

```python
class Solution:
    def mergeTriplets(self, triplets: List[List[int]], target: List[int]) -> bool:
        # 2d triplets; t[i] = [a, b, c]
        # target [x, y, z] as target

        # chose two in triplets
        # t[j] = [max(a), max(b), max(c)]

        # true if possible
        # false otherwise

        # brute force (dont do this!)
        # for i in triplets
        # for j in triplets[i]
            # check max
            # pop
            # continue
            # backtrack
        
        # sticking point: 
            # i need to know which triplet(s) to merge

        # fortunately, we have max as the thing each time
        # so ...
            # 1. target [x, y, z] must show up as numbers in triplets
            # 2. the triplets used for that maxing CANNOT have the other vals larger than target
            # otherwise, when maxing for x we'd mess up y/z

        # do a linear scan of triplets
        # keep note of all triplets which meet the x/y/z axis AND have others smaller than target
        # keep one candidate for each of x/y/z
        # if have not all candidates filled at end, then return false.

        # big O: O(n) where n is number of triplets
        # storage: 3

        x_can: list[int] | None = None
        y_can: list[int] | None = None
        z_can: list[int] | None = None

        x, y, z = target
        for trip in triplets:
            a, b, c = trip

            # x candidate
            if (
                x_can is None
                and a == x
                and b <= y
                and c <= z
            ):
                x_can = trip
            
            # y candidate
            if (
                y_can is None
                and a <= x
                and b == y
                and c <= z
            ):
                y_can = trip
            
            # z candidate
            if (
                z_can is None
                and a <= x
                and b <= y
                and c == z
            ):
                z_can = trip
        
        output = (
            x_can is not None
            and y_can is not None
            and z_can is not None
        )
        return output
```

----
# Source:
https://leetcode.com/problems/merge-triplets-to-form-target-triplet/