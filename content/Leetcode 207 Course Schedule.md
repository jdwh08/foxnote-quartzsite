---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/graph/dag/toposort
  - cs/dsa/bfs
  - todo
edited: 2025-08-13T21:31
created: 2025-07-23T18:42:00
---
# Problem:
You are given an array `prerequisites` where `prerequisites[i] = [a, b]` indicates that you **must** take course `b` first if you want to take course `a`.

The pair `[0, 1]`, indicates that must take course `1` before taking course `0`.

There are a total of `numCourses` courses you are required to take, labeled from `0` to `numCourses - 1`.

Return `true` if it is possible to finish all courses, otherwise return `false`.

#### Bounds
- `1 <= numCourses <= 1000`
- `0 <= prerequisites.length <= 1000`
- All `prerequisite` pairs are **unique**.

#### Examples
```
Input: numCourses = 2, prerequisites = [[0,1]]

Output: true
Take 1 -> 0
```

```
Input: numCourses = 2, prerequisites = [[0,1],[1,0]]

Output: false
Taking 1 requires taking 0 requires taking 1. Not possible.
```

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
Draw out an example graph of classes with pre-requisites. This is essentially the same thing as traversing the graph using DFS (to ensure we can reach pre-requisites).
- Our only fail condition is if the classes have a Graph Cycle, because then it's impossible
- We store our path using a set.
- Our base case in DFS is if we've seen it before (FAIL) or if the course has no preqs.

We use [[Depth First Search|DFS]] for this with a cycle marker.

##### Attempt 2
This is actually much more efficient using [[Topological Sort]] with Kahn's Algorithm.

---
# Solution:

```python
class Solution:  # DFS-Cycle Solution

    def canFinish(self, numCourses: int, prerequisites: List[List[int]]) -> bool:
        # prereqs[i]=[a,b] means directed from b -> a
        # must take all numCourses courses from 0:n-1
        # return true/false is possible

        prereqs: dict[int, list[int]] = {i: [] for i in range(numCourses)}
        for course, preq in prerequisites:
            prereqs[course].append(preq)
        seen = set()

        def dfs(course: int):
            if course in seen:
                # we have cycle
                return False
            if len(prereqs[course]) <= 0:
                return True
            seen.add(course)

            for preq in prereqs[course]:
                if not dfs(preq):
                    return False
                # prereqs[course].remove(preq)

            seen.remove(course)
            prereqs[course] = []
            return True

        for course in range(numCourses):
            if not dfs(course):
                return False

        return True
```

----
# Source:
https://leetcode.com/problems/course-schedule/description/