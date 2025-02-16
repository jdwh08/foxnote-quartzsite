---
aliases: 
tags:
  - cs/dsa/array
edited: 2025-02-15T16:23
created: 2025-01-05T20:16
---
### Definition:

A **contiguous memory space** which has some specific bytes.

| ..  | ... | ... | ... | ... | ... | ... | ... | ... | ... |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 0   |     |     |     |     |     |     |     |     | N   |
- Array elements are accessed by their index.
- Each index "slot" here is actually some bytes in the memory space 
- You tell the compiler what the size you're storing is, e.g., int32 a 32 bit integer

---
### Notes:

The most fundamental data structure.

```C
int a [3]; // array of integers, len 3
a[1]
```
We first create a continuous memory space 3 * int long.
Then, we tell the compiler to go to the memory address:
$\text{array start location} + \text{sizeOf(int)} * 1$

This leads to funky behaviour if you change the type / sizeOf.

##### Insertion
You **can't** grow an array because it might change memory used after the array.
Insertion thus overwrites at the specific index.

##### Deletion
Doesn't really exist; instead, we set it to some `null` value (e.g., 0).

##### Big O
Constant time! $O(1)$ As $n \rightarrow \infty$, nothing changes about the memory index calculation. 

---
### Examples:
```typescript
const a = []
```
isn't actually an array in TypeScript! Because we don't have a 


----
### Misc:
When you instantiate an array, you generally will need to put a size. To "grow" the array, we can reallocate a larger space and put the old elements in.

The choice of array size for array buffers is an optimization problem (tradeoff between memory size and reallocation cost)