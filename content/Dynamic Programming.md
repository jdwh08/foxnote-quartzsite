---
aliases:
  - DP
tags:
  - cs/dsa/dp
edited: 2025-09-30T21:59
created: 2024-03-19T22:06
---
# Definition:
A [[Data Structures and Algorithms]] method which solves problems by using the answers from smaller subproblems. Often via [[Recursion]].

---
# Notes:

### When does DP Work?
1. We can break out the problem into a series of states.
2. Each state has transitions to other states.
3. The action at each state relies on very little information, e.g., only information we pass from the prior state in transition.
	1. No other "side effects"!
	2. This is basically the [[Markov Property]].
4. We repeatedly encounter the same states again and again.

**Other ways to think about it:**
Can we draw a [[Directed Graph]] that represents the problem entirely?
If states are 2D, can we start from one value and move our way to reach a different value?

Think about it kinda like a [[Markov Decision Process]], hence why DP is also relevant for [[Bellman Equation]] with [[Reinforcement Learning]].

### [[Big O]] for Time and Space Complexity?
1. Determine the number of possible states we have to go through.
2. Determine how long it takes for us to calculate the values at that state with the cache.
	1. This is the "Cache Complexity"
3. Big O for time is then $n\_states \times cache\_complexity$
4. Big O for space depends on your cache implementation.

### Problem Solving Process
What has seemed most intuitive to me is doing the following:
1. Identify the Recurrence Relation. State, Action, Transition, kept values, etc.
2. Build out the memo (dict, array) and DP function.
3. Once we get the recursive top-down solution working, transition to bottom-up.

#### Recognizing Dynamic Programming
1. Walk through with a little bit of brute force.
2. Check for states, actions, transitions, etc.
	1. If we see states getting repeated, it's probably DP.
	2. Otherwise, we can probably do DFS/BFS/Greedy
3. Determine the *minimum size subproblem*
4. Think about what the possible subproblems are.
	1. "If I had the answer to X, Y; then I could easily solve Z"

#### Recurrence Relation
1. States: What variable(s) uniquely define each problem?
	1. **index** within an array (e.g., [[Knapsack Problem]])
	2. **current value** (e.g., [[Leetcode 416 Partition Equal Subset Sum]])

2. Actions: Often given in the problem.
	1. Take/Skip for [[Knapsack Problem]] in 1D DP
		1. `for choice in choices: take; get best of takes` is alternative
	2. Movement between indices in 1D DP

3. Transitions:
	1. Increasing/decreasing values
	2. Increasing/decreasing indexes

4. Rewards:
	1. Identify what is the goal. Max? Min? Number of Ways? Reachability?
#### Flattening State
I tend to gravitate towards too many variables for states. This sometimes results in out-of-memory errors compared to more efficient solutions.

How do we determine whether state-defining variables must be kept?
1. Do they interact with other state-defining variables?
	1. E.g., defining an interval, defining the coordinates in a grid, getting position relative to some other variable, etc.
2. If we drop this variable, would we still be able to uniquely identify our state, assuming that we knew all prior states up to this point?
3. Does this serve more like a bookkeeping variable, e.g., `idx` which we loop through? **These are good candidates to drop.**

```
DP can collapse a variable if the transitions for that variables don't affect or are used with any of the other variables.
```

### Converting from Recursive to Iterative.

---
# Examples:

## Fibonacci
![[Fibonacci DP.png]]

```python
# basic recursion
def fibonacci(a: int) -> int:
	if (a <= 0):
		return 0
	if (a == 1):
		return 1
	return fibonacci(a) + fibonacci(a-1)

# dynamic programming
# recursive PULL version
def fibonacci_pull(a: int, cache: dict[int, int] = {}) -> int:
	if (a <= 0):
		return 0
	if (a == 1):
		return 1
	if a in cache:
		return cache[a]
	# Recursive pull
	# we "pull forward" the correct values
	output = fibonacci_pull(a-1, cache) + fibonacci_pull(a-2, cache)
	cache[a] = output
	return output

# iterative PUSH version
def fibonacci_push(a: int) -> int:
	# Base Cases
	# note: we can do constant space if cache only last two values.
	cache: list[int] = [0] * (len(a) + 1)
	cache[1] = 1

	for i in range(0, a-2):
		# we "push forward" the correct values
		cache[i+2] = cache[i] + cache[i+1]

	return cache[a]
```

## Frog Jump
- Suppose we have a frog that starts at position 0, and goes to position $n$.
- Each step, the frog can move forward either 1, 2, or 3 positions.
- How many paths can the frog take to go to position $n$?

