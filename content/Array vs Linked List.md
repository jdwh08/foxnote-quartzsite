---
aliases: 
tags:
  - cs/dsa/array
  - cs/dsa/linked_list
edited: 2025-02-17T20:18
created: 2024-03-19T22:06
---
# Comparison Table:

| **Property** | [[Array]]                                                                                        | **[[Linked List]]**                                                                                        |
| ------------ | ------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------- |
| Usability    | Easy accessing with indices.<br><br>However, we can't "**insert**" without copying and shifting. | Hard accessing because we must traverse linearly from head/tail.<br><br>Insertion is natural and easy.<br> |
| Time         | O(1) of everything amortized                                                                     | Worse performance regarding links.                                                                         |
| Space        | Memory must be allocated upfront.                                                                | Dynamic allocation, more optimized.                                                                        |
| Use Case     | Random Access                                                                                    | Push/Pop from tail                                                                                         |

---
# Examples

**Async Request Queue**:
- Suppose a workload can only have 5 concurrent operations running at any given time.
- To handle a backlog, we need others to wait for the current values to finish.
- *We only care about removing from the front and adding to the back.*
- Therefore, a [[Queue]] makes the most sense.
- If we used an array, we would have to shift the values all the time.

----
# Source:
Source