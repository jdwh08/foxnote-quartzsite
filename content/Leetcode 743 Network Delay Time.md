---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/graph/path/dijkstra
edited: 2025-08-13T21:29
created: 2025-07-23T18:42:00
---
# Problem:
You are given a network of `n` nodes, labeled from `1` to `n`. You are also given `times`, a list of travel times as directed edges `times[i] = (ui, vi, wi)`, where `ui` is the source node, `vi` is the target node, and `wi` is the time it takes for a signal to travel from source to target.

We will send a signal from a given node `k`. Return _the **minimum** time it takes for all the_ `n` _nodes to receive the signal_. If it is impossible for all the `n` nodes to receive the signal, return `-1`.

#### Bounds
- `1 <= k <= n <= 100`
- `1 <= times.length <= 6000`
- `times[i].length == 3`
- `1 <= ui, vi <= n`
- `ui != vi`
- `0 <= wi <= 100`
- All the pairs `(ui, vi)` are **unique**. (i.e., no multiple edges.)

#### Examples
**Input:** `times = [[2,1,1],[2,3,1],[3,4,1]], n = 4, k = 2`
**Output:** `2`

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
This is just asking for [[Dijkstra's Algorithm]].

---
# Solution:

```python
class Solution:

    def networkDelayTime(self, times: List[List[int]], n: int, k: int) -> int:
        # network of n nodes
        # times: (source, target, time)

        # send a signal from node k
        # get minimum time for all nodes to receive signal or -1 if none
        # shortest path from k to all nodes

        # dijkstra's algorithm

        # convert times into a graph
        graph: dict[int, set[tuple[int, int]]] = {
            node: set()
            for node in range(1, n+1)
        }

        for source, target, time in times:
            graph[source].add((target, time))

        # set up dijkstra's
        seen: set[int] = set()
        best_times: dict[int, int] = defaultdict(
            lambda: float("inf")
        )  # best time from k to node

        minheap = [(0, k)]
        heapq.heapify(minheap)

        while len(minheap) > 0:
            traveltime, node = heapq.heappop(minheap)
            if node in seen:
                continue

            seen.add(node)

            for neighbour, edgeweight in graph.get(node, []):
                tot_travel_time = traveltime + edgeweight
                # print(node, neighbour, edgeweight, tot_travel_time)

                if best_times[neighbour] > tot_travel_time:
                    best_times[neighbour] = tot_travel_time

                if neighbour not in seen:
                    heapq.heappush(minheap, (tot_travel_time, neighbour))

        # remove yourself
        if k in best_times:
            del best_times[k]

        if len(best_times.values()) != (n-1):
	        # we can't reach all values from k!
            return -1

        longest_travel_time = max(best_times.values())
        if longest_travel_time == float("inf"):
            return -1

        return longest_travel_time
```

----
# Source:
https://leetcode.com/problems/network-delay-time/