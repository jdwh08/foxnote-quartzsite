---
aliases:
  - Ordinary Least Squares
  - OLS
  - Polynomial Regression
tags:
  - math/linear_algebra
  - ds/ml/linreg
  - todo/breakup
edited: 2025-09-10T22:25
created: 2024-09-17T19:59
---
# Definition:
A type of [[Regression]], which estimate $y$ from $x_1 ... x_n$ using $\beta_0 ... \beta_n$ with form $y=\beta_0 + \beta_1 x_1 + ... + \beta_n x_n + \epsilon$. (i.e., linear)

- where $\beta_{1..n}$ are the regression coefficients [[Weights]]
- where $\beta_{0}$ is the intercept ([[Bias (estimator)]])
- where $\epsilon$ is the residual (difference between true and predicted).

---
# Notes:

##### Closed Form Solution:
- $\beta_i = \frac{Cov(x_i, y_i)}{Var(X_i)}$ ([[Covariance]] divided by [[Variance]])
- (or in matrix form: $\beta = (X^T X)^{-1} X^T Y$)
	- Note that these equations for $\beta$s from $x$ and $y$ are the **Normal Equations**

##### From the Maximum Likelihood:
Based on [[Uncertainty (Supervised ML)]], we see that for regression maximizing the log likelihood will minimize the squared error.

##### Calculus
Constant Value Derivation shows we minimize [[Residual Sum of Squares|Sum of Squared Residuals]] when using the expected value.:


..f(x)=c; E[c]=\sum_{i=1}^n (y_i-c)^2; \frac{\partial E}{\partial c}=\sum_{i=1}^n 2(y_i-c)\times-1 =0; y_i=c$



Suppose we want to do regression of the form $c_0 + c_1 x + c_2 x + c_3 x + ... = y$.
We can convert this into matrices:


