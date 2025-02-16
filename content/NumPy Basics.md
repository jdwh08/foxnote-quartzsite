---
aliases: 
tags:
  - cs/python/numpy
  - ds/ml/ML4T
edited: 2025-02-15T16:34
created: 2024-03-19T22:06
---
# Notes:

NumPy is a N-dimensional numerical array library in Python which is fast because it handles operations efficiently in C++.

```python
import numpy as np

# Create numpy N-Dimensional Array
arr = np.array(<your iterable here>)
# Or with pre-set values existing in memory
np.empty(5)  # 5 vector
np.empty((5,4))  # 5 row 4 col matrix; add more for 3d+
# All Ones or Zeros
np.ones() or np.zeros()
# Random
np.random.seed(339)  # seed prng <depricated, use a generator instead!>
np.random.random((5, 4))
np.random.normal(mean=50, stdev=10, size=(5, 4))
np.random.randint()  # random sampling integers

# specify datatype (dtype)
np.ones((5,4), dtypes=np.int_)

# NumPy indexing (it's like pandas iloc)
nd1[row, col]  # note: zero-indexed, (starts at 0)
nd[0:3, 1:3]  # select ranges w/ :, 3 is not included
nd[:, 3]  # all rows, col 3
nd[-1, -2]  # last row, second to last col
nd[:, 0:3:2]  # start:stop:step style -> (0, 2)

# You can also assign via indexing, so long as the shapes are the same.
a = np.random.rand(5)
a[[4, 5]] = [4, 4]
# Note that we can also use an array for indexing
a[np.array([1,1,2,3])]
# Or boolean arrays
a[a < a.mean()]

# Get properties
a.shape  # -> (5, 4) for 5row, 4col. you can index this
a.size  # num of elements in ndarray
a.dtype  # data type

# Maths
a.sum()  # total sum
a.sum(axis=0)  # sum across rows
# min(), max(), mean(), etc. have same interface
# Use these instead of looping! Significantly faster

a + a, a*a  # elementwise
np.dot()

# Get index of max/min/...
a.argmax()
```

---
# Examples:
Examples

----
# Source:
Source