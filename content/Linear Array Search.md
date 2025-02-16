---
aliases: 
tags:
  - cs/dsa/array
  - cs/dsa/search
edited: 2025-02-15T16:29
created: 2025-01-05T21:03
---
### Definition:

Finds the index of value $v$ by looking through each index in an array one at a time.

| ..  | ... | ... | ... | ... | ... |
| --- | --- | --- | --- | --- | --- |
| 0   |     |     |     |     | N   |
$\uparrow$ 

```python
def linear_search(haystack: list[int], needle: int) -> bool:
	for i in range(0, len(haystack)):
		if haystack[i] == needle:
			return True  # primagen doesn't like returning in a loop

	return False
```

---
### Notes:

##### [[Big O]]:
- Worst case is $O(n)$, because the way it fails is looking through every index and not finding the value $v$. 

---
### Examples:
Examples