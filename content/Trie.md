---
aliases:
  - Prefix Tree
  - Digital Tree
tags:
  - cs/dsa/trie
edited: 2025-09-30T19:34
created: 2024-03-19T22:06
---
# Definition:
A type of [[Tree]] based [[Data Structures and Algorithms|Data Structures]] which focuses on efficiently storing prefixes.

![[Trie.png]]

---
# Notes:

Don't forget we need to mark *completions* somehow! We can do this by either....
1. Adding an additional "completed" node
2. Adding a completed field. I think this is a lot cleaner.

### Implementation
See [[Leetcode 208 Implement Trie]]

---
# Examples:
- Autocomplete of words
- Caching structures by path
	- E.g., (Videos, ID, Title) cache
	- Check if we have videos, then the ID, then the title for ID, then return val

----
# Source:
The Last Algorithms Class