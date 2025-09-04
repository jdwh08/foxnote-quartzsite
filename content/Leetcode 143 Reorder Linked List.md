---
aliases: 
tags:
  - cs/dsa/linked_list
  - cs/leetcode/medium
edited: 2025-07-30T17:32
created: 2024-03-19T22:06
---
# Problem:
You are given the head of a singly [[Linked List]].

The positions of a linked list of `length = 7` for example, can initially be represented as:
`[0, 1, 2, 3, 4, 5, 6]`

Reorder the nodes of the linked list to be in the following order:
`[0, 6, 1, 5, 2, 4, 3]`

#### Examples
Input: head = [2,4,6,8]
Output: [2,8,4,6]

Input: head = [2,4,6,8,10]
Output: [2,10,4,8,6]


---
# Notes:

Had to look at two hints. Hint 2 was most useful in saying that this consists of three operations:
1. Halve the list. [[Fast and Slow Pointers]]
2. Reverse the second half. [[Two Pointer]]
3. Splice the two halves back together with interleaving.  [[Two Pointer]] again.


---
# Attempts:

##### Attempt 1
I couldn't figure out how to do this. I was trying some sort of weird array thing, and then I saw memory had to be [[Big O|O(1)]].

I then looked at my first hint which told me nothing.
I then looked at the second hint to do Halve-Reverse-Splice, which dang man that's impressive.

#### Attempt 2

This took a considerable amount of whiteboarding.
- I figured out how to do fast and slow pointers from memory
- I figured out how to do reversal
- I figured out how to do splicing

I messed up the "break connection between halves" step by doing another .next since my positioning was off.

Time taken: 50 minutes :(

---
# Solution:

```python
class Solution:

    def reorderList(self, head: Optional[ListNode]) -> None:
        # Halve using Fast and Slow Pointers
        slow = fast = head

        while (fast is not None and fast.next is not None):
            fast = fast.next.next
            slow = slow.next

        # break connection between halves
        sn = slow.next
        slow_prev = slow.next = None
        slow = sn

        # Reverse using Reversal
        while (slow is not None):
            new = slow.next
            slow.next = slow_prev
            slow_prev = slow
            slow = new

        # slow_prev now stores the start of the reversed

        # Splice using Interleaving
        left = head
        right = slow_prev

        while (right is not None):
            left_new = left.next
            right_new = right.next

            left.next = right
            right.next = left_new

            left = left_new
            right = right_new
```

----
# Source:
https://neetcode.io/problems/reorder-linked-list?list=neetcode150