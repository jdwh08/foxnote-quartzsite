---
aliases: 
tags:
  - cs/dsa/hashmap
edited: 2025-08-17T09:36
created: 2024-03-19T22:06
---
# Definition:
A [[Data Structures and Algorithms|Data Structure]] which uses a [[Hash Function]] to consistently use a relationship between values and lookup key.

---
# Notes:

### Terminology
- Load Factor: number of data points vs total amount of storage.
	- Current ideal load factor is 0.7
- Key: Hashable value used to look up data. Must be consistent.
- Value: Value associated with key.
- Collision: When there is multiple keys that go to the same.
- [[Hash Function]]: A consistent method to convert our values into a unique number for storage.

### Methodology

##### Insertion
1. Use the [[Hash Function]] to convert our value into a very large unique value.
2. Obtain the key by taking the hash value modulo hash size.
3. Store the value in a backing [[Array]] with the value as index.
	1. If we have a collision, i.e., two values going to the same key index, we store them in a backing array (or LinkedList) specific for the index. 
	2. Values in this backing list are tuples of (key, value); we search through this.

##### Retrieval
1. Convert hash into key index using modulo.
2. Obtain the value(s) at that key index.
	1. If there are multiple, scan through the value(s) in the key index until original key is found.

##### Resizing
If we start storing too many values (i.e., high load factor), then we need some way to resize the hashmap. This is similar to us resizing [[Array]] in an [[ArrayList]].

1. Iterate through all the key(s) that we have.
2. Change the modulo to some larger value (e.g., double the hashmap size)
3. Update hashmap accordingly.

### [[Big O]]
- Insertion and Retrieval: $O(1)$ typical because we find the unique value and get its values. If there are collisions, there are generally few enough that we only need to go through a few. 
	- We need to have a good [[Hash Function]] however... otherwise it becomes same as $O(n)$.

---
# Examples:
Examples

----
# Source:
The Last Algorithms Class