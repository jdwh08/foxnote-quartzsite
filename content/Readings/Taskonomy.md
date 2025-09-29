---
aliases:
tags:
  - readings
  - ds/ml/nn/cnn
  - ds/ml/transfer_learning
edited: 2025-09-26T13:16
created: 2024-01-07T14:36
reading creator:
reading date: 2025-09-23
---
# Source:
[taskonomy_CVPR2018.pdf](http://taskonomy.stanford.edu/taskonomy_CVPR2018.pdf)
[Best Paper CVPR2018 - Taskonomy - Disentangling Task Transfer Learning](https://www.youtube.com/watch?v=9mdCWMVAMLg)


---
# Summary:
[[Convolutional Neural Network|CNN]] has lots of different tasks. they aren't explicitly mapped but we should

map out explicit CNN image tasks and how they feed into each other
- fully computational: "affinity" matrix for whether results of A can be done via training for some other task B
- goal is graph of source-target tasks which maps out transfers between tasks
- use human buildings with real life meshes as data + knowledge distillation for labelling
- encoder-decoder (small decoder, large encoder) to learn task
- then train transfer task which is function from encoder-decoder (task specific) vs true label as "affinity"
	- shallow CNN with tiny data; deliberately small because transfer should be easy
	- also train up to 5 best sources as inputs to one output; select best via beam search
	- multi step transitive was not better
	- normalize transfers based on ratio of % of test set which transferred better from a->c vs b->c, then rank, then get uh eigenvectors. this is called analytical hierarchical process from operations research
- finally gets graph of transfers
- gain: improvement of transfer over small training set 

- resnet50 for cnn

- it uh basically looks like the transfer goes from simpler tasks to more complicated tasks, and that we have clear segmentation between 2d stuff, 3d stuff, semantic content stuff.

- we should be doing transitions from baseline layers to more important layers.

---
# Notes:
My notes on the reading.