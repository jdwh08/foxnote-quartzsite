---
aliases: 
tags:
  - finance/technical
edited: 2025-02-25T18:51
created: 2024-03-19T22:06
---
# Definition:
A [[Technical Analysis]] indicator based on changes in price over time.

$$\text{simple momentum}_t = p_t / p_{t-n} - 1$$
```python
momentum = p[t] / p[t-1] - 1
```
where $n$ is the time range (e.g., 5 days). 

Strong momentum over some time range:
- $-50\% \text{ to } 50\%$ are common.

---
# Notes:
Notes

---
# Examples:
Examples

----
# Source:
Source