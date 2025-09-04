---
aliases: 
tags:
  - cs/leetcode/hard
  - cs/dsa/heap
edited: 2025-08-07T21:45
created: 2025-07-23T18:42:00
---
# Problem:
The **median** is the middle value in an ordered integer list. If the size of the list is even, there is no middle value, and the median is the mean of the two middle values.

- For example, for `arr = [2,3,4]`, the median is `3`.
- For example, for `arr = [2,3]`, the median is `(2 + 3) / 2 = 2.5`.

Implement the MedianFinder class:

- `MedianFinder()` initializes the `MedianFinder` object.
- `void addNum(int num)` adds the integer `num` from the data stream to the data structure.
- `double findMedian()` returns the median of all elements so far. Answers within `10-5` of the actual answer will be accepted.

Followups
- If all integer numbers from the stream are in the range `[0, 100]`, how would you optimize your solution?
	- Store in array, use two-pointers from the outwards in, O(100) time.
- If `99%` of all integer numbers from the stream are in the range `[0, 100]`, how would you optimize your solution?
	- Store in array with overflow controlled by heaps?

#### Bounds
- `-10^5 <= num <= 10^5`
- There will be at least one element in the data structure before calling `findMedian`.
- At most `5 * 10^4` calls will be made to `addNum` and `findMedian`.

#### Examples


---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
Had to think about it a little bit.
- We had a (large) hint that it probably uses [[Heap]] since we were practicing heap problems.

We can get a median by using the classic Minimax / Maximin stuff -- the median is the minimum max value or maximum min value, etc.
- This requires two heaps, a max heap for small values and a min heap for large values.
- We save the median either as a distinct value OR as the average between the tops of the two heaps.

- Conditional logic with five branches for where to put the new value relative to the heaps.

##### Attempt 2
... Python treats 0 as failing `if self.median`, doesn't it.
This is why I always write explicit `is None` checks, except this one time. :(

---
# Solution:

```python
class MedianFinder:
    def __init__(self):
        self.smallmaxheap = []
        self.largeminheap = []
        self.median: int | None = None

        heapq.heapify(self.smallmaxheap)
        heapq.heapify(self.largeminheap)

    def addNum(self, num: int) -> None:
        # base case
        if self.median is None and (len(self.smallmaxheap) + len(self.largeminheap)) <= 0:

            # set the num to median
            self.median = num
            return

        # median exists and num > median
        if self.median is not None and num >= self.median:
            # we add the num to the right heap
            heapq.heappush(self.largeminheap, num)
            # now we have an even number of values
            # median is now smaller than the middle, so it goes to left
            heapq.heappush(self.smallmaxheap, -self.median)  # max heap
            self.median = None
            return

        # median exists and num < median
        if self.median is not None and num < self.median:
            # we add the num to the left heap
            heapq.heappush(self.smallmaxheap, -num)  # max heap
            # now we have an even number of values
            # median is now larger than the middle, so it goes to right
            heapq.heappush(self.largeminheap, self.median)
            self.median = None
            return

        # median does not exist
        # we must have at least one value in each heap
        cur_median = self.findMedian()
        if num >= cur_median:
            # we add the num to the right heap
            heapq.heappush(self.largeminheap, num)
            # our new median must be from the right heap
            self.median = heapq.heappop(self.largeminheap)
            return

        if num < cur_median:
            # we add the num to the left heap
            heapq.heappush(self.smallmaxheap, -num)  # it's a max heap
            # our new median must be from the left heap
            self.median = -heapq.heappop(self.smallmaxheap)
            return

    def findMedian(self) -> float:
        return (
            self.median
            if self.median is not None
            else (-self.smallmaxheap[0] + self.largeminheap[0]) / 2
        )
```

----
# Source:
https://leetcode.com/problems/find-median-from-data-stream/description/