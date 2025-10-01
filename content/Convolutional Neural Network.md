---
aliases:
  - CNN
tags:
  - ds/ml/nn/cnn
  - todo/breakup
edited: 2025-09-30T19:34
created: 2024-03-19T22:06
---
# Definition:
A type of [[Artificial Neural Network|Neural Network]] which works by repeatedly finding small common local patterns and then aggregating them up.

Architectural design intended for image-based tasks.

---
# Notes:

## Layers
#### Convolution Layer
- A learnable small [[Matrix]] of weights which extracts local features from an image.
- Not fully connected! Too many pixels would create far too many parameters.
- For images, we believe features are **local spatially**, i.e., small patches of nearby images are good enough to get features like edges, colours, motifs (corners, etc).
- **Local features are combined together**, i.e., we do not randomly have corners appear nowhere; they are combined to make a larger object.
- **Local features can appear anywhere**, i.e., not tied to specific locations in an image!
- **Receptive Field** is the area that a given kernel can "see" from the original image.

- [[Convolution]] is multiplying matrix elements and then adding results.
	- Input is only a $K_1 \times K_2$ patch called **receptive field**
	- Reduces parameters needed to $(K_1 \times K_2 + 1) * N_{output}$
![[_Media/Excalidraw/Convolution.png|265x358]]
- Convolutions will represent specific *local features*.
	- We can share the same local feature extractor across the entire image! I.e., $N_{output}$ is less than full.
- If the image matches the convolution well, it will have a high value!
	- Note that convolutions can be any dimension so long as they are small.
- Due to our sliding mechanism, this has [[Equivalence Relation]] to translation: if we translate the input image, we also translate the resulting convolution the same way.
- Acts as an "infinitely strong prior" that our weights are shifted in space AND sparse except for some small receptive field.

###### Algorithm
1. Flip the starting kernel 180 degrees.
	1. Okay, so this is technically true if we're doing a [[Convolution]], but in practice for CNNs the kernel is learnable anyway, so flipping doesn't matter
	2. If we don't flip, this is technically the [[Cross Correlation]].
	3. Implementing the forward pass as a [[Cross Correlation]] means the [[Backpropagation]] will be a [[Convolution]]; vice versa.
2. Stride along the image.
	1. Take the [[Dot Product]] between the kernel and the image patch values.
	2. Save this to a value in the cell.
	3. Move the kernel along to the next value.

Practically speaking, this gives the following result for each cell:


..y_{r,c} = \sum_{a=0}^{k_r-1} \sum_{b=0}^{k_c-1} w_{a,b} \times x_{r \cdot s+a-p, c \cdot s + b - p}$



NOTE: Convolution can be thought of as a single [[Matrix]], of the form $y=Ax$. 
- We flatten $y$ and $x$ to be a single row-wise vector.
- The resulting shape of $A$ is $(|y|, |x|)$, where each row corresponds to one of the $y$ values and each column is either some $w$ weight from the kernel or 0 if does not apply.
- The $y$ are [[Dot Product]], i.e., [[Linear Combination]] of weights, since recall [[Matrix Product]] is basically just a bunch of dot products.

###### Hyperparameters
- Standard operation size is $(I_h - k_h + 1) \times (I_w - k_w + 1)$
	- Valid convolutions typically only exist when the full kernel is contained within the image.

- `Padding`: Add additional pixels around the entire image so that we truncate less of the convolution.
	- E.g., `padding=1` means we add a ring around the image that is one thick.
	- Padded pixels could be...
		- Zeros. A good all around choice since it is cheap, doesn't leak new information, and can be learned to be ignored.
		- Same colours as the neighbouring pixel.
	- New size: $(I_h + 2p - k_h + 1) \times (I_w + 2w - k_w + 1)$
		- Padding can either be **none**, be large enough so the output dimension is **same** as input dimension, or somewhere in the middle (usually best)
		- Zero padding (i.e., no padding at all) continuously shrinks output size.
		- Full padding makes a lot of the "edge" outputs be mainly padded.
	- This also means that the amount of padding to keep the new size the same as the old size is $p=(k-i)//2$

- `Stride`: moving more than one pixel at a time.
	- E.g., `stride=2` means that each time we move two pixels.
	- This can result in us skipping over pixels!
	- This can also result in us moving off the image, making the convolution invalid.
	- A cheap but crap way of doing #ds/dimension_reduction 
	- New size: $([I-k+2p]/s + 1)$

