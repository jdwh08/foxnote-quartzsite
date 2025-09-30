---
aliases:
tags:
  - ds/ml/nn
edited: 2025-09-30T10:25
created: 2024-03-19T22:06
---
# Definition:
The process of training a [[Artificial Neural Network|Neural Network]].

---
# Notes:

### Key Takeaways
1. MONITOR EVERYTHING! 
	1. We can see loss and target curves for each iteration along with plots.
	2. [[Gradient]] statistics and characteristics
2. DO SANITY CHECKS
	1. Simplify yourself for these! E.g., small data, few iterations.
		1. If we can't [[Overfitting|Overfit]], that means learning capacity is probably too small.
	2. Bounds for loss: [[Log Loss]] goes from $[0, \infty)$
	3. Check initial loss at small weight values. 
		1. E.g., [[Log Loss]] should have $-\log (p)$ where $p=1/C$ classes roughly speaking
	4. Start without [[Regularization]], then add [[Regularization]] and confirm training loss does *correctly go up*
3. Plot Loss Curves
	1. [[Learning Rate]] can be too small if loss change is too small.
	2. [[Learning Rate]] can be too large if loss *increases over time (!)* or becomes NaN
		1. We are "bouncing out of the loss bowl local minima"
		2. Or... we can have forgotten the $\log$, or divide by zero, etc.
	3. Standard [[Bias-Variance Trade Off]] and [[Overfitting]] concerns apply
		1. NOTE: we can actually have train loss be higher than val!
			1. If we use [[Regularization]], regularization does NOT apply for val.
			2. Train loss is measured per iteration, while val loss is measured per epoch, so if we learn quickly the early train models are crappier.
4. [[Hyperparameter Tuning]]
	1. Learning Rate and Weight Decay are very sensitive! NEED to tune these well.
		1. Momentum is generally mostly okay.
	2. [[Grid Search]] and [[Bayesian Hyperparameter Optimization]] can both work.
		1. Bayesian is allegedly worse than a Grad Student with good intuition?
	3. Hyperparameters have interactions
		1. [[Normalization Layer|Batch Normalization]] and [[Dropout Regularization]] are apparently not good together?
		2. Batch size and [[Learning Rate]] tend to need to be coupled together.
5. Our KPI/Target Metrics vs [[Loss Function]] has a very weird relationship.
	1. KPI and Target metrics e.g., [[Accuracy]], are not [[Differentiable Function]]! Thus, we use [[Loss Function]] as a proxy.
	2. We can have ***very different behaviour*** between our target metric and loss!
		1. E.g., accuracy colours classes based on $\arg \max p(y_c|X)$, so even small changes in $w$ weights for $X$ can result in predicted label changes!
		2. E.g., [[Receiver Operating Characteristic]] and [[True Positive]]/[[False Positive]] curve has a very nonlinear relationship. Try to see why this is happening.

### Issues
1. **Ill Conditioning**: if we reach a point where at all cases our [[Loss Function]] increases after updating weights.
	1. We can think about this with the [[Hessian]] and [[Newton-Raphson]] method on the Loss Function:
	2. $f(x) \approx f(x_0) - \epsilon \nabla_x^T \nabla_x + 1/2 \epsilon^2 \nabla_x^T H_x \nabla_x$
	3. Notice that our loss function increases after taking the $\epsilon$ step if this value is positive.
2. **Local Optima**: We can get stuck at a local optima for the weights.
	1. In practice, this is mostly okay.
	2. En route to the local optima, we usually hit [[Saddle Points]] when the gradient is zero, instead of true local optima. [[Gradient Descent]] is usually able to alter some of the other weights to escape.
	3. Local optima are usually pretty good compared to the global. 
		1. Since [[Artificial Neural Network|Neural Network]]s are overparameterized, there is usually lack of **identification**, i.e., same NN can be expressed with multiple different combinations of parameters.
		2. Thus, some local optima are basically near-copies of the true global.
		3. **A Test:** Plot the [[Gradient]] over time. You'll often see the gradient actually has a large [[Norm]], i.e., not at a local optima.
	4. Alternatively, we might have some local hill in loss which hides a true minima, causing gradient descent to take a long and winding path.
