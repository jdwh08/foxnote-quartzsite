---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/linked_list
edited: 2025-09-24T17:05
created: 2025-07-21T19:39
---
# Problem:
Given the `head` of a singly linked list and two integers `left` and `right` where `left <= right`, reverse the nodes of the list from position `left` to position `right`, and return _the reversed list_.

#### Bounds
- The number of nodes in the list is `n`.
- `1 <= n <= 500`
- `-500 <= Node.val <= 500`
- `1 <= left <= right <= n`

#### Examples
```
**Input:** head = [1,2,3,4,5], left = 2, right = 4
**Output:** [1,4,3,2,5]
```

---
# Notes:
Some common [[Linked List]] operations.
1. Reverse
2. Split and Append

---
# Attempts:

##### Attempt 1
Okay so we need to reverse the LinkedList around some subsection of values. Note they are 1-indexed for some reason.

We start by adding a dummy node for the head because it's a linked list; you always add dummy nodes.

We iterate until we find the last value before the subsection (the "pre-sub").
Next, we go through the subsection, flipping the linked list order. Keep track of the left and right of the subsection.
We continue until we reach the end of the subsection. Keep track of the node after the subsection (the "post-sub").
Finally, perform the last swaps. Pre-sub -> right -> ... -> left -> post-sub.

---
# Solution:

```python
class Solution:
    def reverseBetween(self, head: Optional[ListNode], left: int, right: int) -> Optional[ListNode]:
        if left == right:
            return head

        idx = 0
        dummyhead = ListNode(0, head)
        cur = dummyhead

        # find node right before subsection
        while idx +1 < left:
            cur = cur.next
            idx += 1

        # handle subsection left side
        presub = cur
        subleft = cur.next
        cur = subleft.next
        subleft.next = None  # temporary
        prev = subleft
        idx += 2

        # loop subsection, reversing
        while idx < right:
            next = cur.next
            cur.next = prev
            prev = cur
            cur = next
            idx += 1

        # handle subsection right side
        subright = cur
        postsub = cur.next if cur is not None else None
        subright.next = prev
        presub.next = subright
        subleft.next = postsub

        return dummyhead.next
```

----
# Source:
Source