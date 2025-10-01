---
aliases:
tags:
  - cs/dsa/ringbuffer
edited: 2025-09-30T21:59
created: 2024-03-19T22:06
---
# Definition:
Similar to an [[ArrayList]], but we have specific indices for `head` and `tail`. This means that head does NOT have to be at index 0!

![[RingBuffer.png]]

---
# Notes:
Notes

---
# Examples:
Rust's VecDequeue is a double-ended ring buffer.

**Log Batch Handler**
Suppose we have a service which needs to handle batches of logs. Logs need to ***maintain order***. As we *write logs*, we keep *getting new logs*! We also need to make sure that we don't overwrite any pre-existing logs that aren't used.


----
# Source:
Source