---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/cache/lru
  - todo
edited: 2025-08-17T10:12
created: 2025-07-23T18:42:00
---
# Problem:
Design a data structure that follows the constraints of a [[Least Recently Used Cache]].

Implement the `LRUCache` class:
- `LRUCache(int capacity)` Initialize the LRU cache with **positive** size `capacity`.
- `int get(int key)` Return the value of the `key` if the key exists, otherwise return `-1`.
- `void put(int key, int value)` Update the value of the `key` if the `key` exists. Otherwise, add the `key-value` pair to the cache. If the number of keys exceeds the `capacity` from this operation, **evict** the least recently used key.

The functions `get` and `put` must each run in `O(1)` average time complexity.

#### Bounds
- `1 <= capacity <= 3000`
- `0 <= key <= 104`
- `0 <= value <= 105`
- At most `2 * 10^5` calls will be made to `get` and `put`.
#### Examples
**Input**
`["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
`[[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
**Output**
`[null, null, null, 1, null, -1, null, -1, 3, 4]

**Explanation**
`LRUCache lRUCache = new LRUCache(2);
`lRUCache.put(1, 1); // cache is {1=1}
`lRUCache.put(2, 2); // cache is {1=1, 2=2}
`lRUCache.get(1);    // return 1
`lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
`lRUCache.get(2);    // returns -1 (not found)
`lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
`lRUCache.get(1);    // return -1 (not found)
`lRUCache.get(3);    // return 3
`lRUCache.get(4);    // return 4

---
# Notes:

Why the heck is this a Linked List problem and not a hashmap problem?
... OH! The LRU bit.

Okay so the fact that we have key-value with O(1) tells me that we want a hashmap.
But the fact that we need to get rid of the least recently used suggests that I need some structure to determine which value(s) were recently used.
- This sounds like a [[Queue]] structure (FIFO) 
- We can combine a queue of keys with a hashmap?
- I don't see any memory bounds so this is probably fine.

---
# Attempts:

##### Attempt 1
It took a lot of trial to use a [[Hashmap]] deque setup.
It then was extremely slow thanks to the deque removes.

```python
from typing import Self

class Node:
    key: int
    val: int
    prev: Self | None
    next: Self | None

    def __init__(
        self,
        key: int,
        val: int,
        prev: Self | None = None,
        next: Self | None = None,
    ) -> Self:
        self.key = key
        self.val = val
        self.prev = prev
        self.next = next

class LRUCache:
    def __init__(self, capacity: int):
        self.capacity = capacity
        # sentinel nodes
        self.head = Node(-float("inf"), -float("inf"))
        self.tail = Node(float("inf"), float("inf"))

        self.head.next = self.tail
        self.tail.prev = self.head

        self.nodes: dict[int, Node] = {}

    def _update_node(self, node: Node) -> None:
        # remove node from chain
        node.prev.next = node.next
        node.next.prev = node.prev

        # update tail-node relationship
        self.tail.prev.next = node
        node.prev = self.tail.prev
        node.next = self.tail
        self.tail.prev = node

    def _pop_node(self) -> None:
        # remove node after head
        node = self.head.next
        if node == self.tail:
            return

        self.head.next = node.next
        node.next.prev = self.head
        del self.nodes[node.key]

    def get(self, key: int) -> int:
        # return the value
        output_node = self.nodes.get(key, None)
        if output_node is None:
            return -1

        output = output_node.val
        self._update_node(output_node)
        return output

    def put(self, key: int, value: int) -> None:
        if key in self.nodes:
            self.nodes[key].val = value
            self._update_node(self.nodes[key])
            return

        node = Node(key, value, None, None)
        node.prev = self.tail.prev
        node.prev.next = node
        self.tail.prev = node
        node.next = self.tail

        self.nodes[key] = node
        if len(self.nodes) <= self.capacity:
            return

        # we gotta evict
        # find the least recently used node (the head)
        self._pop_node()
```

##### Attempt 2:
So we really need our own LinkedList to get this to work efficiently.
All that .remove stuff is taking too long.

---
# Solution:

```python
from typing import Self

class Node:
    key: int
    val: int
    prev: None | Self
    next: None | Self

    def __init__(self, key: int, val: int) -> None:
        self.key=key
        self.val=val
        self.prev=None
        self.next=None

class LRUCache:
    def __init__(self, capacity: int):
        self.capacity = capacity
        self.cache = {}

        self.left = Node(0, 0)
        self.right = Node(0, 0)
        self.left.next = self.right
        self.right.prev = self.left

    def remove(self, node):
        prev = node.prev
        nxt = node.next
        prev.next = nxt
        nxt.prev = prev

    def append(self, node):
        prev = self.right.prev
        nxt = self.right
        prev.next = node
        node.prev = prev
        nxt.prev = node
        node.next = nxt

    def get(self, key: int) -> int:
        if key in self.cache:
            self.remove(self.cache[key])
            self.append(self.cache[key])
            output = self.cache[key].val
            return output
        return -1

    def put(self, key: int, value: int) -> None:
        if key in self.cache:
            self.remove(self.cache[key])
        self.cache[key] = Node(key, value)
        self.append(self.cache[key])

        if len(self.cache) > self.capacity:
            lru = self.left.next
            self.remove(lru)
            del self.cache[lru.key]
```

----
# Source:
https://leetcode.com/problems/lru-cache/description/
