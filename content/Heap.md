---
aliases:
  - Priority Queue
  - Max Heap
  - Min Heap
tags:
  - cs/dsa/heap
edited: 2025-08-15T21:55
created: 2024-03-19T22:06
---
# Definition:
- A type of [[Data Structures and Algorithms|Data Structure]] based around [[Binary Tree]].
	- Every child node is smaller (maxHeap) or larger (minHeap) than the current node
	- You need to rebuild the tree each time you change
	- Traversal doesn't matter much.

![[Heap.excalidraw.png.png]]

---
# Notes:

### Properties
1. Self balancing. We only ever remove or add from the length.
2. Used for priority and scheduling.

Despite being a [[Tree]] on paper, our backing data structure is actually a [[ArrayList]], and we get parent/child relationships using 2i+1 / 2i+2 rules.

```TypeScript
export default class MinHeap {
	public length: number;  // used for insert and delete
	private data: number[];

	constructor() {
		this.length = 0;
		this.data = [];
	}

	private parent(idx: number): number {
		return Math.floor((idx-1)/2);
	}
	private leftChild(idx: number): number {
		return idx * 2 + 1;
	}
	private rightChild(idx: number): number {
		return idx * 2 + 2;
	}

	private heapifyUp(idx: number): void {
		if (idx === 0) {
			return;
		}

		const parent = this.parent(idx);
		const parentVal = this.data[parent];
		const val = this.data[idx];

		if parentVal > val:
			// fails min heap condition
			// swap
			this.data[idx] = parentVal;
			this.data[parent] = val;
			// recur
			this.heapifyUp(parent)
	}

	private heapifyDown(idx: number): void {
		// base case
		if (idx >= this.length) {
			return;
		}

		const left_idx = this.leftChild(idx);
		const right_idx = this.rightChild(idx);
		if (left_idx >= this.length) {
			// left is beyond array
			// we don't need to check right because right > left
			return;
		}

		const left_val = this.data[left_idx];
		const right_val = this.data[right_idx];
		if (left_val > right_val && val > right_val) {
			// left > val > right
			// needs to have parent smaller for min heap
			this.data[idx] = right_val;
			this.data[right_idx] = val;
			this.heapifyDown(right_idx);
		} else if (right_val > left_val && val > left_val) {
			// right > val > left
			// needs to have parent smaller for min heap
			this.data[idx] = left_val;
			this.data[left_idx] = val;
			this.heapifyDown(left_idx);
		}
	}

	insert(value: number): void {
		// put value at end of array
		// heapify up if needed
		this.data[this.length] = value;
		this.heapifyUp(this.length);
		this.length ++;
	}

	delete(): number {
		// base case
		if (this.length === 0) {
			return bleh;  // pick sentinel value or none
		}

		// get value at root
		const output = this.data[0]
		this.length--;  // remove len so heapify works w/ proper len

		if (this.length === 0) {
			this.data = [];  // slightly tricky
			return output;
		}

		this.data[0] = this.data[this.length];  // pick from bottom
		this.heapifyDown(0);
		return output;
	}
}
```

### Properties
[[Big O]] for Insert and Heap:
- Worst case is going through the entire tree height.
- Tree height is at worst $h=\log_2(n)$ because it's self-balancing full tree.

Average Case is $O(1)$ for everything except popping the top value.

We are "soft deleting" here, i.e., not actually removing the values.
- We may want to explicitly set them to undefined.

---
# Examples:
- `heapq`  in Python

----
# Source:
The Last Algorithms Course