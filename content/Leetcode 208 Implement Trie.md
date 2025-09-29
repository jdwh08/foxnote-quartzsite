---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/trie
edited: 2025-09-24T17:05
created: 2025-07-21T19:39
---
# Problem:
A [[Trie]] (pronounced as "try") or **prefix tree** is a tree data structure used to efficiently store and retrieve keys in a dataset of strings. There are various applications of this data structure, such as autocomplete and spellchecker.

Implement the Trie class:

- `Trie()` Initializes the trie object.
- `void insert(String word)` Inserts the string `word` into the trie.
- `boolean search(String word)` Returns `true` if the string `word` is in the trie (i.e., was inserted before), and `false` otherwise.
- `boolean startsWith(String prefix)` Returns `true` if there is a previously inserted string `word` that has the prefix `prefix`, and `false` otherwise.

#### Bounds


#### Examples
Given a trie...
1. Insert "apple"
2. 

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1


---
# Solution:

```python
from typing import Self

class PTNode:
    char: str
    children: dict[str, Self]
    terminal: bool

    def __init__(self, char: str) -> None:
        if len(char) > 1:
            msg = "Must instantiate PT with char not str"
            raise ValueError(msg)
        
        self.char = char
        self.children = {}
        self.terminal = False
    
    def add(self, char: str) -> Self | None:
        if len(char) > 1:
            msg = f"Must instantiate PT with char not str: {char}"
            raise ValueError(msg)

        if char in self.children:
            return self.children[char]
        
        newnode = PTNode(char)
        self.children[char] = newnode
        return newnode

    def get(self, char: str) -> Self | None:
        if len(char) > 1:
            msg = "Must instantiate PT with char not str"
            raise ValueError(msg)

        if char in self.children:
            return self.children[char]

        return None


class Trie:
    dummyhead: PTNode

    def __init__(self):
        self.dummyhead = PTNode(char="")

    def insert(self, word: str) -> None:
        cur = self.dummyhead
        for char in word:
            cur = cur.add(char)

        cur.terminal = True

    def search(self, word: str) -> bool:
        cur = self.dummyhead
        for char in word:
            cur = cur.get(char)
            if cur is None:
                return False

        return cur.terminal

    def startsWith(self, prefix: str) -> bool:
        cur = self.dummyhead
        for char in prefix:
            cur = cur.get(char)
            if cur is None:
                return False
        return True
        
```

----
# Source:
Source