- We can also keep the CNN structure of local connections only BUT make it so that the weights of the kernel are different. 
	- "Locally connected layers" or "unshared" are completely different.
	- "Tiled convolution" are different after crossing some larger "tile" region.
	- We actually have detector unit learn based on each kernel pattern, which means the resulting max pool becomes invariant to transformation
		- Each kernel represents something detected (e.g., after a transformation)
		- We get the max of any of them.
		- Similar principle to [[Maxout]].

###### Multi-Channel Inputs
Typically images are RGB not just one value per pixel.
- We **take convolutions above and sum across input channels.**

###### Multi-Channel Outputs
We could also use multiple kernels! (aka, filters)
- These get saved as **multiple output channels, one kernel per input channel * output channel**.
- We **do convolution separately for each kernel.**
	- Weights Shape: `(out_ch, in_ch, k_height, k_width)`
	- Bias Shape: `(out_ch, )`
- Then we stack together at the output via concatenation to get to output channels.
- Number of parameters: $N_{kernel} * (k_w \times k_h * 3 + 1)$

###### Computation and Vectorization
To compute this faster, we convert each image patch and kernel to be a row [[Vector]]. 
We then do a huge [[Dot Product]] between these large [[Matrix]].
- This is essentially weight sharing.

#### Detector Layer
- This runs the convolution results through an [[Activation Function]], e.g., [[ReLU]], to add nonlinearity to results.

#### Pooling Layer
- Aggregates lower level convolution features together into a higher level
- Allows CNN to be robust (invariant) to small changes in location.
	- We care more about a feature existing than its exact position.
	- Acts like an "infinitely strong prior".
- Helps control size of inputs
	- E.g., multiple images with different pixels; can pool this into same number of regions.
