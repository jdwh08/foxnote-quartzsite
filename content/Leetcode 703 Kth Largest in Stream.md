---
aliases: 
tags:
  - cs/leetcode/easy
  - cs/dsa/heap
edited: 2025-08-01T21:20
created: 2025-07-23T18:42:00
---
# Problem:
Design a class to find the `kth` largest integer in a stream of values, including duplicates. E.g. the `2nd` largest from `[1, 2, 3, 3]` is `3`. The stream is not necessarily sorted.

#### Bounds
- `1 <= k <= 1000`
- `0 <= nums.length <= 1000`
- `-1000 <= nums[i] <= 1000`
- `-1000 <= val <= 1000`
- There will always be at least `k` integers in the stream when you search for the `kth` integer.

#### Examples
Input:
`["KthLargest", [3, [1, 2, 3, 3]], "add", [3], "add", [5], "add", [6], "add", [7], "add", [8]]

Output:
`[null, 3, 3, 3, 5, 6]

Explanation:
```java
KthLargest kthLargest = new KthLargest(3, [1, 2, 3, 3]);
kthLargest.add(3);   // return 3
kthLargest.add(5);   // return 3
kthLargest.add(6);   // return 3
kthLargest.add(7);   // return 5
kthLargest.add(8);   // return 6
```

---
# Notes:
[[Heap]]!

---
# Attempts:

##### Attempt 1
Okay, so we could use a sorted array to store the values and then add/remove so we only keep the top values over time.
- Each pass in add would require a [[Linear Array Search]] which is $O(n)$, which is too slow.

Really not sure how to use heapify in python, am using this one to learn.

##### Attempt 2:
1. We use heapq.heapify on an existing array to turn it into a minheap. $O(n)$
2. The kth largest is the same thing as saying the ***smallest value in the top k***
	1. Thus, we use a minheap with capacity k
3. We pop values until it's of the minheap size.
4. We add values until it's okay.

---
# Solution:

```python
class KthLargest:
    minheap: list[int]
    k: int

    def __init__(self, k: int, nums: List[int]):
        # okay so this is basically just a min heap?
        self.minheap, self.k = nums, k
        heapq.heapify(self.minheap)
        while len(self.minheap) > k:
            heapq.heappop(self.minheap)

    def add(self, val: int) -> int:
        heapq.heappush(self.minheap, val)
        if len(self.minheap) > self.k:
            heapq.heappop(self.minheap)
        return self.minheap[0]
```

This worst case requires $O(n)$ to build the heap but then for each pop we take $\log(n)$, we need to do this up to $n$ times so $n \log(n)$.

----
# Source:
https://neetcode.io/problems/kth-largest-integer-in-a-stream