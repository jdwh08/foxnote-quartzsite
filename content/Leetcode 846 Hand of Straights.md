---
aliases:
  - Leetcode 1296 Divide Array into K Sets of Consecutive Numbers
tags:
  - cs/leetcode/medium
  - cs/dsa/sort/bucket
  - cs/dsa/greedy
  - cs/dsa/array
  - cs/dsa/hashmap
edited: 2025-09-28T15:34
created: 2025-07-21T19:39
---
# Problem:
You are given an integer [[Array]] `hand` where `hand[i]` is the value written on the `ith` card and an integer `groupSize`.

You want to rearrange the cards into groups so that each group is of size `groupSize`, and card values are consecutively increasing by `1`.

Return `true` if it's possible to rearrange the cards in this way, otherwise, return `false`.

#### Bounds
- `1 <= hand.length <= 10^4`
- `0 <= hand[i] <= 10^9`
- `1 <= groupSize <= hand.length`

#### Examples


---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
We can think about the brute force but that's terrifying...
- For each group, for each card; try adding the card to the group, if doesn't work then backtrack.
- The [[Big O]] is... monsterous.
Our bounds are at minimum scanning the unique values of the array, so probably $O(n)$ as lower bound, and definitely $O(n \log n)$ for the TLE lower bound. 
 
Okay so we need some way to solve this problem.
Note that we're dealing with an [[Array]] with repeated values where the value and count are the things that matter. This naturally sets us up for a [[Hashmap]] counter. We can count them in $O(n)$.

Then, because of the ***consecutive*** it's probably a good idea to think about re-ordering our card keys. 
- We could do this with a [[Heap|Min Heap]] to get the smallest value each time. Practically this is slightly cheaper since it only takes $O(\log n)$ to make and $n * O(\log n)$ to run through, so it's a bit of a [[Lazy Algorithm]]. But come on.
- In practice, we'll probably just sort a list of the [[Hashmap]] keys and call it good enough for $O(n \log n)$.

Finally, we should always be able to start our consecutive card groups from the smallest card, and keep pulling cards until the largest card. To make this efficient, take out ALL of the counts of the smallest card at once.
- Break if no consecutive card.
- Break if too few of the consecutive card.

Resulting [[Big O]] is... tricky.
- Naive would say ... $O(n^2)$ since worst case scenario is that our number of groups $k$ is 1/2 of the total length of nums? And we are doing $u$ unique keys and $k$ values per key, which looks like $n^2$.
- However, remember that we did bucket sorting earlier. Each time we do a `for idx in k`, we remove all of the cards from the smallest pile. Note that we don't touch all cards again for all values, just some in a window. 
	- E.g., if $k=2$, and nums=4, we'd do 1-2, 2-3, 3-4. This is kinda like a [[Convolution]].
- Thus, this part is only $O(n)$
- What kills this algorithm slightly is the sorting, which takes $O(n \log n)$.

---
# Solution:

```python
class Solution:
    def isPossibleDivide(self, nums: List[int], k: int) -> bool:
        # k number of groups
        # each group has values which are consecutively increasing

        # basic check
        if len(nums) % k != 0:
            return False

        # instincts say something with bucket sort and counts?
        # brute force:
        # for group in k
            # for card in available nums
                # try adding card
                # backtrack if not work
        
        # counter of cards
        # then sort cards by key
        # then pull smallest card to group size
            # if not possible because nonconsec return false
            # otherwise reduce card count; pop if gone
            # gs--
        # repeat until gs is 0; return true

        # time complexity:
        # O(n) counter
        # O(k log k) sort ~ n
        # 1 * gs * n%gs -> gs half of nums -> 1/4 n^2
        # space O(n)

        # i suppose it'll have to do....
        counter = {}
        for card in nums:
            counter[card] = counter.get(card, 0) + 1
        
        # bucket sort
        # counter = dict(sorted(counter.items()))
        keys = sorted(counter.keys())

        # # do numssize ops
        # while len(counter) > 0:
        #     smallest_card = list(counter.keys())[0]
        #     for idx in range(k):
        #         if smallest_card + idx not in counter:
        #             # no consecutive card
        #             return False
                
        #         counter[smallest_card+idx] = counter[smallest_card+idx] - 1
        #         if counter[smallest_card+idx] == 0:
        #             del counter[smallest_card+idx]
        
        # return True

        # do numssize ops
        # more efficient - do it for all cards at the same time
        for smolcard in keys:
            if smolcard not in counter:
                continue
            smolcount = counter[smolcard]
            if smolcount <= 0:
                continue
            for idx in range(k):
                if smolcard + idx not in counter:
                    # no consec card
                    return False
                if counter[smolcard+idx] < smolcount:
                    # not enough cards
                    return False
                counter[smolcard+idx] = counter[smolcard+idx] - smolcount
        
        return True
```

----
# Source:
https://leetcode.com/problems/hand-of-straights/