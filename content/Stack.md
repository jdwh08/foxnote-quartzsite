---
aliases:
tags:
  - cs/dsa/stack
edited: 2025-09-30T19:34
created: 2024-03-19T22:06
---
# Definition:
A data structure which has a "last in, last out" property.
![[Stack.png]]

The opposite of a [[Queue]].
Note that we only add and remove from the HEAD now!

---
# Notes:
- Especially useful for [[Recursion]], where we think about a "stack trace" of function calling.

**By constraining the LinkedList**, we get really good performance in terms of [[Big O]].
- PUSH: Add to head is O(1)!
- POP: Pop from head is O(1)!
- PEAK: `head.val` is O(1)!

```typescript
type Node<T> = {
	value: T,
	prev?: Node<T>, // Primagen thinks it's easier to build the stack with arrows going backwards.
	// Thus, we use prev? instead of next? like in [[Queue]].
}

export default class Stack<T> {
	public length: number;
	public head?: Node<T>;

	constructor() {
		this.head = undefined;
		this.length = 0;
	}

	push(item: T): void {
		const node = {value: item} as Node<T>;

		this.length++;
		if (!this.head) {
			this.head = node;
			return;
		}

		node.prev = this.head;
		this.head = node;
	}

	pop(): T | undefined {
		this.length = Math.max(0, this.length - 1);

		if (this.length === 0) {
			const head = this.head;  // can't cast if node is undefined
			this.head = undefined;
			return head?.value;
		}
		const head = this.head as Node<T>;
		this.head = head.prev;
		// free head var memory here. 
		return head.value;
	}

	peek(): T | undefined {
		return this.head?.value;  // return head or undefined.
	}
}
```

NOTE: in Python, we would use deque.

---
# Examples:

In Computer Systems:
- Useful for [[The Stack (memory)]].
- [[Stack Trace]] of prior function calls.

In [[Leetcode]]:
- 

----
# Source:
Source