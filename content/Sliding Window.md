---
aliases: 
tags:
  - cs/dsa/array
  - cs/dsa/array
  - cs/dsa/linked_list
  - cs/string
edited: 2025-08-13T21:35
created: 2024-03-19T22:06
---
# Definition:
An [[Data Structures and Algorithms|Algorithm]] to iterate through an portion of a [[Array]], [[ArrayList]], or [[Linked List]].
- We dynamically adjust a range or subarray using our [[Two Pointer]].

---
# Notes:
One pointer marks the start, one pointer marks the end.
- We need to have some clear window or contiguous subarray etc.
- We need to have some way to **move new values into the window**
- We need to have some way to **move values out of the window**

We often combine with [[Hashmap]] to keep track of things quickly.

---
# Examples:
- [[Leetcode 19 Remove Nth Node from End of List]]

----
# Source:
Source