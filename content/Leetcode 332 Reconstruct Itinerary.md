---
aliases: 
tags:
  - cs/leetcode/hard
  - cs/dsa/graph
  - cs/dsa/backtrack
  - cs/dsa/dfs
edited: 2025-08-15T15:50
created: 2025-07-23T18:42:00
---
# Problem:
You are given a list of flight tickets `tickets` where `tickets[i] = [from_i, to_i]` represent the source airport and the destination airport.

Each `from_i` and `to_i` consists of three uppercase English letters.

Reconstruct the itinerary in order and return it.

All of the tickets belong to someone who originally departed from `"JFK"`. Your objective is to reconstruct the flight path that this person took, assuming each ticket was used exactly once.

If there are multiple valid flight paths, return the lexicographically smallest one.

- For example, the itinerary `["JFK", "SEA"]` has a smaller lexical order than `["JFK", "SFO"]`.

You may assume all the tickets form at least one valid flight path.

#### Bounds
- `1 <= tickets.length <= 300`
- `from_i != to_i`

#### Examples
```
Input: tickets = [["HOU","JFK"],["SEA","JFK"],["JFK","SEA"],["JFK","HOU"]]

Output: ["JFK","HOU","JFK","SEA","JFK"]
```

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
Our input is a graph, so we can definitely use graph traversal mechanisms here. We are essentially trying to make a Euler Cycle through all edges in the graph.

Our options are [[Depth First Search|DFS]] or BFS. BFS would have difficulty preserving the ordering because it would simultaneously go to all possible neighbour options for the current node, making the output difficult to handle. DFS might work better but I'm not sure how we handle determining which path to go down and not going down the "wrong path".

Other graph options don't make sense -- Dijkstra's and shortest path is pointless, Kahn's TopoSort is closer but can't work due to cycles. 

##### Attempt 2
DFS is the correct strategy, just needs to be combined with [[Backtracking]] as a fast and dirty way to do this. We continue down one path in DFS until we hit the end (no more paths). Our end condition checks if we have gone through all nodes -- if not, then we definitely missed some things and must backtrack.

##### Attempt 3
We can actually improve on backtracking with Hierholzer's Algorithm. Traverse and pop all output directions from a node using BFS, THEN add the current node to the output array. Finally, you reverse it because the first node to add to the output is the last (we go backwards). Surprisingly this works even with internal loops and stuff because when we revisit the node we take the "other direction" and keep doing that until we clear. There MUST be a route back because there can only be one way to terminate the itinerary.

---
# Solution:

```python
class Solution:
    def findItinerary(self, tickets: List[List[str]]) -> List[str]:
        graph: dict[str, list[str]] = {
            departure: [] for departure, _ in tickets
        }
        for departure, arrival in tickets:
            graph[departure].append(arrival)

        for departure in graph:
            graph[departure].sort()

        output: list[str] = ["JFK"]

        def dfs_path(departure: str) -> bool:
            # base case
            if len(output) == len(tickets)+1:
                # we've gone to all airports
                return True

            if departure not in graph:
                return False

            neighbours = graph.get(departure, [])
            for idx, neighbour in enumerate(neighbours):
                # backtracking
                graph[departure].pop(idx)
                output.append(neighbour)
                if dfs_path(neighbour):
                    # we've done it!
                    return True
                
                # backtrack
                graph[departure].insert(idx, neighbour)
                output.pop()

            return False

        dfs_path("JFK")
        return output
```

The above solution actually TLE's. An optimal solution uses [[Hierholzer's Algorithm]]:
```python
class Solution:

    def findItinerary(self, tickets: List[List[str]]) -> List[str]:
        graph = defaultdict(list)

        # Sort tickets in reverse order, since we will later pop destinations from the end of the list
        # which is more efficient than pop(0), and we need the smallest lexical order for equal paths.
        for departure, arrival in sorted(tickets, reverse=True):
            graph[departure].append(arrival)

        # Initialize a list to keep track of the itinerary
        itinerary = []

        # Recursive Depth First Search function
        def dfs(airport):
            # While there are destinations to visit from current airport
            while graph[airport]:
                # Visit the destination by doing DFS on the last airport in the list
                # (since it's reversed sorted, smallest lexical goes last)
                dfs(graph[airport].pop())

            # Append the airport to itinerary after visiting all destinations
            itinerary.append(airport)

        # Begin DFS from 'JFK' which is the starting airport
        dfs("JFK")

        # The itinerary is in reverse order due to the nature of DFS, so reverse it before returning
        return itinerary[::-1]
```

```python
class Solution:
    def findItinerary(self, tickets: List[List[str]]) -> List[str]:
        adj = defaultdict(list)
        for src, dst in sorted(tickets)[::-1]:
            adj[src].append(dst)

        stack = ["JFK"]
        res = []

        while stack:
            curr = stack[-1]
            if not adj[curr]:
                res.append(stack.pop())
            else:
                stack.append(adj[curr].pop())

        return res[::-1]
```

----
# Source:
https://neetcode.io/problems/reconstruct-flight-path?list=neetcode150