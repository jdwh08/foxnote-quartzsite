---
aliases:
  - Neetcode
tags:
  - cs/dsa
  - cs/leetcode
edited: 2025-08-26T09:08
created: 2024-05-21T20:37
---
# Definition:

Standardized toy problems to test knowledge of [[Data Structures and Algorithms]].

---
# Notes:

### How to Practice:
1. For a given type of question, start by **learning common patterns for solutions**.
	1. Build a list of Easy/Medium questions (start with common ones in that type)
		1. Options: Blind75, [Neetcode150](neetcode.io)\*\*\*, High Frequency Company List on Leetcode.com
		2. Pareto Optimal Topics: Neetcode150's Arrays & Hashing, Two Pointer, Sliding Window, Binary Search, Linked List, Trees, Heaps & Priority Queues, Graphs
		3. High Frequency should be used for specific questions.
	2. Split this into Train/Test, where you don't even try the Train solutions but instead use them to learn patterns.
	3. Practice the patterns on the Test set.
		1. If you fail it, then pause and look to see if it's a new pattern. If yes, then add it to your list of patterns.
	4. Repeat this process moving from Easy (~30% of time up front) to Medium (~70% of time). Forget about Hards for now. 
2. Spend 30 minutes on a Leetcode.
	1. PEN & PAPER: Try to solve the problem out by hand.
	2. BRUTE FORCE: Write out the "brute force" version of the problem, i.e., check out everything.
		1. Write down time and space complexity.
	3. OPTIMIZE: Identify optimizations for the time and space complexity.
	4. IMPLEMENT: The optimal solution.
		1. Good code minimizes edge cases, and handles them implicitly.
		2. Don't submit your code multiple times.
3. Quality and Quantity
	1. Focus on the most common question types and questions.
		1. [[ArrayList|ARRAYS]] / STRINGS / [[Hashmap|HASHMAPS]] (50%) | 
			1. [[Greedy Algorithm|Greedy]] Search, [[Binary Array Search]], [[Two Pointer]], [[Sliding Window]]
		2. [[Matrix]], [[Tree]], [[Priority Queue]]
			1. [[Breadth First Search]], [[Depth First Search]], [[Recursion]]
		3. [[Graph]], [[Stack]], [[Trie]], [[Linked List]]
			1. [[Dynamic Programming]], Monotonic Stack, [[Union Find]].
	2. NOTE: "lower level" topics often have modifications to them, whereas higher level questions are more likely to be verbatim.
4. Practice doing Leetcode questions "interview style", i.e., by keeping them engaged throughout the flow.
	1. Ask for time to think, suggest ideas, simplify the question, etc.
	2. Practice on sites like Pramp.
5. Don't bother finding the most optimized solution, or exotic solutions. Focus on passing the interview.
	1. Find the lists for that specific company.

