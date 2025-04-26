---
aliases: 
tags: []
edited: 2025-04-01T17:55
created: 2024-03-19T22:06
---
# Definition:
Definition

---
# Notes:

### [[Vision Transformers]] (ViT)
- Split image into "patches" which can be embedded and passed into a transformers.
- Good result after applying an [[Perceptron|Multilayer Perceptrons]] afterward.
- [[CNN]] assumes locality which might be bad
- Example: CLIP model image encoder for OpenAI vision series.
	- Contrastive learning: image and text pairs. Model trains to align the encoder representations for the image and text.
- Can be combined with text:
	- Add image tokens before text tokens, and then have the model output.


Example use cases for ViTs:
- Functional Magnetic Resonance Imaging: FMRI provides a sense of the bloodflow used at each voxel of the brain.
	- Gives a high dimensional sense of the activity, but this is too high level.
	- People used to high level average, and then apply [[Correlation (Pearson)|Correlation]] matrix for diagnosis.
		- Early ML models would train on the correlations for regression / correlation / graph analysis.
		- Graph stuff: Brain Functional Networks break down the brain into smaller subnetworks that have tasks.
- Computer Vision Transformers work similarly: we take ROI averaged patches, mask a portion, and have the model train as self-supervised data. (analogous to language masking).
- A ViT then provides dense representations that can be used for tasks, e.g., prediction, and then do analysis of brain networks.
- This requires [[Cross Attention]]: apply [[Attention Mechanism]] to two different sequences.
- Can then insert the learned token for Parkinson's or some other disease to get brain output predictions.

---
# Examples:
Examples

----
# Source:
Source