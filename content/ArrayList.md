---
aliases:
  - Dynamic Array
  - list
tags:
  - cs/dsa/array
edited: 2025-09-30T19:34
created: 2024-03-19T22:06
---
# Definition:
We combine the properties of indexing from [[Array]] and the ability to add/remove values from [[Linked List]].

![[ArrayList.png]]

We have an [[Array]] as the backing data structure, and save the current `length` and backing array's `capacity` as variables.

---
# Notes:
#### Operations:
- `get`: uses the array index and checks against `length`
- `push`: adds to array index and increments `length`
	- [[Big O]] is $O(1)$ because we are adding and moving pointers, which are constant.
- `pop`: get the value at the array index, decrement the `length`
	- $O(1)$
	- Do we need to zero out the values? Technically no, because we are using pointer length to keep track.
	- We'd probably want to e.g., Java set to null for garbage.
- `enqueue` / `dequeue`: very bad because we have to move over every value due to handling.
	- $O(n)$
- You'll notice that ArrayList is acting quite similar to a [[Stack]]...

#### Exceeding Capacity
- Suppose we are trying to `push` beyond our capacity.
- We have to allocate a new [[Array]], copy over the values, and change the capacity.
	- Our new array must be larger, e.g., $2\times$ the size.
	- Determining the optimal allocated capacity vs avoiding additional growing operations is for optimization.
- For `enqueue`, this is quite annoying because when we add to array index 0, we have to *also move all the values over*. Hence $O(n)$.
- For `dequeue`, this can be quite annoying because when we remove from array index 0, we also have to *move all the values back*. Hence $O(n)$
	- Thus, [[Queue]] are generally more efficient with [[Linked List]] than ArrayList.
	- We treat ArrayList like a [[Stack]].

#### Should you use this over an Array or LinkedList?
- **It depends**! (It always \*\*\*\* depends).
- Array is more convenient sometimes with bracket indexing.
- ArrayList is more convenient if we want middle access.

---
# Examples:
```typescript
// todo
```
#todo 


**Performance Object Pooling**
- Suppose I have some service which creates a user object every time a new request comes in.
- Volume is high: 1000's of requests.
- Instead of creating the tonnes of objects, why not use one object, change the values of it, and send it into a larger pool?
- We'd want some way to store and access all the objects easily, e.g., via index.
- We'd also want some convenience in resizing.


**JavaScript's bracket const a= \[\]**
- We see that `get`, `push`, `pop` are nearly constant $O(1)$ as $n$ grows.
- However, `queue` and `dequeue` (err.... JavaScript is crazy and calls them `shift/unshift`) do grow in time. $O(n)$
- Thus, it's an ArrayList behind the scenes!
- Slicing is uhh just copying a portion of the array. A deep copy.

----
# Source:
Source