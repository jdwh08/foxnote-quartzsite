---
aliases: 
tags:
  - cs/dsa/recursion
edited: 2025-05-15T21:03
created: 2024-03-19T22:06
---
# Definition:

A cs algorithm where we solve problems by having a function call itself over and over again.

---
# Notes:

You can also do async recursion where you do a task and then come back (e.g., file reading in JavaScript).

#### Base Case
Your base case is EXTREMELY important. You must have one.
**ALWAYS THINK ABOUT YOUR BASE CASE!**
**MAKE THIS CLEAR!!!!!**
**MOVE EVERYTHING YOU CAN INTO THE BASE CASE!**
**DON'T CHECK FOR CONDITIONS WITHIN RECURSION AREA.**

#### How does it work?
1. Return Address: Where do we send values to?
2. Return Value: What value do we return? (must have space allocated)
3. Args: What arguments do we use for the function?


Note that recursion creates a [[Stack]] of the functions that were called, and if it errored we have a [[Stack Trace]].

| Call  | Ret Address      | Val        | Args |
| ----- | ---------------- | ---------- | ---- |
| foo 5 | (whoever called) | 5+         | 5    |
| foo 4 | foo 5            | 4+         | 4    |
| foo 3 | foo 4            | 3+         | 3    |
| foo 2 | foo 3            | 2+         | 2    |
| foo 1 | foo 2            | 1 \<base\> | 1    |

Now that we finally know the returned value, we can trace all the values back: $foo_1 = 1 \rightarrow foo_2 = 2 + foo_1, ... \rightarrow foo_5 = 5  + foo_4$

#### Recursion Steps
These are particularly useful for future [[Data Structures and Algorithms]], especially with [[Tree]] and [[Graphs]].

1. PRE STEP: Setup before calling function (e.g. checking)
2. RECURSE: Function call itself
3. POST SET: Setup after calling function (e.g., log)


#### When to use Recursion
1. When you can't use a for loop easily.
	1. No pre-defined end
	2. Significant branching factors (e.g., four possible options at each state)

---
# Examples:

#### Basic Sum
```javascript
// Sum numbers from 1 to 100
function foo(n: number): number {
	// Base Case (note this breaks if n < 0)
	if (n === 1) {
		return 1;
	}
	
	// Recursive
	output = n + recur_sum(n-1);

	return output;
}
```


#### Maze Solver
Suppose we have a maze in a list like so:
```javascript
[
	"#####E#",
	"#     #",
	"#S#####",
] // where S is start and E is end
```

We can make four choices at each step: up, left, down, right.
Not all choices are valid (walls, out of bounds).
We can also make suboptimal choices (backtracking).

**Base Cases are SUPER IMPORTANT**.
1. It's a wall. (If we are at a wall, we are invalid state)
2. It's out of bounds. (Invalid state again)
3. It's the exit E (can terminate)
4. We have seen the tile before. We do NOT want to visit twice.

**Recursive Case is easy after base case is solidly known.**
```javascript

// LEETCODE HACK
// save your possible actions in a directory
const dir = {
	[-1, 0],  // left
	[1, 0],  // right
	[0, -1],  // down
	[0, 1],  // up
}

// Primagen prefers creating a seperate function for recursion
// This one checks the base cases
function walk(maze: string[], wall: string, curr: Point, end: Point, seen: boolean[][], path: Point[]): boolean {
	// BASE CASES
	// 1. Off the map
	if (curr.x < 0 || curr.x >= maze[0].length) {
		return false;
	}
	if (curr.y < 0 || curr.y >= maze.length) {
		return false;
	}
	// 2. On a wall
	if (maze[curr.y][curr.x] === wall) {
		return false;
	}
	// 3. At the end
	if (curr.x === end.x && curr.y === end.y) {
		// note that we don't add ending to path yet
		path.push(curr);
		return true; // great success!
	}
	// 4. Seen items
	// Seen is important to prevent infinite movement.
	// Primagen thinks that having a type with both x,y
	// and a seen variable is probably bad design 
	// creating weird typing and too much info.
	// Instead, we just pass a boolean mask.
	if (seen[curr.y][curr.x]) {
		return false;
	}

	// RECURSION
	// Completely seperated from base cases.

	// Recursion Steps
	// 1. PRE
	path.push(curr); // add current to path
	seen[curr.y][curr.x] = true;  // we've seen it!

	// 2. RECURSE
	for (let i = 0; i < dir.length; ++i) {
		const [x, y] = dir[i]; // pick your direction
		
		walk_result = walk(
			maze,
			wall, 
			// add your action result state
			{
				x: curr.x + x,
				y: curr.y + y,
			},
			end,
			seen,
			path
		);

		if (walk_result) {
			// we did it!
			break;
		}
	}

	// 3. POST
	// we've finished checking everything here
	// and did not escape, so this is not the
	// right direction.
	// thus, we must backtrack the path.
	path.pop();

	// Final
	return false;
}

// Given string, wall, start, end, and return point.
export default function solve(maze: string[], wall: string, start: Point, end: Point): Point[] {

	const seen: boolean[][] = [];
	const path: Point[] = [];

	// populate seen array with all false to start
	for (let i = 0; i < maze.length; ++i) {
		seen.push(
			new Array(maze[0].length).fill(false);
		)
	}

	walk(
		maze, walk, start, end, seen, path
	);

	return path;
}
```

----
# Source:
Source