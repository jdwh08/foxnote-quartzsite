---
aliases: 
tags:
  - ds
  - ds/nlp
edited: 2025-02-15T16:33
created: 2024-04-04T22:35
---
### Definition:
How to convert natural language in English to numerical features we can use to build models.

---
### Methods:

**Sparse Representation**
Given a list of words, create a feature vector of all the unique words. Have a 1 in that vector if it is the phrase, else 0. Also include an extra for bias.
- Issues: HUGE vocabulary size, mostly worthless vector length.

**Frequency Dictionary**
Given a corpus of "positive" and "negative" documents, count the number of times a word appears in the document by type.
Encode text based on the sum of frequencies, after de-duping the words.
- $X_m = [1, \sum \text{pos}, \sum \text{neg}]$

---
### Notes:
Notes

---
### Examples:
Examples