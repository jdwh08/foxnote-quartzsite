---
aliases: 
tags:
  - cs/dsa/linked_list
edited: 2025-02-15T20:07
created: 2024-03-19T22:06
---
# Definition:
![[LinkedList]]

A storage type based around nodes which hold attributes and links to other nodes.
Getting data requires traversing through the links.

---
# Notes:

**Variants**
- Single linked list: only has a next attribute
- Double linked list: has previous and next

Recall the issues with [[Array]]:
1. Deleting is hard (clean)
2. Inserting is hard (overwrite)
3. Growing is hard (must reallocate)

LinkedLists are easier for this:
1. Insertion of F in A $\rightarrow$ B can be very fast.
	1. Change $A \rightarrow F$, $A \leftarrow F$
	2. Change $F \rightarrow B$, $F \leftarrow B$
	3. These are using .next and .prev. Not based on $n$. Constant operation. These are **O(1)** constant time!
2. Deletion of C in $B\rightarrow C \rightarrow D$
	1. Note the order of operations is very important. We can't prematurely lose access to a node!
	2. Change $B \rightarrow D$ `B = C.prev; B.next = C.next`
	3. Change $B \leftarrow D$ `D = C.next; D.prev = C.prev`
	4. Delete C. `C.prev = C.next = Null`
	5. These are using .next and .perv. Not based on $n$. Constant operation. These are $O(1)$ constant time!

Linked Lists are BAD for traversal:
	We have access to HEAD and TAIL if doubly. These are easy. Everything else must be accessed by going through all the links.
```python
val_5 = arr[4] # vs
val_5 = HEAD.next.next.next.next.val
```
- This means that the traversal to get to the middle can be costly.
- Also, the memory not being contiguous makes it slower. Stored on the [[Heap (Computer Memory)]].

Time/Space Finale: [[Big O]]
- Pre-append / Append: O(1) (from head/tail)
- Insertion in middle: O(N) (go through the links)
- Deletion from ends: O(1) (from head/tail)
- Deletion in middle: O(N) (go through the links)
- Get Head/Tail: O(1) (go from head/tail)
- Get in general: O(N) (go through the links)

**IN OTHER WORDS, IF YOU'RE TRAVERSING WITH A LINKEDLIST, YOU'RE PROBABLY NOT USING THE RIGHT DATA STRUCTURE!**

Other notes:
- Linked Lists are technically a [[Tree]]

---
# Examples:
Examples

----
# Source:
The Last DS Course You'll Need