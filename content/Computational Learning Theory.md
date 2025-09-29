---
aliases:
tags:
  - cs/theory
  - ds/ml/theory/clt
edited: 2025-09-28T22:46
created: 2024-03-19T22:06
---
# Definition:

A branch of theory aimed at defining learning problems, showing when specific algorithms work, and showing when problems are fundamentally hard.

**Resources**
- Time & Space (same as in CS theory)
- Data

#### Formally...

**Computational Complexity**: How much computational effort is needed for a learner to converge.
**Sample Complexity**: How much training samples are needed for the learner to make a successful hypothesis
**Mistake Bounds (if online)**: How many misclassifications can a learner make 

---
# Notes:

**Inductive Learning**: Learning from examples
1. Probability of successful training? $1-\delta$
2. Number of examples $n$
3. Complexity of hypothesis / representation class $H$
4. Accuracy against target concept $\epsilon$
5. Manner in which training examples are presented ([[Batch Learning]], [[Online Learning]])
6. Manner in which training examples are selected
	1. Examples: Suppose we are trying to play Guess Who with 20 questions.
	2. Teacher presents samples (knows real answers; can hint at answers via choice by directly asking "is it this person?")
	3. Learner presents samples (doesn't know answers; must systematically explore e.g. repeatedly halving)
	4. Nature presents the samples
	5. Teacher presents worst case examples
	6. Teacher has constrained space (e.g., bits to send)

##### Constrained Space Example
Suppose we have X1...5 bit input. All variables are either ignored, AND, or NOT.

| X1  | X2  | X3  | X4  | X5  | Y   |
| --- | --- | --- | --- | --- | --- |
| 1   | 0   | 0   | 1   | 0   | 1   |
| 0   | 0   | 1   | 1   | 0   | 1   |
| 1   | 1   | 0   | 1   | 0   | 0   |
| 1   | 0   | 0   | 0   | 0   | 0   |
| 1   | 0   | 0   | 1   | 1   | 0   |
Answer: NOT X2 AND X4 AND NOT X5
- Notice how X1 and X3 have inconsistent behaviour when $Y=1$, thus cannot be part of the AND. This needs **two examples** to show irrelevant variables.
- We use the remaining to check the relationship is POS or NOT, one for each variable
- While the hypothesis space is $3^k$, we only needed $2+k$ for optimal with a smart teacher.
- However, if you're a learner and don't know... we might face a really bad problem where all variables are relevant and we have no idea which are negated; thus, we only get a 1 if we perfectly guess the result.
	- We can't guess a question like "is X1 absent"?
	- Worst case is $2^k$, i.e., guess every possible option.


#### Constrained Bound Example

Suppose our learner can continue to guess, and gets a point off if it is incorrect.
We need some way to guarantee that it finds the correct result within some score.
This means that **incorrect values must bring lots of information**!

```pseudocode
1. Assume all X bits are both POS and NOT
2. Compute output from input
3. If wrong, set POS and 0 to Absent; set NOT and 1 to Absent
```

- Hypothesis: Assume that all bits X...X are both POS and NOT at the same time; i.e., X1 AND NOT X1 AND ...
	- This always is FALSE, so us getting FALSE doesn't take off points.
	- Once we are wrong, i.e., FALSE but actually TRUE, this tells us a lot!
	- E.g., 10110 is 1 implies X1 can't be NOT, X2 can't be POS, ...
- Now we only predict TRUE if we see 10110
	- If we now see 10111 is 1 implies that X5 can't matter.
- Now we only predict TRUE if we see 1011X
- Thus, we need 1 failure to start, and then one failure per bit; i.e., $K+1$ mistakes max.


We have some hypothesis space $H$ which has the true [[Data Generating Process|"candidate hypothesis"]] $c$ and the candidates we are trying $h$.
We have some training examples $S \subseteq X$ and labels $c(x) \forall x \in S$.
- **Consistent Learner**: produces the true DGP $c(x) = h(x)$
- **Version Space**: hypotheses consistent with training examples: $VS(s) = \{ h \ \text{s.t.} \ h \in H \forall S\}$


**Training Error**: fraction of training examples misclassified by our hypothesis $h$
**True Error**: fraction of training examples that would be misclassified on $S \sim D$ sampling
$error_D(h)=P_{x \sim D}\left[ c(x) \neq h(x) \right]$
- Basically, it's mistakes between true c and our hypothesis $h$; $c(x) \neq h(x)$ based on how likely we are to see them $P_{x \sim D}$

[[Probably Approximately Correct Learning|PAC Learning]]: dictate if can learn within some error within some probability of the time
- [[Haussler's Theorem]] dictates samples needed for finite space

---
# Examples:
Examples

----
# Source:
GaTech ML