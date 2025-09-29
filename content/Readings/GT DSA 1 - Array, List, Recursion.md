---
created: 2024-07-17T19:48
edited: 2025-02-15T16:23
tags:
  - cs/dsa
  - readings
---
Arrays allocate contiguous block of memory, to store a bunch of objects of the same type.
- Accessing specific instances is cheap O(1) based on pointer index.
	- Can do pointer maths: address = starting address + i * data size
- Search is O(n) for unsorted array (loop through the array.)
- Memory is static since pre-allocated; we can't add to it later on. Regrow array.
	- Copy over all elements, so require O(n). BAD.

---
Array Lists implement Abstract Data Types (List ADT)
- In ADT, we define the behaviour and operations. 
- The interface equivalent of a data type.

List ADT: sequence of data values accessible via index.
- ```addAtIndex(int index, T data):``` add data to index position, and shift everything down one.
- ```removeAtIndex(int index, T data)```: remove
- ```get(int index)```
- ```isEmpty```
- ```clear()``` to no data
- ```size()``` number of data currently stored in list.

----
Array List
- Implements the List ADT, backed by an array.
- Sequence of cells of memory. 
- Can only store objects. 
- ```import java.util.ArrayList; ArrayList<String> list = new ArrayList<>();```
- Arraylists are an abstraction wrapper for array.
	- Resizing is handled automatically
	- Dynamically allocated (no user-called resize method; the program handles resizing)

Requirements
- Contiguous data (no nulls between data), must start with 0 (zero-aligned)
- Contiguous memory
- NOTE: this implies we have to keep shifting spaces. Hence, a size variable to allow us to quickly add to the back of the array.

What's the cost of adding values to the back of the arraylist?
- Worst case is O(n) for copying everything. This only happens after n additions, each of which takes O(1)
- We can amortize the n cost across the prior n additions, to get $\frac{kn + \text{resize}_n}{n} \approx O(1)$.
	- Typically ArrayList size is doubled each time. Thus, we can't trigger another resizes within $n$ sequence of operations.

What's the cost of adding values anywhere else?
- Now, we have to shift everything after that index over one no matter what. O(n) cost.
- Similar logic for removing (need to shift everything left).