..\begin{bmatrix}
1 & x_0 & x_0^2 & ... \\
1 & x_1 & x_1^2 & ... \\
1 & x_2 & x_2^2 & ... \\
\end{bmatrix}
\begin{bmatrix}
c_0 \\ c_1 \\ c_2 \\
\end{bmatrix}
\approx
\begin{bmatrix}
y_0 \\ y_1 \\ y_2
\end{bmatrix}
\rightarrow
\textbf{X} \beta \approx \textbf{y}
\rightarrow \textbf{X'} \textbf{X} \beta = \textbf{X'} \textbf{y}
\rightarrow \beta = (X' X)^{-1} X' Y
$


where $(X'X)^{-1} X'Y$ is the [[Matrix Pseudoinverse]], aka "standard over-constrained" [[Least Squares]] answer.

---
#### Feature Engineering:
For categorical data, we generally use [[One-Hot Encoding]] to convert the categories into a list of features $x_i \in (0, 1)$. This allows us to estimate some $\beta_i$ which is present when $x_i=1$

For interactions (i.e., ways for a feature $x_1$ to change how much a different feature $x_2$ impacts $y$), we can create new interaction terms:
- $Y=\beta_0 + \beta_1 x_1 + \beta_2 x_2 + \beta_3 x_1 x_2 + \epsilon$.
- Note that $x_1 x_2$ interaction term!

Note that our features $x_1...$ can be things like polynomials ($x^2)$ because it's linear with respect to our $\beta$s.

---
#### Feature Selection:
- We can use [[One Sample T-Test]] to check if a single $\beta=0$.
- We can use an [[F-Test]] for linear regression when comparing smaller models to larger models.
- [[Mallow's Cp]]
- [[Akaike Information Criterion]]
- [[Bayesian Information Criterion]]
- [[Adjusted R-Squared]]

The number of possible [[Combinations]] for $p$ features is $2^p$. This can be **a lot**. Thus, we only test subsets:
- [[Forward Selection]]: We start with an empty model that only has intercept. We add a new feature from $p$ and check the metrics. We add the best feature to the model until we hit a stopping rule.
	- Because this is a [[Greedy Algorithm]], we might add features that become redundant.
- [[Backward Selection]]: We start with all variables in the model. We remove the variable with the variable with the largest [[P-Value]] in the [[One Sample T-Test]]. We continue until a stopping rule is reached.
	- NOTE: We cannot use this if our number of features is more than observations: $p$ > $n$ because then we can't create the entire model due to lack of rank.
- [[Mixed Selection]]: This is cursed. We add features as in [[Forward Selection]]. After adding each feature, we check for if there are any formerly added features which now have high [[P-Value]], and remove them.

---
##### Assumptions for Linear Regression:
1. **Linear DGP**: True [[Data Generating Process]] is of the form $y = \beta_0 + \beta_1 x_1 + ... \beta_n x_n + \epsilon$. (LINEARITY)
2. **No Perfect Multicollinearity**: No feature $x_i$ can be written as the [[Linear Combination]] of other features $x_j$ and $x_k$
	1. Otherwise, we lack identification of the effect of $x_i$ as opposed to $x_{j,k}$.
	2.  The design matrix $X$ must have full [[Matrix Rank]] to have a [[Matrix Inverse]].
3. **(weak) Exogenous Features**: Features $X$ are not [[Correlation (Pearson)|correlated]] with errors $\epsilon$. 
4. **(strict) Exogenous Features**: Errors $\epsilon$ have conditional [[Expected Value]] of zero: $E[\epsilon | X] = 0$.
	1. This implies that errors also have mean zero: $E[\epsilon] = 0$. ([[Law of Total Probability]])
	2. This implies that $Cov(\epsilon, X) = 0$ since [[Covariance]] definition as $E[XY] - E[X]E[Y]$
5. **[[Homoskedasticity]]**: Errors $\epsilon$ are constant across predictor values $X$.
	1. We don't need this assumption to have the estimators $\hat{\beta}$ be [[Bias (estimator)|Unbiased (estimator)]]; however, the errors $Var(\hat{\beta})$ will be underestimates.
6. **Independence of Errors**: Errors $\epsilon$ are [[Independent|independent]] from one another between $i=1,...,n$, so $E[\epsilon_i \epsilon_j | X] = 0\ \forall\ i \neq j$
	1. We can also write the above two criteria as $Var(\epsilon | X) = \sigma^2 I_n$
	2. We can achieve this with [[Independent and Identically Distributed|IID]] observations of features and target variables.
7. (Optional): **Standard [[Normal Distribution|Normal]] Errors**: $\epsilon | X \sim \mathcal{N}(0, \sigma^2 I_n)$.
	1. Helpful for getting equivalence with [[Maximum Likelihood Estimation]] $\hat{\beta}_{MLE}$.
	2. This does NOT mean that $Y \sim \mathcal{N}$! For example, the X's could be different...

---
#### Potential Issues with LinReg
1. True [[Data Generating Process]] is not linear.
	1. This could create model [[Bias (estimator)]].
	2. Check this by plotting the [[Residuals]] against our predicted values $\hat{y}$ in a **residual plot**.
	3. Can partially fix this by applying transformations to the features.
2. Errors between terms are correlated.
	1. If errors are correlated and we assume independence, our [[Standard Error]] estimates will be too bold!
	2. The worst case example is if we perfectly duplicated the data $n \rightarrow 2n$ and did not fix it.
	3. A good example is [[Time Series]] with [[Autocorrelation]]. 
3. Error variance changes (not [[Homoskedasticity]])
	1. This is usually true.
	2. We can plot the [[Residuals]] against the fitted values and see if they are wider at some points.
	3. We might be able to fix this by transforming the target feature, e.g., $log(y)$, or a [[Box Cox Transformation]].
	4. We might be able to fix this with weights if its based on multiple samples with different [[Sample Standard Deviation]] due to number of observations
4. [[Outliers]].
	1. We can calculate [[Studentized Residuals]]. If the absolute value is more than 3, it might be an outlier.
	2. We might remove them from the data if we are certain. However, this might suggest our model is bad (lmao).
5. High-leverage points.
	1. Values which have a very unusual value for a feature $x$.
	2. These have large influence on our model fitting.
	3. We can calculate the Leverage Statistic: $x_{i}'(X'X)^{-1} x_i$.  Or $1/n+\frac{(x_i-\bar{x})^2}{\sum_j (x_j - \bar{x})^2}$ if only one feature. The average leverage is $(p+1)/n$, and the range is $1/n - 1$.
6. High multicollinearity between features.
	1. When this happens, a small change in one feature $x_i$ can shift many features, bringing uncertainty and higher [[Standard Error]].
	2. Our [[One Sample T-Test]] for each parameter thus might fail to reject and suggest some $\beta=0$.
	3. We can get this by the Variance Inflation Factor: $VIF(\hat{\beta_j})= 1/(1-R^2_{X_j\ \sim\ X_{-j}})$, i.e., get the [[R-Squared]] of predicting $x_j$ using all other features to see how linear it is.

---
#### Finite Sample Properties
Unbiased if strictly exogenous: $E \left[ \hat{\beta} | X \right] = \beta$, $E \left[ s^2 | X \right] = \sigma^2$
( #todo : add Proof)

Linear Regression with all the properties above is BEST LINEAR [[Bias (estimator)|UNBIASED]] ESTIMATOR according to the Gauss-Markov Theorem, i.e., for all possible estimates of $\hat{\beta}$ which are un[[Bias (estimator)|biased]], the ones from $\hat{\beta}_{OLS}$ have the lowest [[Variance (estimator)]].

---
#### [[Standard Error]]s of Estimators
#todo (derivation)
- Assuming we know the true $\sigma^2 = Var(\epsilon)$, and uncorrelated with same variance:
- $SE(\hat{\beta_0})=\sigma^2 * \left[\frac{1}{N} + \frac{\bar{x}^2}{\sum_{i=1}^N (x_i - \bar{x})^2}\right]$
- $SE(\hat{\beta_1})=\sigma^2 * \left[\frac{1}{N} + \frac{\sigma^2}{\sum_{i=1}^N (x_i - \bar{x})^2}\right]$
- We estimate $\sigma$ from the data with the [[Residual Standard Error]] RSE: $rse=\sqrt{(1/(n-2)\sum(y_i-\hat{y}_i)^2)}$

---
