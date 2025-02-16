---
aliases: 
tags:
  - ds/ml
  - ds/nlp
  - ds
edited: 2025-02-15T16:33
created: 2024-04-15T15:08
---
### Definition:
Sentence Transformers are an attempt to embed the information of a sentence/paragraph into a single vector. The vectors can be compared for similarity using [[Cosine Similarity]].

---
### Notes:
Trains two "siamese" [[BERT]] models (they have the same weight) using [[Triplet Loss Function]]. Pools the resulting matrix into a vector. During training, we get the element-wise difference of the two vectors, and then uses [[Softmax]] with weights to get the similarity score between the two sentences.

During inferencing, we run it through the 

---
### Examples:
Examples