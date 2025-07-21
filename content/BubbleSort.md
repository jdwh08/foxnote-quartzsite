---
aliases: 
tags:
  - cs/dsa/sort
edited: 2025-07-12T22:00
created: 2025-01-05T22:13
---
### Definition:

Quite literally the most intuitive, simplest [[Sorting Algorithm]].

For each index $i$, consider the next index $i+1$. If $arr[i] < arr[i+1]$, swap the two.
A single pass through BubbleSort ensures that the largest item is at the end. 
- "Bubbles" largest items to the top.

Thus, each subsequent pass can skip the final item(s) which make up the sorted portion of the array.

```psuedocode
FOR i 0...n
FOR j < n-1-i (final compare is n-1 vs n-1+1)

# WHY n-1-i?
# n-1 because we don't want j=n -> compare n to n+1 uh oh!
# -i because every time we bubble up one item into the sorted portion

IF arr[i] > arr[j]:
	swap
```

```python
def bubble_sort(arr: list[int]) -> None:
	for i in range(0, len(arr)):
		for j in range(0, len(arr)-1-i):
			if arr[j] > arr[j+1]:
				# Swap
				tmp = arr[j]
				arr[j] = arr[j+1]
				arr[j+1] = tmp
```

---
### Notes:

###### Big O
We have to look at $n, n-1, n-2, ..., 1$ which is $O(n^2)$.

---
### Examples:

| 1   | 3   | 7   | 4   | 2   |
| --- | --- | --- | --- | --- |

Pass 1:

| 1   | 3   | **7** | 4     | 2     |
| --- | --- | ----- | ----- | ----- |
| 1   | 3   | 4     | **7** | 2     |
| 1   | 3   | 4     | 2     | **7** |
