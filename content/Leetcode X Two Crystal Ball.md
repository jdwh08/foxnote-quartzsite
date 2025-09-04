---
aliases:
  - Square Root Array Search
tags:
  - cs/leetcode
  - cs/dsa/array
  - cs/dsa/search
edited: 2025-07-30T19:24
created: 2025-01-05T21:32
---
### Question:
Given two crystal balls that will break if dropped from
a high enough distance, determine the exact spot in
which it will break in the most optimized way.

This implies...
1) Crystal balls break at the same position $i$ (the "optimal position")
2) We only get two breaks before we can't continue.

---
### Whiteboard:
Let's generalize this problem!
We can think of the breaks as two arrays, which flip to TRUE at some index.

`ball_1_will_break` = \[False, False, False, ... True, True, True...\]
`ball_2_will_break` = \[False, False, False, ... False, ..., True, True...\]

We want to find the point where it breaks most optimally!
What are our known search algo options?
1. [[Linear Array Search]] -- yes, it will find it, but we didn't even use our "constraint" of two crystal balls.
	1. Loop over int: $O(n)$

1. [[Binary Array Search]] Note that this is actually ORDERED! (Falses all before Trues)
	1. Suppose we go to some floor $k$, and see that only ball 1 breaks.
	2. Uh oh! We only have one try left! If we continue binary search, the 1/4 position might break the ball... we have to be more conservative now.
	3. We have to walk backwards until we find where it breaks using linear search.

Crapppp. Now we need to find something else.

Primagen suggests the following:
> We have to jump by a completely different unit! One that means when we walk backwards, it's not a portion of N that must be covered by linear search.

**Jump by $\sqrt{n}$  each time until the first crystal breaks!**
This implies two things:
1. We have at worst case $\sqrt{n}$ goes with the first crystal.
2. When the first crystal breaks, we have to jump forwards **not some fraction of n, but rather $\sqrt{n}$** ! This is now $O(\sqrt{n} + \sqrt{n}) < O(n)!$
3. Notice how $\sqrt{n}$ balances is optimal because these two factors.


---
### Implementation:
```python
def two_crystal_balls(breaks: list[bool]) -> int:
	JUMP_AMOUNT = math.floor(math.sqrt(len(breaks)))
	num_balls = 2

	# Use the first crystal ball
	# to get approx. break window
	for i in range(0, len(breaks), JUMP_AMOUNT):
		if breaks[i]:
			break

	# Use second crystal ball to 
	# get exact breakpoint in window
	i -= JUMP_AMOUNT
	for j in range(0, JUMP_AMOUNT):
		if breaks[i+j]:
			return i+j

	return -1
```

---
### Notes:
Primagen calls this a trick that's sometimes useful, e.g., searching without a [[Priority Queue]].

Questions:
1. Why not something like $\sqrt[3]{n}$?
	Uh... primagen doesn't answer, but I think this is because this balances the jumps with the increments.

