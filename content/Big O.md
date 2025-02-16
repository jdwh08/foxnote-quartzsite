---
aliases: 
tags:
  - cs/dsa
edited: 2025-02-15T16:23
created: 2024-07-17T19:36
---
### Definition:
Generally categorizes an algorithm based on the input.
As your input grows, how fast does compute or memory grow?

Formally:
$$f(n) = O(g(n)) \text{ iff } \exists\  c, k \ s.t.\ 0\le f(n) \le c*g(n) \ \forall \ n \ge k$$

---
### Notes:
1. Big O growth is measured *relative to input growth*.
2. Big O does NOT care about constants -- we care about *asymptotic* behaviour.
3. Big O typically is for worst case.
4. Big O does not factor hardware or anything else!
	- We might have $O(n^2)$ slower than $O(n)$ on small datasets for example.
5. Yes there are other measures, but Big O as the upper bound is really the most meaningful.

Why use?
- Helps make decisions about what data structures and algorithms to use. Chose the wrong one and you get terrible results.

##### How do we find this?
1. Look for loops! Each nested loop over n suggests a power.
2. Look for halving at each step! This suggests a $log$, or $n logn$ if we also have to scan each element.

#### Big O Families!
- $O(1)$ constant
- $O(n)$ linear
- $O(log_2(n))$
	- Binary Search; you can halve the "search area" each time.
- $O(n log(n))$
	- Quicksort; you have to search the whole space once, but each search halves the "search area".
- $O(n^2)$
- $O(2^n)$ This can't meaningfully run.
- $O(n!)$ Yeah no.

---
### Examples:

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