---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/linked_list
edited: 2025-07-30T17:33
created: 2025-07-23T18:42:00
---
# Problem:
You are given two **non-empty** [[Linked List]] representing two non-negative integers. The digits are stored in **reverse order**, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

#### Bounds
- The number of nodes in each linked list is in the range `[1, 100]`.
- `0 <= Node.val <= 9`
- It is guaranteed that the list represents a number that does not have leading zeros.

#### Examples
**Input:** `l1 = [2,4,3], l2 = [5,6,4]`
**Output:** `[7,0,8]`
**Explanation:** 342 + 465 = 807.

**Input:** `l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]`
**Output:** `[8,9,9,9,0,0,0,1]`
**Explanation:** 9999+9999999 = 10009998

---
# Notes:

Very obviously a [[Linked List]] manipulation problem.

Good news is that we are having HEAD at the one's place.
That means we can do basic maths to get the final value.
- Add digits one by one, keeping track of overflow to add to next place
- Create nodes with digit values at the end.

We have basic [[Quotient and Remainder]] stuff with mod and integer divide.

---
# Attempts:

##### Attempt 1
You basically add digits together and then save the overflow as a mod.

ISSUES:
1. You need a [[Dummy Node]] to make this problem easier to handle.
2. Don't forget to convert the overflow into a final node just in case!
	1. Er, actually, it's better to handle that implicitly with better boundary conditions: loop if LEFT or RIGHT or overflow.
	2. This avoids repeated code and is apparently faster (???)

---
# Solution:

```python
class Solution:

    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:

        left = l1
        right = l2
        overflow = 0

        output = cur = ListNode(0, None)  # dummy node
        prev = None

        while left or right or overflow > 0:
            leftval = left.val if left else 0
            rightval = right.val  if right else 0
            newsum = leftval + rightval + overflow

            newval = newsum % 10
            overflow = newsum // 10

            prev = cur
            cur = ListNode(newval, None)
            prev.next = cur

            left = left.next if left is not None else None
            right = right.next if right is not None else None

        return output.next
```

----
# Source:
https://leetcode.com/problems/add-two-numbers/