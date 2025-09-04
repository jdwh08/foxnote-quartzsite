---
aliases:
  - LRU Cache
tags: 
edited: 2025-08-17T10:14
created: 2024-03-19T22:06
---
# Definition:
A [[Cache]] method that stores values to quickly get values; manages values by removing value(s) which have not been used recently.

---
# Notes:

### Data Structure
- Store values as a doubly [[Linked List]]. Each time the user interacts with a value, move the value to the "most recently used" side (e.g., the head).
	- Doubly Linked List is useful to update.
- We also need some way to obtain values based on their key, i.e., a [[Hashmap]].
	- Our value needs to be a node in a linked list so we can jump there directly!

### [[Big O]]
- HashMap runtime is constant $O(1)$.
- Insertion to head of linked list is 7 $O(1)$ operations here.
- Removal of linked list is $O(1)$ because we have a tail.

### Implementation
```TypeScript
type Node<T> {
	value: T,
	next?: Node<T>,
	prev?: Node<T>,
}

function createNode<V>(value: V): Node<V> {
	return {value};
}

export default class LRU<K, V> {
	private length: number;
	private capacity: number;
	private head?: Node<V>;
	private tail?: Node<V>;

	private kv_hashmap: Map<K, Node<V>>;
	private vk_hashmap: Map<Node<V>, K>;  // ALT: key is in node.

	constructor(private capacity: number = 16) {
		this.length = 0;
		this.capacity = capacity;
		this.head = this.tail = undefined;
		this.kv_hashmap = new Map<K, Node<V>>();
		this.vk_hashmap = new Map<Node<V>, K>();
	}

	private remove(node: Node<V>): void {
		// Skip Node
		if (node.prev) {
			node.prev.next = node.next;
		}
		if (node.next) {
			node.next.prev = node.prev;
		}

		// Zero Length Check
		this.length--;
		if (this.length === 0) {
			this.tail = this.head = undefined;
		}
		// Head Check
		if (this.head === node) {
			this.head = this.head.next;
		}
		// Tail Check
		if (this.tail === node) {
			this.tail = this.tail.prev;
		}

		node.next = undefined;
		node.prev = undefined;
	}
	private prepend(node: Node<V>): void {
		this.length++;
		if (!this.head) {
			this.head = this.tail = node;
			return;
		}
		// Add to front
		node.next = this.head;
		node.next.prev = node;
		this.head = node;
	}
	private trim_cache(): void {
		if (this.length <= this.capacity) {
			return;
		}

		// Remove from tail
		const lrunode = this.tail as Node<V>;
		this.remove(tail as Node<V>);  // type hinting

		// Remove from lookups
		const key = this.vk_hashmap.get(lrunode) as K;
		this.kv_hashmap.delete(key);
		this.vk_hashmap.delete(lrunode);
	}

	get(key: K): V | undefined {
		// check cache if exist skip if no
		const node = this.lookup.get(key);
		if (!node) {
			return undefined;
		}
		// update value and move to front
		this.remove(node);
		this.prepend(node);
		// return value
		return node.value;
	}

	update(key: K, value: V): void {
		// check for existence (get)
		// if no exist then insert
			// check capcacity, evict if overcap
		// update to front of list and update value
		const node = this.lookup.get(key);
		if (node) {
			node.value = V;
			this.remove(node);
			this.prepend(node);
			return;
		}

		node = createNode(value);
		this.prepend(node);
		this.kv_hashmap.set(key, node);
		this.vk_hashmap.set(node, key);
	}
}
```

```python
from typing import Self

class Node:
    key: int
    val: int
    prev: None | Self
    next: None | Self

    def __init__(self, key: int, val: int) -> None:
        self.key=key
        self.val=val
        self.prev=None
        self.next=None

class LRUCache:
    def __init__(self, capacity: int):
        self.capacity = capacity
        self.cache = {}

        self.left = Node(0, 0)
        self.right = Node(0, 0)
        self.left.next = self.right
        self.right.prev = self.left

    def remove(self, node):
        prev = node.prev
        nxt = node.next
        prev.next = nxt
        nxt.prev = prev

    def append(self, node):
        prev = self.right.prev
        nxt = self.right
        prev.next = node
        node.prev = prev
        nxt.prev = node
        node.next = nxt

    def get(self, key: int) -> int:
        if key in self.cache:
            self.remove(self.cache[key])
            self.append(self.cache[key])
            output = self.cache[key].val
            return output
        return -1

    def put(self, key: int, value: int) -> None:
        if key in self.cache:
            self.remove(self.cache[key])
        self.cache[key] = Node(key, value)
        self.append(self.cache[key])

        if len(self.cache) > self.capacity:
            lru = self.left.next
            self.remove(lru)
            del self.cache[lru.key]
```

---
# Examples:
- [[Leetcode 146 LRU Cache]] for a Leetcode-style Implementation Problem
	- Primagen says "this isn't the greatest question to ask in an interview since there's so much stuff, but I've asked it before so I feel some of that..."

----
# Source:
The Last Algorithms Course