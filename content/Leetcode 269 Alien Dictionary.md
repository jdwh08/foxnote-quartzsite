---
aliases: 
tags:
  - cs/leetcode/hard
  - cs/dsa/graph/dag/toposort
edited: 2025-08-16T15:48
created: 2025-07-23T18:42:00
---
# Problem:
There is a foreign language which uses the latin alphabet, but the order among letters is _not_ "a", "b", "c" ... "z" as in English.

You receive a list of _non-empty_ strings `words` from the dictionary, where the words are **sorted lexicographically** based on the rules of this new language.

Derive the order of letters in this language. If the order is invalid, return an empty string. If there are multiple valid order of letters, return **any** of them.

A string `a` is lexicographically smaller than a string `b` if either of the following is true:

- The first letter where they differ is smaller in `a` than in `b`.
- `a` is a prefix of `b` _and_ `a.length < b.length`.

#### Bounds
- The input `words` will contain characters only from lowercase `'a'` to `'z'`.
- `1 <= words.length <= 100`
- `1 <= words[i].length <= 100`

#### Examples
```
Input: ["hrn","hrf","er","enn","rfnn"]
Output: "hernf"

- from "hrn" and "hrf", we know 'n' < 'f'
- from "hrf" and "er", we know 'h' < 'e'
- from "er" and "enn", we know get 'r' < 'n'
- from "enn" and "rfnn" we know 'e'<'r'
- so one possibile solution is "hernf"
```

```
Input: ["wrtkj","wrt"]
Output: ""  // not a valid input
```

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
This problem is definitely a [[Graph]] with nodes and edges. The edges are when we have one letter before another letter in the ordering.

Treating this as a graph, our goal is to find the ordering from lowest to highest, which is basically just a [[Topological Sort]]. Thus, we convert the letters into a graph and then use [[Topological Sort|Kahn's Algorithm]] to do this problem.

##### Attempt 2
Some issues are that the input might not be a valid lexicographical sort (!?) so we need to check this.
We also need to remember to increment the increment only when a new text is done.

##### Attempt 3
Mr Neetcode himself prefers a DFS solution instead of Kahn's algorithm. 

---
# Solution:

```python
class Solution:
    def foreignDictionary(self, words: List[str]) -> str:
        # letters are different
        # e.g., a -> x

        # words where they are sorted lexicographically?
            # a < b if...
                # a[i] < b[i]
                # a == b[len(a)] and len(b) > len(a)

        # we build a directed graph
        # toposort on the graph
        # how do we know the start for the toposort?
        # we find the node(s) which has zero in-degree
            # kahn's algorithm
        
        # is it possible to have a cycle? no? a<b -x-> b<a
        # seems legit

        # make graph
        graph: dict[str, set[str]] = {c: set() for w in words for c in w}
        in_degrees: dict[str, int] = {c: 0 for c in graph}

        for idx in range(1, len(words)):
            charidx = 0
            w1, w2 = words[idx-1], words[idx]
            l1, l2 = len(w1), len(w2)
            minlen = min(l1, l2)

            if l1 > l2 and w1[:minlen] == w2[:minlen]:
                # what the heck why is this a possible input
                # this is NOT a valid lexicographical sort...
                return ""

            for charidx in range(minlen):
                if (w1[charidx] != w2[charidx]):
                    if (w2[charidx] not in graph[w1[charidx]]):
                        # print(idx, w1[charidx], w2[charidx])
                        graph[w1[charidx]].add(w2[charidx])
                        in_degrees[w2[charidx]] += 1
                    break  # only want first diff since that determines

        # kahn's algorithm
        output: list[str] = []
        q = deque([char for char in in_degrees if in_degrees[char] == 0])

        # 1. get a node whose indegree is zero
        # 2. add it to output
        # 3. for each one of node's neighbours, remove it from graph and reduce in_degrees by 1
        # 4. continue until output is same as length of inputs
        while len(q) > 0:
            char = q.popleft()
            # print(char, graph, in_degrees) 
            output.append(char)
            nextchars = graph.get(char, [])
            for nextchar in nextchars:
                # print(f"     {nextchar} {in_degrees[nextchar]}")
                in_degrees[nextchar] -= 1
                if in_degrees[nextchar] == 0:
                    q.append(nextchar)

        if len(output) != len(graph):
            return ""

        return "".join(output)
```

```python

```

----
# Source:
Source