### Recognizing Pattern Types
[Guides](https://github.com/bitflipdev/guides)

1. **Look at the Constraints.**
	1. If $n \le 20$, then we can use things with [[Big O]] of exponential, since checking all solutions is a feasible answer.
		1. [[Brute Force]]
		2. [[Backtracking]]
		3. [[Recursion]]
	2. If $n \le 10^3$, then we probably need things with [[Big O]] of like $n \log(n)$ time.
		1. [[Sorting Algorithm]]
	3. If $n \le 10^5$, then we need things with [[Big O]] of Linear-ish time
		1. [[Greedy Algorithm]]
		2. [[Two Pointer]]
		3. [[Heap]]
		4. [[Dynamic Programming]]
	4. If $n \le 10^8$, then we need super fast [[Big O]] of $\log(n)$ or $1$ solutions.
		1. Math
		2. [[Binary Array Search]]
		3. [[Divide and Conquer]]
		4. Constant stuff
2. **Look at the input format.**
	1. If input is a [[Tree]], [[Binary Tree]], or [[Binary Search Tree]], then we need some tree traversal.
		1. [[Breadth First Search]]: 
			1. Visit things level by level
			2. Shortest path in unweighted tree.
		2. [[Depth First Search]]: 
			1. Visit all paths or nodes recursively.
			2. Pre-order, In-order, Post-order
	2. If input is a [[Graph]]
		1. [[Breadth First Search]]: shortest path
		2. [[Depth First Search]]: 
		3. [[Union Find]]: Finding "connected components" or "members of groups"
		4. [[Topological Sort]] for dependencies
	3. If input is a [[Matrix]]: 
		1. [[Depth First Search]] or [[Breadth First Search]] for "island" problems
		2. [[Union Find]] for connected regions
		3. [[Dynamic Programming]] for path problems
			1. 4-directional or 8-directional movement?
	4. String
		1. [[Two Pointer]]: Palindromes
		2. [[Sliding Window]]: Substrings
		3. [[Trie]]: Word prefix problems
	5. Sorted [[ArrayList]]: You need to use the sorted property to cut time complexity.
		1. [[Two Pointer]]
		2. [[Binary Array Search]]
		3. [[Greedy Algorithm]]
	6. [[Linked List]]
		1. [[Two Pointer]] with [[Fast and Slow Pointers]]
		2. [[Dummy Node]] techniques
	7. If input is an [[ArrayList]] or Number, then need to look at question.
3. **Look at the output format.**
	1. List of Lists: All combinations / all paths / all subsets is almost always [[Backtracking]].
		1. Recursion with "choose-nochoose" pattern.
	2. Single Number: 
		1. [[Dynamic Programming]] for optimization (min, max, number of ways)
		2. [[Greedy Algorithm]] for local optimal choices
		3. Math for counting
	3. Modified Array or String: [[Two Pointer]]
	4. Ordered List: [[Sorting Algorithm]], e.g., [[Topological Sort]]
4. **Look at QUESTION KEYWORDS!**
	1. [[Dynamic Programming]]: 
		1. Number of ways
		2. Maximum profit/sum, minimum cost, etc.
		3. Can you reach?
		4. Longest or shortest subsequence
		5. Optimal or best
	2. [[Two Pointer]]
		1. Palindrome
		2. Sorted Array
		3. Target Sum (e.g., 3sum)
		4. Remove Duplicates
	3. [[Sliding Window]]
		1. Substring with conditions
		2. Subarray of some size
		3. Maximum or minimum in window
		4. Contains all
	4. [[Heap]]
		1. K-Largest or K-Smallest
		2. Top-K
		3. Median
		4. Priority
	5. [[Stack]]
		1. Parentheses or brackets
		2. Valid expression
		3. Nested structure
		4. Undoing things
	6. [[Monotonic Stack]]:
		1. Next Greatest Element
		2. Next Smallest Element
	7. [[Hashmap]]
		1. Count Frequency
		2. Find duplicates
		3. Anagram
	8. [[Trie]]
		1. Word search
		2. Word prefixes
	9. [[Greedy Algorithm]]
		1. Minimum operations
	10. [[Union Find]]
		1. Connected components
		2. Number of groups
	11. [[Binary Array Search]]
		1. Kth element
		2. Search in sorted
		3. Minimize maximum / [[Minimax]]
		4. First or last occurrance
	12. [[Bit Manipulation]]
		1. XOR
		2. Single Number problems
		3. Power of 2
	13. Math
		1. [[Greatest Common Divisor]] or [[Least Common Denominator]]
		2. [[Prime Number]]
		3. Angle calculations
		4. Coordinates
	14. [[Game Theory]]
		1. Optimal strategy
		2. Win/lose
		3. [[Minimax]]

### Implementations in Python Standard Library
- Sort: `sorted(optional key=...)`
- Queue, Linked List: `collections.deque` with `append(), appendleft(), pop(), popleft()`
- Stack: `list`
- Heap: `heapq.heapify(list[int])` to make a min-heap, and then `heapq.heappop(list)` or `heapq.heappush(list)`
- [[Bucket Sort]]: `collections.Counter(list)`, and then use like a dict e.g., `c[key]`
- Letters to ASCII: `ord` and `chr`

Array specific patterns since I don't know this well enough:
- Sorting
- Swapping Variables with pointers
- "Frontier Sort" where you move elements matching a property into some sorted range.
- Two Pointer (going in like Rain Water, going out like longest palindrome, going across like sliding window)
- Sliding Window
- Prefix Sum or Product (e.g., Product of Array except Self)
- Hashing (e.g. valid Sudoku)
- Binary Search and Binary Condition Search
- Greedy Stuff like in Jump Game II
- Key and Reverse (e.g., Zigzag Matrix access, Rotate Array)
- Bucket Sort and Counter
- 