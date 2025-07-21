---
aliases:
  - Floyd's Cycle Detection Algorithm
tags:
  - cs/dsa/linked_list
  - cs/leetcode
  - todo
edited: 2025-07-20T22:20
created: 2024-03-19T22:06
---
# Definition:
A [[Data Structures and Algorithms|algorithm]] to...
1. Check for [[Cycles]] in a [[Linked List]].
2. Get the "middle value" in a [[Linked List]].

We have two pointers: 
1. **Fast** moves two steps each iteration
2. **Slow** moves one step each iteration

---
# Notes:

```typescript
slow = head;
fast = head;

while (fast !== null && fast.next !== null) {
	slow = slow.next;
	fast = fast.next.next;
}
```

---
# Examples:
Examples

----
# Source:
Source