- Output Dimension: $((I_h + 2p - p_h)//2 + 1) \times ((I_w + 2p - p_w)//2 + 1) \times ch_{out}$

###### Example Pooling Types
- **Max Pooling**: For each block of values, return the highest value.
- **Average Pooling**: Average for each block of values.
- [[L2 Norm]] of the block of values.
- **Weighted Average** where weights are based on distance from center.

## CNN Architectures
- Many stacks of Convolution --(nonlinear)--> Pooling(?)
	- Each stack hopes to extract features at higher levels of abstraction
- Continue until pooling results in a very small dimension. Then, flatten this and feed results into normal [[Artificial Neural Network|Neural Network]], e.g., MLP followed by [[Softmax]].

##### Properties
1. Deeper layers should represent deeper, more abstract features. E.g., edges -> shapes -> 3D surfaces
	1. Deeper layers also represent larger and larger convolution towers from shallower layers.
	2. It looks like a "pyramid".
2. For multi-channel outputs, nearby channels are typically similar to each other. They often share similar optimization journeys.

##### Evolution of CNN Architectures
- **LeNet** (1980s-1998): Yann LeCunn's basic CNNs for MNIST.
	- Translation invariance + small rotation and scale invariance.
- **[[AlexNet]]** (2012): one of the first working CNNs doing better on more general image classification (CIFAR10).
	- IMAGENET large enough scale to train complex enough CNN (1.2MM labels, 100 categories)
- **[[VGGNet]]** (2014): scale it up with a bunch of pre-made blocks! Replace larger convs. Three 3x3 conv are like a single 7x7 conv!
- **Inception / GoogLeNet** (2014): Have block route between kernels to choose best option.
	- Parallel filters at different scales: 1x1, 3x3, 5x5 convolutions and 3x3 max pooling.
	- Concatenate all outputs together, using padding to keep them all the same.
- **[[ResNet]]** (2015): have the linear layer learn the residual rather than the target for deeper networks.
- **ResNeXt** (2017): Combine ResNet with multiple routes within a single block.
- **DenseNet** (2017): Add longer connections to prior blocks, learn connection weights. Use transition layers in between to drop size and channels. 
- **MobileNet** (2017): Replace a single convolution with a "depthwise" convolution (across channels) and a "pointwise" convolution (1x1 kernel) for more efficiency.
- **Squeeze and Excite** (2017): Learn how important each channel is with [[Autoencoder]]-like structure. ("attention"). Globally pool each channel into a single 1x1. Then use a 2 layer MLP to learn channel importance weights. Use importance weights to recombine channels.
- **EfficientNet** (2019): Uniformly scale depth, width, and height together in an efficient way to be roughly optimal.
	- Depth: $\alpha^\phi$, width: $\beta^\phi$, resolution: $\gamma^\phi$
	- $\alpha \cdot \beta^2 \cdot \gamma^2 \approx 2$, all values $\ge 1$
- **Efficient Channel Attention Net** (2020): Learn how important each channel is but more efficiently. Global average pool into a 1x1 per channel. Then, do a convolution with some adaptive kernel size. Use importance weights to recombine channels.
- **ConvNeXt** (2020): Compete with Transformers by using larger 7x7 to mimic attention, then 1x1s which increase and then reduce channels. Reduce frequency of normalization and nonlinear layers. 

Other ways to do automatic CNN architectures:
1. [[Genetic Algorithm]] or [[Reinforcement Learning]] for learning structures
2. Starting with an overparameterized network and conducing [[Pruning]].
3. Can outperform, but also 

### Optimization with [[Backpropagation]]
How do we derive the [[Gradient]] of a convolution?
- Suppose we have 1 channel, one kernel, and add some padding to make the output shape the same.

Our [[Cross Correlation]] is thus:


..f(r, c) = (x*k)@(r,c) = \sum_{a=0}^{k_1-1} \sum_{b=0}^{k_2-1} x@(r+a, c+b)\cdot k@(a,b)$


##### Kernel
- Notice that each pixel-wise operation is just $xk$, so if we take $\frac{\partial y@(r,c)}{\partial k@(a, b)}$, we are simply getting the pixels $x@(r+a, c+b)$
- Since we are applying the kernel repeatedly throughout the image, it affects **everything** in the output.
	- Thus, we need to incorporate the gradients of ALL of the upstream gradients (pixels).
	- Sum across all pixels in image thanks to the [[Chain Rule]].



..\frac{\partial \mathcal{L}}{\partial k@(a,b)} = \sum_{r=0}^{H-1} \sum_{c=0}^{W-1} x@(r+a, c+b) \cdot \frac{\partial \mathcal{L}}{\partial y@(r,c)}$


- Notice that this equation is essentially a [[Cross Correlation]] between the upstream gradient $\frac{\partial \mathcal{L}}{\partial y}$ and the input image $x$!
	- Our upstream gradient basically functions as the kernel.
	- We do this until the shape is correct.
- What about **stride**?
	- Stride basically means we skip $s$ pixels between kernels.
	- Each output in the upstream gradient $y@(r,c)$ gets mapped to input pixel $x@(sr+a, sc+b)$ where $s$ is the stride.

##### Input $x$
This becomes the upstream gradient for the prior layer.
- Notice that multiple kernel positions touch the pixel.
- We slide the kernel from left-right, up-down. This means that us touching the pixel actually starts from the lower right corner and works its way down-up, right-left.
- We must flip the kernel, making this a [[Convolution]] instead of a [[Cross Correlation]].



..\frac{\partial \mathcal{L}}{\partial x@(r,c)} = \sum_{a=0}^{k_1-1} \sum_{b=0}^{k_2-1} \frac{\partial \mathcal{L}}{\partial y@(r-a, c-b)} \cdot k(a,b)$



## Data Augmentation
To ensure CNNs learn well, we can take each input (e.g., image), and then distort it slightly while still being recognizable (e.g., scale, rotate, flip, shear, etc.)
- Acts similar to [[Ridge Regularization]]?
- Prevents [[Adversarial Model Attack]]

## [[Model Bias]]
- Shape vs Texture Bias. IMAGENET trained CNNs are biased towards texture (Geirhos 2018)
	- E.g., if we use the shape of a cat but the texture of an elephant, CNN will predict elephant but humans predict cat.
	- Stronger models [[ResNet]] more biased towards texture than weaker ones [[AlexNet]]

---
# Examples:

### Example Kernel


..K = \begin{bmatrix} 
-1 & 0 & 1 \\
-2 & 0 & 2 \\
-1 & 0 & 1 \\
\end{bmatrix}$


We can see this kernel prefers to have dark values on the left, and light values on the right; i.e., this is a left-right edge feature detector.

----
# Source:
ISL Python
Goodfellow Deep Learning
GaTech DL