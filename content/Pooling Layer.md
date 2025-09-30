---
aliases:
tags:
  - ds/ml/nn
  - ds/ml/nn/cnn
edited: 2025-09-30T14:21
created: 2024-03-19T22:06
---
# Definition:
A type of operation for [[Artificial Neural Network|Neural Network]]s which applies a function to convert multiple input values into a single representative value.

---
# Notes:

### Types
##### Max Pooling
- Get the maximum value within the input.
- Set output to this max value.
- [[Gradient]] only flows to the max value.

##### Mean Pooling
- Take the mean of the values within the input.

---
# Examples:
- For [[Convolutional Neural Network|CNN]]: helps ensure the output is robust against small input changes.
	- Also useful as representation for entire kernel channels, e.g., with Global Mean Pooling.
	- When 

----
# Source:
GaTech DL

---
# Flashcards:
Q?A
