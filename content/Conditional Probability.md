---
aliases: 
tags:
  - stats/probability
edited: 2025-02-15T16:12
created: 2024-03-02T19:32
---
### Definition:
**Conditional [[Probability]]**: The probability that [[Sample Space and Events|Event]] $A$ happens upon seeing B.
$P(A|B)$.

$P(A|B) = \frac{P(A\cap B)}{P(B)}$ if $P(B) > 0$. 
There are other ways to calculate this though, e.g., figuring out how B changed the [[Sample Space and Events|sample space]].

For [[Random Variable]]s:
$$p_{X|Y}(x|y)=\frac{P(X=x, Y=y)}{P(Y=y)}=\frac{P(x,y)}{P(y)}$$
- Because this is a probability across $P(Y=y)$, each value of $y$ must have it satisfy the conditions to be a probability (i.e., sum up to 1).

The same is true for distributions, i.e., [[Joint Probability]] over [[Marginal Probability]]:
$$f_{X|Y}(x|y) = \frac{f(x,y)}{f_Y(y)}$$

---
### Notes:
This also leads to the **General Multiplication Rule**, $P(A\cap B) = P(A | B) \times P(B) = P(B | A) \times P(A)$
For multiple events, this can be chained together: $P(A \cap B \cap C)=P(A | B \cap C) \times P(B \cap C)$

---
### Examples:
Probability of seeing the card is a King given that the card is a face card:
- $P(King | Face) = \frac{4}{12}$
- $P(King)=\frac{4}{52}$
