---
aliases:
tags:
  - ds/ml/transfer_learning
edited: 2025-09-28T23:30
created: 2024-03-19T22:06
---
# Definition:
A [[Machine Learning]] paradigm where a model trained for one task $A$ is useful for other task $B$ if the tasks are related to each other.

---
# Notes:

### Types
- [[Semi-Supervised Machine Learning]]: Single Labelled input $\rightarrow$ single unlabelled output, with no shift.
- [[Domain Adaption]]: Single Labelled input $\rightarrow$ single unlabelled output, with a non-semantic shift (i.e., keep meanings).
- [[Domain Generalization]]: Single Labelled input $\rightarrow$ unknown output, with a non-semantic shift.
- [[Cross Category Transfer]]: Multiple Labelled input $\rightarrow$ single unlabelled output, with a semantic shift.
- [[Cross Category Transfer]]: Multiple Labelled input $\rightarrow$ single unlabelled output, with a semantic shift.
- [[Few-Shot Learning]]: Single labelled input $\rightarrow$ few labelled output, with a semantic shift
- [[Self Supervised Machine Learning]]: Single unlabelled input $\rightarrow$ many labelled output, with both semantic and non-semantic shifts.

### Methodology
For [[Artificial Neural Network|Neural Network]], transfer learning often involves stacking a network on top of another network. Synthetic "deep network".
- As such, **transfer learning only works well when the first network preserves useful information for the second network**.
- If we destroy information, or add too much noise, it actually can end up worse!

1. Train a large scale model on a large labelled dataset, hopefully similar to what you're trying to do.
2. Freeze the large model weights. Initialize some new weights in the last layer (e.g., add a classifier head)
3. Train the parameters on the new, small task you want to transfer to.
	1. Can update all the weights
	2. Can update only some weights of interest (e.g., [[Parameter Efficient Fine Tuning]])
		1. Reduces the number of parameters you need to learn.
		2. Helps prevent [[Catastrophic Forgetting]] when we unlearn everything.

You'll notice this is the basis for [[Model Fine Tuning]] (!)

### Properties
- Often ***works extremely well!?***
- Doesn't work as well when source task and target task are very different. With enough data, you're better of just training on the target.
- If there's enough data in the target task, then this often just is faster convergence. Rethinking ImageNet Pre-training ([He et al 2018](https://arxiv.org/abs/1811.08883))
- Transfer Learning scales really well with data! Most applications have not reached the [[Statistical Learning|Irreducible Error]] area.

### Alternatives
- [[Meta Learning]]: teaching a model how to learn. Model is trained on many tasks to uncover common patterns. Model is tested on novel tasks, to see how well and quickly it adapts.

---
# Examples:
- [[Convolutional Neural Network|CNN]] classification: Features learned for classifying 1000 objects (IMAGENET) often work well for a new categories!
	- Other tasks include classification for objects, scenes, birds, flowers, human attributes, Paris buildings, Oxford buildings, etc.
	- from CNN Features Off the Shelf ([Razavian et al 2014](https://arxiv.org/abs/1403.6382))
- [[Taskonomy]] for [[Convolutional Neural Network|CNN]] and image tasks.

----
# Source:
GaTech DL