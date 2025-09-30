---
aliases: 
tags:
  - ds/ml/nn/transformers
edited: 2025-03-19T20:24
created: 2024-03-19T22:06
---
# Definition:
A [[Artificial Neural Network|Neural Network]] that is uses the attention mechanism that uses the 

---
# Notes:

#### Attention Mechanism
- For each token, predict the the tokens(s) that are relevant within the attention span.  

#### Types of Transformers
##### Encoder-Decoder / Seq2Seq
- Original Transformer
- [[T5]], [[BART]]
##### [[Encoder Only Transformer]]
- [[BERT]]
##### [[Decoder Only Transformer]]
- [[GPT2]], 

#### Language Preprocessing
- [[Tokenization]] for NLP converts tokens into sub-word units
- Special Tokens:
	- Model specific, e.g., start / end of string
- Tokens get represented as [[Embeddings]] which represent position and meaning of token.

#### Training Objective
- Next token prediction given prior tokens.
- Autoregressive, i.e., output from prior becomes input to new
- Next token prediction has emergent properties.

#### Generation
- [[Token Sampling]] has different approaches
	- Greedy Sampling: Always sample the best score
	- Beam Search: Explores $n$ different candidates across longer sequences to find higher probability.

---
# Examples:
Examples

----
# Source:
Source