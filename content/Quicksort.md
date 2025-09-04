---
aliases:
tags:
  - cs/dsa/sort
edited: 2025-08-27T15:35
created: 2024-03-19T22:06
---
# Definition:
A [[Sorting Algorithm]] which takes advantage of [[Divide and Conquer]] to sort a list.

---
# Notes:

![[Quicksort.excalidraw.png.png]]

1. Get a pivot value $p$.
2. Any element which is less than the pivot is moved to the left front.
	1. This divides the array into (values less than $p$)-($p$)-(values greater than $p$)
3. Pick new pivots for the values in the left and right of the first pivot.
	1. This now divides values into ($<p_1$)-$p_1$-($p_1 \le x\le p_0$)-($p_0$)-...

| [   | $\le$ | $p_0$ | $\le$ | ]    |
| --- | ----- | ----- | ----- | ---- |
| LOW | $p_1$ |       | $p_2$ | HIGH |

| 8        | 7             | 6   | 4        | 5 (pivot)     |
| -------- | ------------- | --- | -------- | ------------- |
| 4 (swap) | 7             | 6   | 8 (swap) | 5             |
| 4        | 5 (pivotswap) | 6   | 8        | 7 (pivotswap) |

- Runtime: [[Big O]] of $O(n \log n)$, memory of $O(1)$ per partition pass since we do it in place, but due to [[Recursion]] [[The Stack (memory)|stack]] it is $O(\log n)$ extra memory.

```typescript
// Pick pivot. Move all smol values to before the pivot.
function partition(arr: number[], lo: number, hi: number); number {
	const pivot = arr[hi]; // hi is pivot

	let idx = lo-1; // tracks start of low section
	// scan through low-to-pivot for smol values
	for (let i = lo; i < hi; ++i) {
		if (arr[i] <= pivot) {
			idx++;
			const tmp = arr[i];
			arr[i] = arr[idx];
			arr[idx] = tmp;  // swap so smol value goes to lo
		}
	}

	// swap so pivot goes to pivotspot
	idx++;
	arr[hi] = arr[idx];
	arr[idx] = pivot;

	return idx;
}

// Do the recusive quicksort
function qs(arr: number[], lo: number, hi: number); void {
	// base case
	if (lo >= hi) {
		return;
	}

	const pivot_idx = partition(arr, lo, hi);
	// sort the left half
	qs(arr, lo, pivot_idx-1);  // don't include the pivot!
	// sort the right half
	qs(arr, pivot_idx+1, hi); 
}

// The runner
export default function quick_sort(arr: number[]); void {
	qs(arr, 0, arr.length - 1);  // both low and HIGH(!) are inclusive
}
```

---
# Examples:
Examples

----
# Source:
The Last Algorithms Course