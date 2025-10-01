---
aliases:
  - VAE
tags:
  - ds/ml/nn/autoencoder
  - ds/dimension_reduction
edited: 2025-09-26T14:22
created: 2024-03-19T22:06
---
# Definition:
A type of [[Autoencoder]] which learns a [[Probability Distribution]], 
- [[Embeddings]] bottleneck is a **[[Sample Mean]] Vector** and **[[Standard Deviation]] Vector**
- Learned distribution should be close to input data AND a standard [[Normal Distribution]]

---
# Notes:

### Training
Loss function consists of the [[Reconstruction Loss]] from the [[Autoencoder]], along with a [[Kullback-Leibler Divergence|KL Divergence]] to keep it close to a standard [[Normal Distribution]].



\mathcal{L}(\theta, \phi; x, z) = E_{q_{\phi} (z|x)}\left[ \log p_\theta(x|z) \right] - D_{KL}(q_\phi(z|x)\ ||\ p(z))$



- This is learning a [[Probability Distribution]] $E_{q_\phi}$, so we use the [[Expected Value]]. 
- We also must do [[Random Sampling]] from the distribution to feed to our **decoder** 

##### [[Backpropagation]] and Reparameterization Trick
- [[Random Sampling]] is not [[Differentiable Function]]! How do we deal with this?
- Set our $z = \mu + \sigma \odot \epsilon$ with $\epsilon \sim \mathcal{N}(0,1)$.
	- We learn both $\mu$ and $\sigma$.
	- $\epsilon$ is a fixed "random node", and does NOT need to be learned via backprop.

### Applications
- Mostly same as [[Autoencoder#Applications]]
- [[Reinforcement Learning]] as a compressed representation of the input space

### Improvements
- **Disentangled Variational Autoencoders**: learn some $\beta$ mixing parameter which controls weight on KL loss term.
	- If this is high, acts like [[Regularization]] by discouraging dimensions which don't improve [[Reconstruction Loss]] enough. Similar to [[Lasso Regularization]].
	- Moving around in [[Latent Space]] aligns more closely to changing a single meaningful input feature, e.g., rotation or height.


---
# Examples:
Examples

----
# Source:
[Arxiv Insights Variational Autoencoders]([youtube.com/watch?v=9zKuYvjFFS8](https://www.youtube.com/watch?v=9zKuYvjFFS8))
