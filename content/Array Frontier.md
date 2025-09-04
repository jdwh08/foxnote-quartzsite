---
aliases: 
tags:
  - cs/dsa/array
  - cs/dsa/array
edited: 2025-08-13T21:35
created: 2024-03-19T22:06
---
# Definition:
A common [[Data Structures and Algorithms|algorithm]] pattern which helps process [[Array]]s and [[ArrayList]] by dividing it into a "processed" and "unprocessed" section.
- We keep track of index position in processed and unprocessed
- When a condition is met, we swap values into the processed section and move indices accordingly.

---
# Notes:
We have some pointer which controls the "processed" section. 

We operate on the "unprocessed" section of the array (e.g., with a second pointer in a [[Two Pointer]] setup), and gradually add to the "processed side" via swapping.

---
# Examples:
- [[Quicksort]]: We iterate through the portion of the array and structure it based on whether the value is less than the pivot.
- [[Quickselect]]: We do the same thing with quicksort but for finding a specific value.
- [[Leetcode 26 Remove Duplicates from Sorted Array]]

----
# Source:
Source