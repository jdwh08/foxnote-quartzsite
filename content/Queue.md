---
aliases: 
tags:
  - cs/dsa/queue
edited: 2025-02-17T19:42
created: 2024-03-19T22:06
---
# Definition:
A specific type of [[Linked List]], with the property "LAST IN, FIRST OUT".

![[Queue.svg]]

The opposite of a [[Stack]].

---
# Notes:
A very common data structure.

**By constraining the LinkedList**, we get really good performance in terms of [[Big O]].
- ENQUEUE: Add to tail is O(1)!
- DEQUEUE: Pop from head is O(1)!
- PEAK: `head.val` is O(1)!

---
# Examples:

```typescript
type Node<T> = {
	value: T,
	next?: Node<T>  // node or null
}

export default class Queue<T> {
	public length: number;
	private head?: Node<T>;
	private tail?: Node<T>;

	constructor() {
		this.head = this.tail = undefined
		this.length = 0
	}

	enqueue(item: T): void {
		this.length++;
		const node = {value: item} as Node<T>;  // create new node!

		if(!this.tail) {  // typescript confirm None
			this.tail = this.head = node;
			return;
		}

		// Update tail instead
		this.tail.next = node;
		this.tail = node;
	}

	dequeue(): T | undefined {
		if (!this.head) {
			return undefined;
		}
		this.length--;
		// Update Head
		const head = this.head;
		// Move to Next
		this.head = this.head.next;

		// Handle case where length becomes zero
		if (this.length === 0) {
			this.tail = undefined;
		}

		// free memory
		head.next = undefined;
		return head.value;
	}

	peek(): T | undefined {
		return this.head?.value;  // val or null
	}
}
```

----
# Source:
Source