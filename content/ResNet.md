---
aliases:
  - Skip Connections
  - Residual Connections
tags:
  - ds/ml/nn
edited: 2025-09-28T22:33
created: 2024-03-19T22:06
---
# Definition:

A connection in a [[Artificial Neural Network|Neural Network]] which allows for information to bypass layers.
1. We save our input $x$
2. We learn the residual $\mathcal{F}(x)$ so $x+\mathcal{F}(x) = \hat{y}$

Most useful in [[Deep Learning]] to prevent training signals becoming weaker as [[Backpropagation]] goes through many layers.

In case of shape mismatches (e.g., when downsampling), technically we also do the same for $x$ so it's not quite the original input. This downsampling can be learned though.

---
# Notes:

### Motivation
1. [[Deep Learning]] works with ImageNet (2012) via [[AlexNet]]! We want to go deeper.
2. We started seeing issues with deep [[VGGNet]] or InceptionNet architectures where **larger** models would do **worse**!
	1. Inability to properly train.
3. [[Deep Learning]] networks had vanishing/exploding gradients (or ill conditioning) mostly solved via [[Normalization Layer|Batch Normalization]].
4. New issue arises: deeper networks *performing worse on **training** set than shallow networks!*
	1. Shouldn't be possible, since we can do at least as well by taking the shallow network and adding a bunch of identity layers.
5. Solution: have the new layers learn the [[Residuals]]! 
	1. Set the layer to learn $\mathcal{F}(x) = \mathcal{H}(x) - x$, where $\mathcal{H}$ is the true hypothesis.
	2. When inference, add back the $x$ value: $\hat{y} = \mathcal{F}(x) + x$.
	3. Equivalent to having our $x$ value "skip over" the layer.
6. Allows for us to train deeper networks without forgetting the input.
7. Skip connections worked best on IMAGENET, COCO, CIFAR-10, etc.

### Rationale
1. We can think about this as only modelling the $\Delta$s between states.
	1. This is MUCH EASIER to store and keep track of.
	2. Reminds me of [[Git]]'s version history.
2. We can think about this like solving a [[Differential Equations]]
	1. Our best prediction $x_{t+1}$ is $x_t + \delta(x_t)$.
	2. We spend our energy learning $\delta(x_t)$
	3. This is equivalent to [[Euler Integration]]! We can look at stability etc.
		1. Euler is kinda crappy. We can do better with [[Ordinary Differential Equation]] (i.e., [[Differential Equations]] on only one variable). We can model $\frac{d}{dt} x = f(x)$ instead as a [[Neural ODE]] which has better resolution on flow.