Note this is a DP problem because...
1. We have a unique state (the position)
2. We don't care about prior information at each state, except for the number of paths (to keep track of).
3. We have transition functions to later states (move +1 or +2).
4. Transitions do not affect anything else other than moving state. No "side effects".

```python
# dynamic programming
# recursive PULL version
def frogjump_pull(a: int, cache: dict[int, int] = {}) -> int:
	if (a <= 0):
		return 1
	if a in cache:
		return cache[a]
	# Recursive pull
	# we "pull forward" the correct values
	output = 0
	if a-1 >= 0:
		output += frogjump_pull(a-1, cache)
	if a-2 >= 0:
		output += frogjump_pull(a-2, cache)
	if a-3 >= 0:
		output += frogjump_pull(a-3, cache)
	cache[a] = output
	return output

# iterative PUSH version
def frogjump_push(final_pos: int) -> int:
	# Base Cases
	# note: we can do constant space if cache only last two values.
	cache: list[int] = [0] * len(a+1)
	cache[0] = 1

	for i in range(0, final_pos):
		# we "push forward" the correct values
		# keep track of the number of ways
		if (i + 1) <= final_pos:
			cache[i+1] += cache[i]
		if (i + 2) <= final_pos:
			cache[i+2] += cache[i]
		if (i + 3) <= final_pos:
			cache[i+3] += cache[i]

	return cache[final_pos]
```

Notice this is uh just Fibonacci again, but with three values (Tribonacci).

## 0-1 [[Knapsack Problem]]

You are given a "knapsack" of $n$ values (a [[ArrayList|list]]). Is it possible to select some values so they add up to a value $T$? 
E.g., $n=9, T=25, k=[2,7,3,4,9,5,6,1,8] \rightarrow \text{True}, 7+3+4+5+6$

States: Yes, when we take a value out of the knapsack it changes the state, but we can fix this by sorting the knapsack values, and encoding our state as an index.

Transitions: At each state, we can either skip the number or take the number. If we skip, we keep our current tracking value; otherwise we add it. In either case, we increase our index.

Tracking: Our current value sum.

```python
# dynamic programming
# recursive PULL version
def knapsack_pull(n: int, T: int, knapsack: list[int]) -> bool:
	cache: list[list[int]] = [[-1] * (len(n)+1)] * (len(T)+1)

	def knapsack_pull_helper(i: int, target: int):
		if target == 0:
			return True
		if i <= 0:
			return False
		if target < 0:
			return False
		if cache[i][target] != -1:
			return cache[i][target]

		output = max(
			knapsack_pull_helper(i-1, value - knapsack[i])
			knapsack_pull_helper(i-1, value)
		)
		output[i][target] = output
		return output

	knapsack_pull_helper(len(knapsack)-1, T)
	return cache[n][T]

# iterative PUSH version
def knapsack_push(n: int, T: int, knapsack: list[int]) -> bool:
	# Base Cases
	# note: we can do constant space if cache only last two values.
	cache: list[list[int]] = [[0] * (len(n)+1)] * (len(T)+1)

	# Here, our cache stores 0/1 values for what we track
	# i.e., can we reach this point Y/N

	cache[0][0] = 1  # we can reach this, starting point i=0 v=0

	for i in range(0, n+1):
		for j in range(0, T+1):
			if (cache[i][j] == 1):
				# We can reach the remaining i by not taking
				cache[i+1][j] = 1

				if (j + knapsack[i] <= T):
					# We can take the value without going over
					cache[i+1][j+knapsack[i]] = 1

	# Can we reach the end target?
	return cache[n][T]
```

## Coin Change
- See [[Leetcode 322 Coin Change]]

## Other Examples
- [[Reinforcement Learning]], particularly [[Policy Iteration]] and [[Value Iteration]].
	- Note that the "no side effects" and stateless historical nature is basically just [[Markov Property]], and PI/VI assume [[Markov Decision Process]].

----
# Source:

[Deep Understanding of DP](https://www.youtube.com/watch?v=Clp5c7HvLqs)
[Five Steps for Solving DP Problems](https://www.youtube.com/watch?v=aPQY__2H3tE&pp=ygUTRHluYW1pYyBQcm9ncmFtbWluZw%3D%3D)
[DP is Recursion where Functions Return Values](https://www.youtube.com/watch?v=gK8KmTDtX8E&pp=ygUTRHluYW1pYyBQcm9ncmFtbWluZw%3D%3D)