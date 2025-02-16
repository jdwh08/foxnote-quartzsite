---
aliases:
  - Ordinary Least Squares
  - OLS
tags:
  - math/linear_algebra
  - ds/ml/linreg
edited: 2025-02-15T16:29
created: 2024-09-17T19:59
---
# Definition:
A type of [[Regression]], which estimate $y$ from $x_1 ... x_n$ using $\beta_0 ... \beta_n$ with form $y=\beta_0 + \beta_1 x_1 + ... + \beta_n x_n + \epsilon$. (i.e., linear)

- where $\beta_{1..n}$ are the regression coefficients [[Weights]]
- where $\beta_{0}$ is the intercept ([[Bias]])

---
# Notes:

##### Closed form solutions:
- $\beta_i = \frac{Cov(x_i, y_i)}{Var(X_i)}$ ([[Covariance]] divided by [[Variance]])
- (or in matrix form: $\beta = (X^T X)^{-1} X^T Y$)

#### Feature Engineering:
Note that our features $x_1...$ can be things like polynomials ($x^2)$ because it's linear with respect to our $\beta$s.

##### Assumptions for Linear Regression:
1. **Linear DGP**: True Data Generating Process is of the form $y = \beta_0 + \beta_1 x_1 + ... \beta_n x_n + \epsilon$. (LINEARITY)
2. **No Perfect Multicollinearity**: No feature $x_i$ can be written as the linear combination of other features $x_j$ and $x_k$ (AKA, the design matrix $X$ must have full [[Matrix Rank]].)
	1. Otherwise, we lack identification of the effect of $x_i$ as opposed to $x_{j,k}$.
3. **(weak) Exogenous Features**: Features $X$ are not correlated with errors $\epsilon$. 
4. **(strict) Exogenous Features**: Errors $\epsilon$ have conditional mean of zero: $E[\epsilon | X] = 0$.
	1. This implies that errors also have mean zero: $E[\epsilon] = 0$. ([[Law of Total Probability]])
	2. This implies that $Cov(\epsilon, X) = 0$ since [[Covariance]] definition as $E[XY] - E[X]E[Y]$
5. **[[Homoskedasticity]]**: Errors $\epsilon$ are constant across predictor values $X$.
	1. Technically, we don't need this assumption to do the operations and have the estimators $\hat{\beta}$ be unbiased; however, the errors $Var(\hat{\beta})$ will be underestimates.
6. **Independence of Errors / No Autocorrelation**: Errors $\epsilon$ are independent from one another between $i=1,...,n$, so $E[\epsilon_i \epsilon_j | X] = 0\ \forall\ i \neq j$
	1. We can also write the above two criteria as $Var(\epsilon | X) = \sigma^2 I_n$
7. (Optional): **Standard Normal Errors**: $\epsilon | X \sim \mathcal{N}(0, \sigma^2 I_n)$.
	1. Helpful for getting equivalence with [[Maximum Likelihood Estimation]] $\hat{\beta}_{MLE}$.
	2. This does NOT mean that $Y \sim \mathcal{N}$! For example, the X's could be different...

We can achieve #6 with [[Independent and Identically Distributed|iid]] observations of features and target variables.

#### Finite Sample Properties
Unbiased if strictly exogenous: $E[\hat{\beta} | X] = \beta$, $E[s^2 | X] = \sigma^2$
(TODO: Proof)

Linear Regression with all the properties above is the BLUE (BEST UNBIASED LINEAR ESTIMATOR) according to the Gauss-Markov Theorem, i.e., for all possible estimates of $\hat{\beta}$ which are un[[Bias|biased]], the ones from $\hat{\beta}_{OLS}$ have the lowest [[Variance]].

---
### From the Maximum Likelihood:
Recall that based on [[Uncertainty (Supervised ML)]], we see that for regression maximizing the log likelihood will minimize the squared error.