3. **[[Saddle Points]] and Loss Plateaus**
	1. Saddle points have [[Hessian]] with both positive and negative, i.e., ways it is both a minimum and maximum.
	2. With enough parameters, most zero-gradient areas are actually saddle points! (it's rare to get all negative or all positive given enough...)
	3. [[Gradient Descent]] is able to escape these given enough time, or a good enough [[Optimizer]].
		1. NOTE: this does make [[Newton-Raphson]] and second-order methods hard though... ([Dauphin et al 2014]([[1406.2572] Identifying and attacking the saddle point problem in high-dimensional non-convex optimization](https://arxiv.org/abs/1406.2572)))
4. **Cliffs and Exploding Gradients**
	1. Sometimes the loss can be sharply nonlinear, like a cliff. This creates huge [[Gradient]] values.
	2. If we take too large of a step, this might have us vastly overshoot!
	3. Solution: [[Gradient Clipping]] as a regularization method.
5. **Long Term Dependencies**
	1. Suppose our [[Deep Learning]] network is very deep indeed. 
	2. Repeated transformations can make the gradient vanish or explode if it gets shrunk/grown too much.
	3. Solutions include good [[Weight Initialization]], architecture stuff like [[LSTM]], [[ResNet]], etc.
6. **Gradients are Estimates**
	1. Particularly for [[Stochastic Gradient Descent|Minibatch Gradient Descent]], the gradients are estimates of truth.
	2. Alternatively, our [[Loss Function]] might be too difficult and not have a solvable gradient.

### Data Preprocessing
1. Always do a standard [[Train Test Split]] with VAL for monitoring overfit and hyperparameters.
	1. Cross Validation possible for small data.
2. You can add [[Synthetic Data]] for regularization?

### [[Weight Initialization]]
Weight initialization is very useful so that **our starting place** has good gradient flow leading to a strong local minima.
- Impacts statistics of result in layer (e.g., whether we grow inputs, moving values into saturated regions of [[Activation Function]], etc.)

**Example Bad Weight Initialization Strategy**
1. Set everything to be [[Uniform Distribution]].
	1. This is NO GOOD be because we lose identification between the neurons.
	2. Equivalent to "shared weights" since weights move identically after optimization.
2. Set weights to be too large/small
	1. If we set weights to be too small initially, we can have each layer continuously shrink dimension until we have no [[Gradient]].
	2. If we set weights to be too large initially, we have saturation
3. Set weights to radically adjust variance.
	1. If our output variance is significantly different from our input variance, then we might have some explosion / decay which makes learning more difficult.

**Example Typical Weight Initialization Strategies**
1. Set weights to small [[Normal Distribution]], e.g., $\mu=0, \sigma=0.01$.
	1. Small weights to prevent having strong expression of feature importance
2. [[Xavier Weight Initialization]].
	1. Set input [[Variance]] to be the same as output [[Variance]] after layer
	2. This ensures we aren't crushing/exploding values.
	3. Equivalent to a [[Uniform Distribution]]:
	4. $\sim \mathcal{U}(-\frac{\sqrt{6}}{\sqrt{n_j+n_{j+1}}}, +\frac{\sqrt{6}}{\sqrt{n_j+n_{j+1}}})$, where $n_j$ is [[Fan In]] and $n_{j+1}$ is [[Fan Out]].
3. [[Kaiming Weight Initialization]].
	1. Modify Xavier for ReLU and non-symmetric functions by noticing that half of the inputs are "killed" and thus have zero variance.
	2. This means we can just us the fan-in amount and be okay.
4. [[Bias Initialization]]:
	1. Typically we can set this to be zero.
	2. Bias in output layers might be chosen so that they correspond to initial statistics.
		1. E.g., if we have a very common class, might choose it to have high bias.
	3. For [[ReLU]], might be okay to set bias to 0.01 to have neurons fire. Doesn't work well with Random Walk initialization.
	4. For [[LSTM]], we probably set the gate bias for forgetting to be 1. 

### Weight Transformation Strategies
These are useful to get us to continue having good information flow without exploding the variance.
- [[Normalization Layer]]: subtract the mean, divided by standard deviation, etc.
	- Can be done per-feature.
	- Can be done per-batch.
	- Can be done per-layer.
- Mean Normalization: Remove the mean of the input to "center" it.
	- Need to be careful for inputs. E.g., if we are using images, we could normalize within the image, or normalize within each pixel.
- [[Z-Score]] like standardization: Remove the mean to center it AND divide by [[Standard Deviation]] to get preset variance.
- [[Data Whitening]], e.g., [[Principal Component Analysis|PCA]]. 
	- Do the above but also remove the covariance matrix.

### [[Optimizer]]s for Neural Networks

##### [[Backpropagation]] and Weight Based
This is the dominant view.
- [[Gradient Descent]] and [[Stochastic Gradient Descent]] for optimizing weights for functions which have gradients.
	- Adding momentum to get out of holes.
- [[Adagrad Optimizer]], [[RMSProp Optimizer]] for estimating the [[Hessian]] in a Pseudo-[[Newton-Raphson]] method.
- [[Adam Optimizer]], [[AdamW Optimizer]] for adding momentum to the Psuedo-Newton stuff above.
- [[Lion Optimizer]]
- [[Muon Optimizer]]

##### Architecture / Structure Based
This optimizes the activation functions and connections of a network instead of the weights.
- [[Genetic Algorithm]] for optimizing structures / architectures of Neural Networks?
	- E.g., [[Weight Agnostic Neural Network]] which has weights fixed and updates structure alone.

### [[Regularization]]
Helps to control overfitting and allow for generalization.

---
# Examples:
Examples

----
# Source:
GaTech DL
[A Disciplined Approach to NN Hyperparameter Tuning (Smith 2018)]([1803.09820](https://arxiv.org/pdf/1803.09820))
