---
aliases: 
tags:
  - ds/ml/nn/rnn
edited: 2025-04-26T14:13
created: 2024-03-19T22:06
---
# Definition:
A type of [[Artificial Neural Network|Neural Network]] used for learning sequential data, e.g., [[Time Series]], audio, language, etc. 

---
# Notes:

#### Architecture
- Input sequence $X = {X_1, X_2, ..., X_L}$ where **order matters**
- We also have an internal scratchpad called a "hidden layer": $\{A_\mathcal{l}\}_1^L = {A_1, A_2, ..., A_L}$
- Process inputs one-at-a-time:
	- Take in input $X_i$ and prior hidden layer activation $A_{i-1}$ to calculate the new hidden layer value $A_i$
	
$$A_{lk} = g(w_{k0} + \sum_{j=1}^p w_{kj} X_{lj} + \sum_{s=1}^K u_{ks} A_{l-1, s})$$
- where g is our [[Activation Function]]
- $w_{kj}$ are **shared weights** for the new input data $X_L$ in layer $l$. 
	- Full matrix dimension: $K \times (p+1)$ where $p = |X_L|$ dimension.
- $u_{ks}$ are weights for for $A_{i-1} \rightarrow A_i$
	- Full matrix dimension: $K \times K$

- Finally, take all the hidden layer values $A_1 ... A_L$ and use them to make  predictions $\hat{Y}_L$

$$O_L=\beta_0 + \sum_{k=1}^K \beta_k A_{lk}$$
- where $\beta$ is the weight for each layer's activation.

![[RNN.excalidraw.png.png]]


Loss function is usually [[Mean Squared Error|MSE]] for the final output $O_L$ against the true $Y$. We ignore all the intermediate output predictions.

#### Connection to [[Autoregressive Linear Model]] (AR)
- In AR, we fit $\hat{y}_t = \beta_0 x_{t-1} + ... + \beta_l x_{t-l}$
	- AR treats all inputs in the sequence the same (i.e., flat), unlike RNN's nested structure
	- RNN also has bias transformations into hidden layer $A$ plus nonlinear [[Activation Function]].

---
# Examples:

- [[LSTM]]
- [[Transformers]]

----
# Source:
Source