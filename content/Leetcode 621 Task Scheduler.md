---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/heap
  - cs/dsa/queue
  - todo
edited: 2025-08-05T20:24
created: 2025-07-23T18:42:00
---
# Problem:
You are given an array of CPU tasks `tasks`, where `tasks[i]` is an uppercase english character from `A` to `Z`. You are also given an integer `n`.

Each CPU cycle allows the completion of a single task, and tasks may be completed in any order.

The only constraint is that **identical** tasks must be separated by at least `n` CPU cycles, to cooldown the CPU.

Return the _minimum number_ of CPU cycles required to complete all tasks.

#### Bounds
- `1 <= tasks.length <= 1000`
- `0 <= n <= 100`

#### Examples
```
Input: tasks = ["X","X","Y","Y"], n = 2

Output: 5
```

---
# Notes:
- Tasks are categorized as A-Z.
- 1 CPU cycle = 1 task (or cooldown)
- Identical tasks separated by $n$ for cooldown
- Return the minimum CPU cycles for all tasks

- We know that we should try running the most frequent tasks, and stuff less frequent tasks in between.
	- Otherwise, we have more "dead time" where we sit around waiting for cooldown.
- We already have pre-existing categories, so first use a Counter for [[Bucket Sort]].
- Most frequent tasks requires getting the top $n$ values consistently (stuff $n$ values into cooldown), which means a [[Heap|Max Heap]] is required.
	- Add values to heap by count, pop them off, then add them back on after finished

---
# Attempts:

##### Attempt 1
I used a max heap and assumed that we could directly loop through all values in the cycle of time $n$ without having to keep track of when cooldowns happen, just the buffer of tasks.

##### Attempt 2
... This turns out to not quite be right because a "full cycle" isn't always guaranteed to line up to when cooldowns occur. We therefore need to keep moving time forward until we hit the cooldown, and then handle it.

We also should use a [[Queue]] instead of an ArrayList to allow for cheaper popleft operations.

---
# Solution:

```python
class Solution:

    def leastInterval(self, tasks: List[str], n: int) -> int:
	    # setup
	    # get buckets
        frequencies = Counter(tasks)
        # use to make min heap
        maxheap = [-c for c in frequencies.values()]
        heapq.heapify(maxheap)
        # add cooldown queue
        cooldown = deque()
        time = 0

		# loop through time
        while len(maxheap) > 0 or len(cooldown) > 0:
            time += 1
            if len(maxheap) > 0:
                taskcount = -heapq.heappop(maxheap)
                taskcount = taskcount-1
                if taskcount > 0:
                    cooldown.append((taskcount, time+n))

            # clear out cooldown
            while cooldown and cooldown[0][1] <= time:
                taskcount, _ = cooldown.popleft()
                heapq.heappush(maxheap, -taskcount)

        return time
```

----
# Source:
https://leetcode.com/problems/task-scheduler/
