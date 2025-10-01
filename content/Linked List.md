---
aliases:
tags:
  - cs/dsa/linked_list
edited: 2025-09-30T21:59
created: 2024-03-19T22:06
---
# Definition:

![[LinkedList.svg]]

A storage type based around nodes which hold attributes and links to other nodes.
Getting data requires traversing through the links.

---
# Notes:

### Variants
- Single linked list: only has a next attribute
- Double linked list: has previous and next

### Comparison to ArrayList
Recall the issues with [[Array]]:
1. Deleting is hard (clean)
2. Inserting is hard (overwrite)
3. Growing is hard (must reallocate)

LinkedLists are easier for this:
1. Insertion of F in A $\rightarrow$ B can be very fast.
	1. Change $A \rightarrow F$, $A \leftarrow F$
	2. Change $F \rightarrow B$, $F \leftarrow B$
	3. These are using .next and .prev. Not based on $n$. Constant operation. These are **O(1)** constant time!
2. Deletion of C in $B\rightarrow C \rightarrow D$
	1. Note the order of operations is very important. We can't prematurely lose access to a node!
	2. Change $B \rightarrow D$ `B = C.prev; B.next = C.next`
	3. Change $B \leftarrow D$ `D = C.next; D.prev = C.prev`
	4. Delete C. `C.prev = C.next = Null`
	5. These are using .next and .perv. Not based on $n$. Constant operation. These are $O(1)$ constant time!

### Properties
Linked Lists are BAD for traversal:
	We have access to HEAD and TAIL if doubly. These are easy. Everything else must be accessed by going through all the links.
```python
val_5 = arr[4] # vs
val_5 = HEAD.next.next.next.next.val
```
- This means that the traversal to get to the middle can be costly.
- Also, the memory not being contiguous makes it slower. Stored on the [[Heap (Computer Memory)]].

Time/Space Finale: [[Big O]]
- Pre-append / Append: O(1) (from head/tail)
- Insertion in middle: O(N) (go through the links)
- Deletion from ends: O(1) (from head/tail)
- Deletion in middle: O(N) (go through the links)
- Get Head/Tail: O(1) (go from head/tail)
- Get in general: O(N) (go through the links)

**IN OTHER WORDS, IF YOU'RE TRAVERSING WITH A LINKEDLIST, YOU'RE PROBABLY NOT USING THE RIGHT DATA STRUCTURE!**

Other notes:
- Linked Lists are technically a [[Tree]] or "acyclic graph".

### Prebuilt in Python
- Use a `deque()` for a doubly linked list.

---
# Examples:
```typescript
type Node<T> = {
	value: T,
	prev?: Node<T>,
	next?: Node<T>,
}

export default class DoublyLinkedList<T> {
	public length: number;
	private head?: Node<T>;
	private tail?: Node<T>;

	constructor() {
		this.length = 0;
		this.head = undefined;  // style, not needed
		this.tail = undefined;
	}

	private debug() {
		let curr = this.head;
		let output = "";
		for (let i = 0; curr & i < this.length; ++i) {
			output += `${i} => ${curr.value} `;
			curr = curr.next;
		}
	}

	prepend(item: T): void {
		const node = {value: item} as Node<T>;
		this.length++;

		// empty
		if (!this.head) {
			this.head = this.tail = node;
			return;
		}

		// pre-append to head
		// attach new node first!
		node.next = this.head;
		this.head.prev = node;
		this.head = node;
	}
	append(item: T): void {
		const node = {value: item} as Node<T>;
		this.length++;

		// empty
		if (!this.tail) {
			this.head = this.tail = node;
			return;
		}

		node.prev = this.tail;
		this.tail.next = node;
		this.tail = node;
	}
	insertAt(item: T, idx: number): void {
		// special cases
		if (idx > this.length) {
			throw new Error("DLL shorter than index.")
		} else if (idx == this.length) {
			this.append(item);
			return;
		} else if (idx == 0) {
			this.prepend(item);
			return;
		}

		this.length++;
		const node = {value: item} as Node<T>;
		const curr = this.getAt(idx) as Node<T>;

		// swap
		// attach new node
		node.next = curr;
		node.prev = curr.prev;
		// fix old links
		if (node.prev) {
			node.prev.next = node;
		}
	}

	get(idx: number): T | undefined {
		return this.getAt(idx)?.value;
	}
	private getAt(idx: number): Node<T> | undefined {
		// gets the NODE instead of the value like get
		// useful for searching like stuff.
		let curr = this.head;
		// traverse
		for (let i = 0; curr && i < idx; ++i) {
			curr = curr.next
		}
		return curr;
	}

	remove(item: T): T | undefined {
		// Find the item, then remove it.
		// Perf is terrible unless a shadow hashmap?

		let curr = this.head;
		for (let i = 0; curr && curr.value && i < this.length; ++i) {
			if (curr.value === item) {
				break;
			}
		}
		if (!curr) {
			// it never existed!
			return undefined;
		}
		return this.removeNode(curr);
	}
	removeAt(idx: number): T | undefined {
		const node = this.getAt(idx);

		if (!node) {
			// It never exists!
			return undefined;
		}
		return this.removeNode(curr);
	}
	private removeNode(node: Node<T>): T | undefined {
		this.length--;
		if (this.length === 0) {
			const out = this.head?.value;
			this.head = this.tail = undefined;
			return out;
		}
		if (node.prev) {
			// jump over curr
			node.prev.next = node.next;
		}
		if (node.next) {
			// jump over curr
			node.next.prev = node.prev;
		}
		if (node === this.head) {
			this.head = node.next;
		}
		if (node === this.tail) {
			this.tail = node.prev;
		}
		node.prev = node.next = undefined;
		return node.value?;
	}
}
```

----
# Source:
The Last DS Course You'll Need