---
aliases: 
tags:
  - cs/dsa/medium
  - cs/dsa/linked_list
edited: 2025-07-24T18:47
created: 2025-07-23T18:42:00
---
# Problem:
A [[Linked List]] of length `n` is given such that each node contains an additional random pointer, which could point to any node in the list, or `null`.

Construct a [**deep copy**](https://en.wikipedia.org/wiki/Object_copying#Deep_copy) of the list. The deep copy should consist of exactly `n` **brand new** nodes, where each new node has its value set to the value of its corresponding original node. Both the `next` and `random` pointer of the new nodes should point to new nodes in the copied list such that the pointers in the original list and copied list represent the same list state. **None of the pointers in the new list should point to nodes in the original list**.

For example, if there are two nodes `X` and `Y` in the original list, where `X.random --> Y`, then for the corresponding two nodes `x` and `y` in the copied list, `x.random --> y`.

Return _the head of the copied linked list_.

The linked list is represented in the input/output as a list of `n` nodes. Each node is represented as a pair of `[val, random_index]` where:

- `val`: an integer representing `Node.val`
- `random_index`: the index of the node (range from `0` to `n-1`) that the `random` pointer points to, or `null` if it does not point to any node.

Your code will **only** be given the `head` of the original linked list.

#### Bounds
- `0 <= n <= 1000`
- `-104 <= Node.val <= 104`
- `Node.random` is `null` or is pointing to some node in the linked list.

#### Examples
```java
Input: head = [[3,null],[7,3],[4,0],[5,1]]
Output: [[3,null],[7,3],[4,0],[5,1]]
```

---
# Notes:
I need a solution which is [[Big O]] of $O(n)$ probably even though the bounds are super small.

Really dumb brute force solution is to convert the linked list into an Array, and then manually create all the nodes handling the pointers.


---
# Attempts:

##### Attempt 1
Wanted to use a list of values, but then realized that it's not doable.

Answer involves using a [[Hashmap]], which I'm quite annoyed at because I didn't think we can assume that Node is hashable; it doesn't implement a [[Hash Function]].

---
# Solution:

```python
class Solution:

    def copyRandomList(self, head: 'Optional[Node]') -> 'Optional[Node]':
        old_to_new_hashmap = defaultdict(lambda: Node(0, None, None))
        old_to_new_hashmap[None] = None

        cur = head

        while cur is not None:
            old_to_new_hashmap[cur].val = cur.val
            old_to_new_hashmap[cur].next = old_to_new_hashmap[cur.next]
            old_to_new_hashmap[cur].random = old_to_new_hashmap[cur.random]
            cur = cur.next

        return old_to_new_hashmap[head]
```

----
# Source:
Source