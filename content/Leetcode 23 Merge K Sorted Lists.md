---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/heap
  - cs/dsa/linked_list
edited: 2025-08-15T17:32
created: 2025-07-23T18:42:00
---
# Problem:
You are given an array of `k` [[Linked List]]s `lists`. Each linked-list is sorted in ascending order.

_Merge all the linked-lists into one sorted linked-list and return it._

#### Bounds
- `k == lists.length`
- `0 <= k <= 104`
- `0 <= lists[i].length <= 500`
- `-104 <= lists[i][j] <= 104`
- `lists[i]` is sorted in **ascending order**.
- The sum of `lists[i].length` will not exceed `10^4`.

#### Examples
```
**Input:** lists = [[1,4,5],[1,3,4],[2,6]]
**Output:** [1,1,2,3,4,4,5,6]
**Explanation:** The linked-lists are:
[
  1->4->5,
  1->3->4,
  2->6
]
merging them into one sorted linked list:
1->1->2->3->4->4->5->6
```

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
Okay so we need some way to keep track of the current position for the linked list. We can make a dict but the lists already has some memory space so we can use that instead for tracking purposes.

For each iteration, we need to find the smallest value node, and then add that to our merged linked list. We can loop over the values....

No, actually wait since this is Min-K, this is the perfect opportunity to use a [[Heap|Min Heap]], which reduces our [[Big O]] from $O(n)$ to $O(\log n)$ for each pass.

We get the smallest value from the heap, then add the corresponding node to the linked list, then advance the linked list.

##### Attempt 2
Okay so even though the first value in the tuple for the heap is hashable (the value), the node class by itself is not hashable and therefore we can't add it directly to the heap.
Instead, we'll hash based on the **index**.

---
# Solution:

```python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def mergeKLists(self, lists: List[Optional[ListNode]]) -> Optional[ListNode]:
        head = ListNode(0, None)  # dummy node
        cur = head

        minheap: list[tuple[int, int]] = [
            (node.val, idx) 
            for idx, node in enumerate(lists) 
            if node is not None
        ]
        # heapify
        heapq.heapify(minheap)

        while len(minheap) > 0:
            # get the smallest value
            _, nodeidx = heapq.heappop(minheap)
            # convert nodeidx to node
            node = lists[nodeidx]
            # add the node to the linked list
            cur.next = node
            cur = node
            # update the lists
            lists[nodeidx] = node.next
            # add the next node into the minheap if it exists
            if node.next is not None:
                heapq.heappush(minheap, (node.next.val, nodeidx))

        return head.next

```

----
# Source:
https://leetcode.com/problems/merge-k-sorted-lists/description/