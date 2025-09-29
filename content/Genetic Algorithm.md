---
aliases:
tags:
  - ds/ml
  - cs/dsa/optimizers
edited: 2025-09-28T22:54
created: 2024-03-19T22:06
---
# Definition:
A [[Randomized Optimization]] algorithm specializing in multi-dimensional optimization.

Name comes from biology: 
1. We have different **population**(s) of models 
2. We **mutate** with small local changes. 
3. We **crossover** by combining beneficial dimensions from each population, which we assume is good.
	1. This is the main difference from [[Hill Climbing|Random Restart Hill Climbing]]
	2. Maybe we also add some small mutations
4. We iterate over time creating **generations**.

This is basically random [[Beam Search]].

---
# Notes:

#### Motivation
- Suppose we are optimizing and find that we do better when increasing on both **Feature 1** AND **Feature 2**. 
- Shouldn't we optimize on both of them?

### Algorithm
1. Start with initial fixed population $P_0$ of size $K$
2. WHILE NOT CONVERGED, i.e., fitness below some threshold
	1. Compute some "fitness" reward function on all $x$ in population
	2. Select the "most fit" individuals
		1. Pick the top-K or top-P. "Truncate Selection"
		2. [[Weighted Sampling]] like a "roulette wheel" based on the fitness scores or ranks or ...
	3. We **Crossover** and/or **Mutate** attributes from parents
		1. Parents often selected with weighted sampling
	4. We replace the least fit individuals with the new more fit ones.

#### Crossover and Mutation Methods
A method of combining from parents to create new options.

1. **One-Point Crossover**: Pick some random point to divide on, and have all attributes before and after come from one of the parents.
	1. [[Model Bias]]: 
		1. Position matters (things together belong together)
		2. There is some way to optimize this by dividing the attributes into subspaces.
2. **N-Point Crossover**: Pick $N$ random points to divide on, and have all attributes within the section come from one or the other parent.
3. **Uniform Crossover**: For each possible attribute, randomly decide which of the parents this comes from.
	1. NOTE: This is the biological one acting at the Gene Level.
	2. [[Model Bias]]: We assume there is some way to optimize this by dividing the attributes into subspaces
4. **Point Mutation**: Randomly change a value at some point.

### Fitness Function
- If [[Classification]], usually based on [[Accuracy]] over the training data for the specific rule being applied.

### Search Space
- [[Beam Search]] which can have abrupt changes, thus less likelihood for [[Local Optima]]

### Issues
1. Crowding: What if a highly fit value exists, and completely takes over the population with its descendants? This reduces the diversity of the population.
	1. Alter the selection function to pick less fit individuals more? E.g., normalize by rank instead of fitness?
	2. Reduce the fitness if it's very similar to other observations? etc.

#### Tweaks Needed for Effectiveness
1. What does the input representation look like?
2. What does the selection look like?
3. What is the fitness function?

---
# Examples:

#### Eight Bit Strings
Suppose our input space is 8-bit strings.
We have two inputs to crossover:
$01101100$
$11010111$
$.x...x...$
We can crossover with Two Point Crossover at the $x$s.
$01010100$
$11101111$

----
# Source:
GaTech ML