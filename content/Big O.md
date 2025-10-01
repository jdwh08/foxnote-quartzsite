---
aliases:
tags:
  - cs/dsa
edited: 2025-08-27T16:19
created: 2024-07-17T19:36
---
### Definition:
Generally categorizes an algorithm based on the input.
As your input grows, how fast does compute or memory grow?

Formally:


..f(n) = O(g(n)) \text{ iff } \exists\  c, k \ s.t.\ 0\le f(n) \le c*g(n) \ \forall \ n \ge k$



---
### Notes:
1. Big O growth is measured *relative to input growth*.
2. Big O does NOT care about constants -- we care about *asymptotic* behaviour.
	1. Remove any additive and multiplicative constants, or smaller family terms.
3. Big O typically is for worst case.
4. Big O does not factor hardware or anything else!
	- We might have $O(n^2)$ slower than $O(n)$ on small datasets for example.
5. Yes there are other measures, but Big O as the upper bound is really the most meaningful.

Why use?
- Helps make decisions about what data structures and algorithms to use. Chose the wrong one and you get terrible results.

#### Big O Families!
- $O(1)$ constant
	- Math, min, basic memory operations.
- $O(log_2(n))$ log time
	- [[Binary Array Search]]: you can halve the "search area" each time.
	- [[Tree Traversal]] for [[Binary Tree]]
- $O(n)$ linear
- $O(n log(n))$ Linearithmic
	- Quicksort: search the whole space once, but each search halves the "search area".
- $O(n^2)$ Quadratic
- $O(n^3)$ Cubic
- $O(2^n)$ Exponential.
	- This can't meaningfully run.
- $O(3^n)$ 3-Exponential.
- $O(n!)$ Factorial.

Note that we can have multiple values appear in the Big O, e.g., for [[Graph]] algorithms with nodes $V$ and edges $E$. 

##### More Difficult Families:
- [[NP-Complete]]: Problems where we can't currently do better than [[Brute Force]].
	- [[Travelling Salesman Problem]]: Given some nodes, find the shortest path that goes through all of the nodes and ends at the start.
	- [[Longest Path Problem]]: Find the longest path between two nodes in a graph without repeating nodes.
	- [[Hamiltonian Path]]: Determine whether there is a path that visits all nodes without repeats. (Note this is not all *edges*, which is a [[Eulerian Path]] and linear time).
	- [[Graph Colouring]]: Assign a colour to each node so adjacent nodes have different colours. Is three colours possible?
	- [[Knapsack Problem]]: Given objects with values and size, what's the largest value you can have given some size constraint?

#### Time Complexity
How much time is needed for the program.
1. Explicitly list the variables used.
2. Look for loops! 
	1. Each loop over $n$ is at least $O(n)$.
	2. Each nested loop over $n$ input suggests a new power ($n \rightarrow n^2 \rightarrow n^3 ...)$.
3. Look for halving at each step! This suggests a $log$, or $n logn$ if we also have to scan each element.
4. What about Recursive Traversal, like [[Depth First Search|DFS]] or [[Breadth First Search|BFS]]?
	1. How many times do we touch each node / edge / point? 
	2. E.g., if we touch all values in a grid, it's $O(mn)$. 
	3. If we touch all nodes once it's $O(V)$
	4. If we touch all nodes and all edges once it's $O(V+E)$
5. What about built-in methods?
	1. Think about if you built it yourself.
	2. If not, meh, assume, and have interviewer be okay.

#### Space Complexity
How much additional space is needed for the program.
1. Primitive values hold $O(1)$. Char, float, int, bool, pointer.
2. Composite types (classes / structs) combine multiple primitives, which we get by counting the number of fields.
3. Collections like arrays, strings, sets, maps.
4. Call stack takes memory for [[Recursion]] depending on the maximum recursion depth.
	1. E.g., [[Quicksort]] recursion repeatedly divides the array in half, so $O(\log n)$

NOTES:
1. Make sure you properly tell the difference between references and copies.
	1. Python slicing makes a copy, for example! 

#### Time vs Space
- We can often trade time for space, as a typical default.
- It doesn't make sense for space to be more than time, since remember the lower bound is initializing the space!

#### Cases
- Worst Case: This is what typically gets focused on. Maximum number of steps possible.
- Best Case: Fewest Number of steps possible
- Average Case: the average number of steps.


---
### Examples:

```python
def sum_first_ten(arr: list[int]) -> int:
	sum = 0
	for i in range(10):
		if i >= len(arr):
			break
		sum += arr[i]
	return sum
```
We see that no matter the size of arr we scan at most 10 values, i.e., $O(1)$.

```python
def sum_char_codes(n: str) -> int:
	sum = 0
	for i in range(0, len(n)):
		sum += ord(n[i])

	return sum
```
We see that this loops through each letter in the string.
- As string grows by 1, we loop one more time.
- $O(n)$

```python
def sum_char_codes(n: str) -> int:
	sum = 0
	for i in range(0, len(n)):
		sum += ord(n[i])

	for i in range(0, len(n)):
		sum += ord(n[i])

	return sum
```
- $O(n)$ still; we don't care about constants.

```python
def sum_char_codes(n: str) -> int:
	sum = 0
	for i in range(0, len(n)):
		if n[i] == "E":
			# Early return
			return sum

		sum += ord(n[i])

	return sum
```
- $O(n)$; we almost always consider worst case.

```python
def sum_char_codes(n: str) -> int:
	sum = 0
	for i in range(0, len(n)):
		for j in range(0, len(n)):
			sum += ord(n[i])

	return sum
```
- $O(n^2)$, count the loops! For each character, we do each character again. This is basically like a square.

```python
def sum_char_codes(n: str) -> int:
	sum = 0
	for i in range(0, len(n)):
		for j in range(0, len(n)):
			for k in range(j, len(n)):
				sum += ord(n[i])

	return sum
```
- $O(n^3)$, same logic but cube / matrix multiply

```python
def has_negatives(arr: list[int]) -> bool:
	for val in arr:
		if val < 0:
			return True
	
	return False
```
- Worst case is $O(n)$ since this is a [[Linear Array Search]]. 
	- However, we can sometimes get a negative right away, i.e., $O(1)$.
	- Average case depends on how likely negatives are.