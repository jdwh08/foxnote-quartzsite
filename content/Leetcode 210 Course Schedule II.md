---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/bfs
  - cs/dsa/graph/dag/toposort
edited: 2025-08-13T21:31
created: 2025-07-23T18:42:00
---
# Problem:
There are a total of `numCourses` courses you have to take, labeled from `0` to `numCourses - 1`. You are given an array `prerequisites` where `prerequisites[i] = [ai, bi]` indicates that you **must** take course `bi` first if you want to take course `ai`.

- For example, the pair `[0, 1]`, indicates that to take course `0` you have to first take course `1`.

Return _the ordering of courses you should take to finish all courses_. If there are many valid answers, return **any** of them. If it is impossible to finish all courses, return **an empty array**.

#### Bounds
- `1 <= numCourses <= 2000`
- `0 <= prerequisites.length <= numCourses * (numCourses - 1)`
- `prerequisites[i].length == 2`
- `0 <= ai, bi < numCourses`
- `ai != bi`
- All the pairs `[ai, bi]` are **distinct**.

#### Examples
```
**Input:** numCourses = 2, prerequisites = [[1,0]]
**Output:** [0,1]
**Explanation:** There are a total of 2 courses to take. To take course 1 you should have finished course 0. So the correct course order is [0,1].
```

```
**Input:** numCourses = 4, prerequisites = [[1,0],[2,0],[3,1],[3,2]]
**Output:** [0,2,1,3]
**Explanation:** There are a total of 4 courses to take. To take course 3 you should have finished both courses 1 and 2. Both courses 1 and 2 should be taken after you finished course 0.
So one correct course order is [0,1,2,3]. Another correct ordering is [0,2,1,3].
```

---
# Notes:
This is essentially a [[Topological Sort]].

---
# Attempts:

##### Attempt 1
This is similar to the [[Depth First Search|DFS]] solution to [[Leetcode 207 Course Schedule]]. However, because we need to store the output list, we have to remove the courses one at a time instead of setting the full pre-requisites for each course to be a blank list.
- We use a Set instead to keep track of values
- We pop values off the set for pre-requisites
- We return False in the DFS function if course is unable to be fulfilled.

---
# Solution:

```python
class Solution:

    def findOrder(self, numCourses: int, prerequisites: List[List[int]]) -> List[int]:

        # convert preqs ordering into graph
        graph: dict[int, set[int]] = {
            i: set()
            for i in range(0, numCourses)
        }

        for course, preq in prerequisites:
            graph[course].add(preq)

        # return any valid ordering of courses?
        # we should do DFS and then reverse?
        output: list[int] = []
        outputset: set = set()

        def dfs(course: int, path: set) -> bool:
            """Gets the preq path for course. Returns False if cycle."""
            # print(course, graph[course], path, output)
            # base case:
            if course in path:
                return False  # we've hit a cycle

            path.add(course)
            if course in outputset:
                return True

            # get the preqs
            while len(graph[course]) > 0:
                preq = graph[course].pop()
                can_fulfill = dfs(preq, path)
                if not can_fulfill:
                    return False

                # we've handled the preq
                # backtrack and remove from path
                path.remove(preq)

            # cleared all preqs, add to output
            output.append(course)
            outputset.add(course)
            return True

        # dfs through each course
        for course in range(numCourses):
            path = set()
            can_fulfill = dfs(course, path)
            if not can_fulfill:
                return []

        return output
```

```python
class Solution:

    def findOrder(self, numCourses: int, prerequisites: List[List[int]]) -> List[int]:
        # convert to graph
        graph: dict[int, set[int]] = {
            i: set()
            for i in range(numCourses)
        }

        # with kahn's algorithm
        in_degrees = [0] * numCourses
        for course, preq in prerequisites:
            in_degrees[course] +=1
            graph[preq].add(course)

        q = deque()
        for idx, indeg in enumerate(in_degrees):
            if indeg == 0:
                q.append(idx)

        ordering: list[int] = []
        while len(q) > 0:
            node = q.popleft()
            ordering.append(node)

            neighbours = graph[node]

            for neighbour in neighbours:
                in_degrees[neighbour] -= 1
                if in_degrees[neighbour] == 0:
                    q.append(neighbour)

        if len(ordering) < numCourses:
            return []
        return ordering[::-1]
```

----
# Source:
https://leetcode.com/problems/course-schedule-ii/description/