---
aliases: 
tags:
  - cs/leetcode/medium
edited: 2025-08-16T19:18
created: 2025-07-23T18:42:00
---
# Problem:
There are `n` airports, labeled from `0` to `n - 1`, which are connected by some flights. You are given an array `flights` where `flights[i] = [from_i, to_i, price_i]` represents a one-way flight from airport `from_i` to airport `to_i` with cost `price_i`. You may assume there are no duplicate flights and no flights from an airport to itself.

You are also given three integers `src`, `dst`, and `k` where:

- `src` is the starting airport
- `dst` is the destination airport
- `src != dst`
- `k` is the maximum number of stops you can make (not including `src` and `dst`)

Return **the cheapest price** from `src` to `dst` with at most `k` stops, or return `-1` if it is impossible.

#### Bounds
- `1 <= n <= 100`
- `fromi != toi`
- `1 <= pricei <= 1000`
- `0 <= src, dst, k < n`

#### Examples
```
Input: n = 4, flights = [[0,1,200],[1,2,100],[1,3,300],[2,3,100]], src = 0, dst = 3, k = 1

Output: 500

The optimal path with at most 1 stop from airport 0 to 3 is 0-1-3, with total cost `200 + 300 = 500`.  
Note that the path `[0 -> 1 -> 2 -> 3]` costs only 400, and thus is cheaper, but it requires 2 stops, which is more than k.
```

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
This is a [[Graph]] problem.

For some reason I thought this could be solved by getting the minimum spanning tree which contains the start and end destinations? So I debated between Primm's and Kruskal's, realized Kruskal's doesn't guarantee start/end values, and did a modified version of Primm's which is basically a [[Binary Search Tree|BST]] with a [[Heap]].

We need to keep track of the current cost, number of layovers, and current node, so those get added to the priority queue. Each time we pop one off, have base cases for reaching the destination. It's NOT okay to have a base case for "seen" based on node alone, because we will be revisiting nodes based on a combination of node AND layovers.

Our transitions are to increase layovers by 1 if we are not at destination, and to update cost and neighbour accordingly.

Surprisingly it does give the correct answer on Neetcode but is way too slow and TLE on Leetcode because we go through and explore most option(s), and we don't have a good seen/caching system.

##### Attempt 2:
No you silly this is clearly a Shortest Path problem for a graph, which means our options are like [[Dijkstra's Algorithm]] or [[Bellman-Ford Algorithm]].

Here we do Dijkstra's. It's honestly quite similar to the Attempt 1 variation, except similar to Dynamic Programming we cache the value(s) to cut down on processing time. This allows for us to check if the current value is better than our known best, and only run BFS in those cases.

Our state definition, like above, is a combination of both the node AND layovers. Thus, this is kinda like 2D DP where we store our "best known" values in a 2D matrix of size `|N| * K`.

##### Attempt 3:
It turns out there 

---
# Solution:

Way too slow.
```python
class Solution:
    def findCheapestPrice(self, n: int, flights: List[List[int]], src: int, dst: int, k: int) -> int:
        # turn to graph
        # use Prim's MST from src to dst keeping track of our k value
        # backtrack if hit k

        graph: dict[int, set[tuple[int, int]]] = {
            i: set() for i in range(n)
        }
        # populate graph
        for flight_src, flight_dst, flight_cost in flights:
            graph[flight_src].add((flight_cost, flight_dst))

        ########################################
        # Primm inspired
        # start at start
        # track seen nodes
        # add node neighbours to MINHEAP
        # while heap pop and repeat
        
        # base case:
        # arrived at dst
        # out of heap nodes
        # too many layovers
        
        # keep track of...
            # cost, num_layovers, current node
        # backtracking

        seen: set[int] = set()

        minheap: list[tuple[int, int, int]] = []
        # add start to heap
        heapq.heappush(minheap, (0, 0, src))

        while len(minheap) > 0:
            # get cheapest flight
            # print(minheap)
            cost, num_layovers, node = heapq.heappop(minheap)

            # base case
            if node == dst:
                # we're done!
                # best_cost = cost if cost < best_cost else best_cost
                return cost
                # continue
            if num_layovers > k:
                # we need to undo this
                continue

            neighbours = graph.get(node, [])
            for newcost, neighbour in neighbours:
                # add to heap
                newcost += cost
                new_num_layovers = num_layovers if neighbour == dst else num_layovers+1
                if new_num_layovers > k:
                    continue

                heapq.heappush(minheap, (newcost, new_num_layovers, neighbour))

        return -1
```


[[Dijkstra's Algorithm]]
```python
class Solution:
    def findCheapestPrice(self, n: int, flights: List[List[int]], src: int, dst: int, k: int) -> int:
        # turn to graph
        # use Prim's MST from src to dst keeping track of our k value
        # backtrack if hit k

        graph: dict[int, set[tuple[int, int]]] = {
            i: set() for i in range(n)
        }
        # populate graph
        for flight_src, flight_dst, flight_cost in flights:
            graph[flight_src].add((flight_cost, flight_dst))

        ########################################
        # DIJKSTRA's
        # start at start node
        # have a seperate "best_cost" node
        best_cost: list[list[int]] = [[float("inf") for _ in range(k+1)] for _ in range(n)]

        seen: set[tuple[int, int]] = set()
        minheap: list[tuple[int, int, int]] = []
        # add start to heap
        heapq.heappush(minheap, (0, 0, src))

        while len(minheap) > 0:
            # get cheapest flight
            # print(minheap)
            cost, num_layovers, node = heapq.heappop(minheap)
            # print(cost, num_layovers, node)

            # base case
            if node == dst:
                # we're done!
                # best_cost = cost if cost < best_cost else best_cost
                return cost
                # continue
            if num_layovers > k:
                # we need to undo this
                continue
            if cost > best_cost[node][num_layovers]:
                # print(f"     {best_cost[node][num_layovers]}")
                continue

            neighbours = graph.get(node, [])
            for edgeweight, neighbour in neighbours:
                # add to heap
                new_num_layovers = num_layovers if neighbour == dst else num_layovers+1
                if new_num_layovers > k:
                    continue

                newcost = cost + edgeweight
                if best_cost[neighbour][new_num_layovers] > newcost:
                    best_cost[neighbour][new_num_layovers] = newcost
                    heapq.heappush(minheap, (newcost, new_num_layovers, neighbour))

        return -1
```

----
# Source:
https://leetcode.com/problems/cheapest-flights-within-k-stops/