### Properties
- Visualizing the Loss Landscape of Neural Nets by ([Li et al 2018](https://arxiv.org/abs/1712.09913)) shows that the loss surface with skip connections is much better behaved, i.e., smoother with clear minima.
- Residual Connection allows for learning "do nothing" as baseline. Also means backprop is very useful.

### Methodology
1. Obtain input as output from prior layer. Save this as $x$.
2. Run through your [[Multilayer Perceptron|MLP]] and [[Activation Function]]s to get a $\mathcal{F}(x)$.
3. Add back the original layer input to get $\mathcal{F}(x) + x$

##### Ways to Add the Original Layer Input
Notice that if our output shape for $\mathcal{F}(x)$ is different from our input shape $x$ (e.g., using stride to downsample?) then we need to handle shapes.

1. **Simple Addition**: Straightforward: just add. Only works if the shapes are the same. `output += torch.nn.sequential(x)`
2. **Stride Downsampling**: This was used in the original ResNet paper. Downsample using stride, and replace with zero values. Add enough channels to match the $\mathcal{F}$ shape.
	1. Today, not done.
```python
LambdaLayer(  # applies a self.lambda() to x in forward pass.
	lambda x: F.pad(
		x[:, :, ::2, ::2],  # stride 2
		# add channels to match output shape
		(0, 0, 0, 0, outdim // 4, outdim // 4),
		"constant",
		0,  # zero values
	)
)
```
3. **Learned Downsampling**: Use a 1x1 convolution with weights to learn appropriate mixing behaviour. Add enough channels to match $\mathcal{F}$ shape.
```python
nn.Sequential(
	nn.Conv2D(
		input_channels,
		output_channels,
		kernel_size=1,
		stride=stride,
		bias=False,
	),
	nn.BatchNorm2D(
		output_channels
	)
)
```


### ResNet Architecture
##### ResNet Basic Block
The original paper had a ResNet block for images (CIFAR) with [[Convolutional Neural Network|CNN]]:
0. Save the original $x$. We use the rest to learn the residual $\mathcal{F}(x)$.
1. 3x3 [[Convolution]]
	1. Stride 2 and pad 1 if going down a feature level.
	2. NOTE: stride 1 and pad 1, means input and output dimensions are unchanged.
	3. We could... use this for classification by setting `stride=2` and using more convolution layers.
	4. E.g., suppose we have input of `(batch, 16 ch, 32x32 img)`. We can take a stride-2 slicing across the image and compensate by doubling the channels to get `(batch, 32 ch, 16x16 img)`.
2. [[Normalization Layer|Batch Normalization]]
3. [[ReLU]]
4. 3x3 Convolution, with stride 1 and pad 1
5. [[Normalization Layer|Batch Normalization]]
6. Add in the original $x$
7. [[ReLU]]

These blocks were stacked to go from original `224x224` image crops. Initial pre-processing was a 7x7 convolution and pool to halve via a `stride=2`, bringing us to `224/2/2=56`. We repeat this `stride=2` with the start of each block and there are `4` blocks.
- 224 -> 112 after 7x7 stride 2
- -> 56 after pool stride 2 
- -> BLOCK ONE at 56 (has 3 ResNet blocks inside) but with 
- -> BLOCK TWO at 28 (has 3 ResNet blocks inside)
- -> BLOCK THREE at 14 (has 5 ResNet blocks inside)
- -> BLOCK FOUR at 7 (has 2 ResNet blocks inside)
- -> average pooling to 1

BasicBlock applies for small ResNets, e.g., ResNet 18, 34.

##### ResNet Squeeze Block
1. Save the original $x$. We use the rest to learn the residual $\mathcal{F}(x)$.
2. 1x1 [[Convolution]]; 256 input channel -> 64 output channel. "Squeeze".
3. [[Normalization Layer|Batch Normalization]]
4. [[ReLU]]
5. 3x3 [[Convolution]]; stride 1 pad 1
	1. NOTE: if reducing image size, stride 2 pad 1 to "halve" the image. This is better than on the initial conv like in ResNet paper.
	2. We would also use 1x1 projection with stride 2 on the $x$ path.
6. [[Normalization Layer|Batch Normalization]]
7. [[ReLU]]
8. 1x1 Convolution; 64 input channel -> 256 output channel.

This acts a little like an [[Autoencoder]] by squeezing input down into an encoded space and then expanding it back up.
- More parameter efficient.

SqueezeBlock is done for larger ResNets, e.g., ResNet 

### Learnings Improved Compared to [[AlexNet]]
We can see some of the evolution of CNN design from AlexNet (2012) to ResNet (2015):
1. Smaller initial kernels. We now do 3x3 instead of 7x7.
2. Deeper layers. We can stack more CNN layers together to learn the feature aggregation rather than doing it quickly with a large kernel.
3. Squeeze!

Still have the following characteristics:
1. Power-of-two output channels: these fit better in memory and for computation.

### Issues and Alternatives
1. One path for the residual. It turns out like in **[[ResNeXt]]** that summing across multiple convolution "paths" to learn the residual gives better performance. Paths are identical.
2. We can use deeper connections to be more parameter efficient like in **DenseNet**.
3. We can make this more efficient by...
	1. Using one kernel per input channel and mixing across output channels with a 1x1 convolution. **MobileNet**.
	2. Learning the optimal mix of depth (channels), width (paths), and kernel resolution in **EfficientNet**.
4. What about learning how important the residual information is as opposed to the original? We can add a sigmoid for this, e.g., in **Squeeze-and-Excite**
	1. This uses a 1x1 Global Average Pool for the residual side... hm.
5. We can be inspired by [[Transformers]] to create **[[ConvNeXt]]**
	1. Use large starting kernels (longer contexts analogue)
	2. Use [[Layer Normalization]] (and only one of them per block)
	3. Use more modern [[Activation Function]]s like [[GeLU]] (and only one of them per block)

---
# Examples:
Examples

----
# Source:
[Deep Residual Learning for Image Recognition](https://arxiv.org/pdf/1512.03385) (He et al., 2015a)
Bruton Lectures [Residual Networks (ResNet) Physics Informed ML](https://www.youtube.com/watch?v=w1UsKanMatM)
