---
aliases: 
tags:
  - cs/leetcode/hard
  - cs/dsa/graph/path/dijkstra
edited: 2025-08-14T18:57
created: 2025-07-23T18:42:00
---
# Problem:
You are given two words, `beginWord` and `endWord`, and also a list of words `wordList`. All of the given words are of the same length, consisting of lowercase English letters, and are all distinct.

Your goal is to transform `beginWord` into `endWord` by following the rules:

- You may transform `beginWord` to any word within `wordList`, provided that at exactly one position the words have a different character, and the rest of the positions have the same characters.
- You may repeat the previous step with the new word that you obtain, and you may do this as many times as needed.

Return the **minimum number of words within the transformation sequence** needed to obtain the `endWord`, or `0` if no such sequence exists.

#### Bounds
- `1 <= beginWord.length <= 10`
- `1 <= wordList.length <= 100`

#### Examples
```
Input: beginWord = "cat", endWord = "sag", wordList = ["bat","bag","sag","dag","dot"]

Output: 4
`"cat" -> "bat" -> "bag" -> "sag"`
```

---
# Notes:
- When doing stuff with letters in strings, it's probably faster to iterate through the possible letters in `string.ascii_lowercase` because that's O(26) and not $O(n)$.
- You can use [[Dijkstra's Algorithm]] for shortest path with positive weights, but if there are no weights you are fine with [[Breadth First Search|BFS]].
	- Apparently Dijkstra's is rather uncommon in Leetcode.

---
# Attempts:

##### Attempt 1
We can think about the strings as states, and transitions between the states as one-letter-different words in the word bank. To diagram this out, we can use a [[Graph]].

This is basically the same as finding the shortest path between two points in a graph. A way to do that is with [[Dijkstra's Algorithm]]. We'll implement this as a graph-building followed by Dijkstra.

---
# Solution:

```python
class Solution:
    def ladderLength(self, beginWord: str, endWord: str, wordList: List[str]) -> int:
        # graph with dijkstra's
        # each node is a word in wordlist
        # each node has edge to other word if 1char difference

        # add beginning word to wordlist
        wordList.append(beginWord)

        # make adjlist
        graph: dict[str, set[str]] = {
            word: set()
            for word in wordList
        }
        # o(n^2 * c) brute for now :(
        # length 100^2 * 10 is probably fine...
        wordlen = len(wordList[0])

        for i in range(0, len(wordList)):
            for j in range(i+1, len(wordList)):
                num_diffs = 0
                for idx in range(wordlen):
                    if wordList[i][idx] != wordList[j][idx]:
                        num_diffs += 1
                        if num_diffs >= 2:
                            break

                # we passed, only one difference
                # add to graph
                if num_diffs == 1:
                    graph[wordList[i]].add(wordList[j])
                    graph[wordList[j]].add(wordList[i])
        
        # now that we have the graph we need to make dijkstra's
        seen: set[str] = set()
        minheap = [(1, beginWord)]
        best_dists: dict[str, int | float] = defaultdict(lambda: float("inf"))

        # dijkstra's
        while len(minheap) > 0:
            dist_to_word, word = heapq.heappop(minheap)

            # base case no cycles
            if word in seen:
                continue
            
            seen.add(word)

            if word == endWord:
                continue

            neighbours: set[str] = graph.get(word, set())
            for neighbour in neighbours:
                dist_to_neighbour = dist_to_word + 1
                
                if dist_to_neighbour < best_dists[neighbour]:
                    best_dists[neighbour] = dist_to_neighbour
                
                heapq.heappush(minheap, (dist_to_neighbour, neighbour))

        # return
        best_dist = best_dists.get(endWord, float("inf"))
        if best_dist < float("inf"):
            return best_dist
        return 0
```

A Note: It's so much more efficient to not bother with graph stuff and instead do a two-way BFS directly:

```python
class Solution:
    def ladderLength(self, beginWord: str, endWord: str, wordList: List[str]) -> int:
        wordSet = set(wordList)
        if endWord not in wordSet:
            return 0
        
        begin_set = {beginWord}
        end_set = {endWord}
        visited = set()
        steps = 1
        
        while begin_set and end_set:
            if len(begin_set) > len(end_set):
                begin_set, end_set = end_set, begin_set
            
            next_set = set()
            
            for word in begin_set:
                for i in range(len(word)):
                    for c in string.ascii_lowercase:
                        if c == word[i]:
                            continue
                        
                        new_word = word[:i] + c + word[i+1:]
                        
                        if new_word in end_set:
                            return steps + 1
                        
                        if new_word in wordSet and new_word not in visited:
                            visited.add(new_word)
                            next_set.add(new_word)
            
            begin_set = next_set
            steps += 1
        
        return 0
```

----
# Source:
https://leetcode.com/problems/word-ladder/