---
aliases:
  - Prefix Tree
  - Digital Tree
tags:
  - cs/dsa/trie
edited: 2025-08-01T18:29
created: 2024-03-19T22:06
---
# Definition:
A type of [[Tree]] based [[Data Structures and Algorithms|Data Structures]] which focuses on prefixes.

![[Trie.excalidraw.png.png]]

---
# Notes:
Notes

```python
def insert(str):
	curr = head
	for c in str:
		if curr[c]:  # check if letter exists
			cur = curr[c]
		else:
			# make a new node
			node = charNode()
			curr[c] = node
			curr = node
	curr.isWord = True


def delete(str):
	# recursion is a little easier.
	# base

	# pre
	# recur
	# post
```

---
# Examples:
- Autocomplete
- Caching structures by path
	- E.g., (Videos, ID, Title) cache
	- Check if we have videos, then the ID, then the title for ID, then return val

----
# Source:
Source