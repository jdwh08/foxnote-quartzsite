---
aliases: 
tags:
  - cs/theory
  - ds/ml/theory
edited: 2025-06-06T06:34
created: 2024-03-19T22:06
---
# Definition:
A [[Version Space]], i.e., the possible hypotheses for the model that fit the data, where all possible options have low enough error regardless.


---
# Notes:

Formally:
- Version space has probability-weighted-error less than some $\epsilon$ for all possible $h$
- I.e.,  all remaining possible candidates consistent with the data have low error.
- A requirement for [[Probably Approximately Correct Learning|PAC Learning]]
	- Note the $\epsilon$ here is the "Approximately", i.e., error within some bound
	- $\epsilon$ must be at most 0.5
- Data requirements to fulfill this are [[Haussler's Theorem]]

---
# Examples:

Suppose we have the following (true candidate / [[Data Generating Process]] is XOR):

| [[Probability Mass Function\|D]] | X1  | X2  | c(x) | Seen? |
| -------------------------------- | --- | --- | ---- | ----- |
| 0.1                              | 0   | 0   | 0    | Yes   |
| 0.5                              | 0   | 1   | 1    |       |
| 0.4                              | 1   | 0   | 1    | Yes   |
| 0.0                              | 1   | 1   | 0    |       |

And our possible hypotheses are: 
- X1, NOT X1, X2, NOT X2, True, False, AND, OR, XOR, Equivalent

Our [[Version Space]] that is consistent with the seen

Sourcedata is...
- X1, OR, XOR

Our errors for each are:
- X1: 0 + 0.5 + 0 + 0.0 = 0.5
- OR: 0 + 0 + 0 + 0.0 = 0.0
- XOR: 0 + 0 + 0 + 0 = 0 (true DGP lol)

Thus, if our $\epsilon$ is $0.5$, we are epsilon exhausted.

----
# Source:
Source