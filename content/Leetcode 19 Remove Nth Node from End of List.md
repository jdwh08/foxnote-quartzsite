---
aliases: 
tags:
  - cs/dsa/linked_list
  - cs/leetcode/medium
edited: 2025-07-30T17:32
created: 2024-03-19T22:06
---
# Problem:

You are given the beginning of a [[Linked List]] `head`, and an integer `n`. Remove the `nth` node from the end of the list and return the beginning of the list.
#### Examples
```java
Input: head = [1,2,3,4], n = 2
Output: [1,2,4]

Input: head = [5], n = 1
Output: []

Input: head = [1,2], n = 2
Output: [2]
```

---
# Notes:
Yet another linked list problem.

We can... store everything in an array and then flip it, but that's not O(1) memory.
We can reverse and then traverse and then reverse again but that sucks.

Okay I can get the length and midpoint using Fast and Slow pointers.
- Once we know the length, 
- Well okay no this is like a two pass situation.

I DID NOT THINK ENOUGH

---
# Attempts:

##### Attempt 1
I started writing up a two pass solution
Then I realized that actually we can have [[Two Pointer]] and keep track of the "gap" between them being $n$, allowing the earlier pointer to be the value we want to remove. We have a third pointer be the previous value, and then all is good.

ISSUE: I tried making the previous value head. This ran into a sh\*tload of issues when trying to remove the last node.

#### Attempt 2
I had to look at the official solution code.
It turns out, what we should do is create a "Dummy Node" which points to the head, and essentially acts as a $-1$ index, and then return `dummy.next`

---
# Solution:

```python
class Solution:

    def removeNthFromEnd(self, head: Optional[ListNode], n: int) -> Optional[ListNode]:

        # create a gap of n
        right = head

        for i in range(0, n):
            right = right.next

        left = head
        dummy = ListNode(0, head)
        prev = dummy

        while (right is not None):
            right = right.next
            prev = left
            left = left.next

        # do the dance do the dance
        prev.next = left.next

        return dummy.next
```

New techniques:

**DUMMY NODE FOR LINKED LIST**
**POINTER GAP LIKE [[Sliding Window]]**

----
# Source:
https://neetcode.io/problems/remove-node-from-end-of-linked-list?list=neetcode150
