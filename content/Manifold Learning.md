---
aliases:
tags:
  - ds/ml/theory
edited: 2025-09-26T13:28
created: 2024-03-19T22:06
---
# Definition:
A type of learning which assumes the data consists of a [[Manifold]] [[Embeddings]] in higher dimensional space. The goal is to learn this manifold.

E.g., "a string of points in a 2D plane". We can then move along the string.

---
# Notes:

### The Manifold Hypothesis
- An important assumption in [[Deep Learning]] to counteract the [[Curse of Dimensionality]].
- Most real world data is concentrated into some small space.
	- Random generation gives meaningless [[White Noise]].
- This real world data is meaningfully connected to each other.
	- Traverse "along the space" of human faces, etc.

- If this holds, we can do a [[Change of Basis]] and use the manifold as our way to represent the data!

- We can approximate this manifold with a model that learns [[Latent Space]], e.g., [[Autoencoder]].

---
# Examples:
Examples

----
# Source:
Goodfellow Deep Learning