---
aliases: 
tags:
  - math/discrete_math/number_theory
edited: 2025-02-15T16:15
created: 2024-01-09T19:19
---
### Definition:
Method to find [[Relatively Prime]] in [[Modular Arithmetic]].
- If $\gcd(n,k) = 1$, then $k^{\varphi(n)} \equiv 1\ (mod\ n)$.

---
### Proof:

Lemma 1: If $\gcd(n,k) = 1$, then $ak \equiv bk(mod\ n) \rightarrow a \equiv b\ (mod\ n)$
- Proof: $gcd=1\rightarrow 1 = xn + yk \rightarrow 1(mod\ n) = 0 + yk(mod\ n)$ since [[Greatest Common Divisor]] is linear combo.
- Thus, $rem(ak,n) = 1 = rem(bk,n)$
- $\gcd(n,k) = 1 \rightarrow$ exists a multiplicative inverse k. 
	- (This fact was used to break the [[Turing Code v2]].)
    -   We can use the multiplicative inverse.

Lemma 2: If $\gcd(n,k) = 1$. Let $\{ k_{1}\ldots k_{r}\}$ be the set of integers from 1 to $n - 1$ that are [[Relatively Prime]] to $n$, which makes $r$ the total number of these (i.e., [[Euler's Totient Function]] $\varphi(n)$). Then, $\left\{ rem\left( k_{1}*k,\ n \right)\ldots rem\left( k_{r}*k,n \right) \right\} = \{ k_{1}\ldots k_{r}\}$.

> First, we try and prove that the length of the first set is $r$. This
> means that each element is unique.
> 
> Assume for [[Proof by Contradiction]] that $rem\left( k_{i}k,n \right) = rem\left( k_{j}k,n \right)$.
> By definition of [[Congruence]], $k_{i}k \equiv k_{j}k(mod\ n)$. 
> Using Lemma 1,
> $k_{i}k \equiv k_{j}k(mod\ n) \rightarrow k_{i} \equiv k_{j}\ (mod\ n)$.
> This means that $n\ |\ (k_{i} - k_{j})$ because of [[Congruence]] alternative property
> Since both $k_{i},\text{and } k_{j} < n$, the only way that n [[Divisibility|Divides]] $(k_i - k_j)$ is if
> $k_{i} = k_{j} = 0$. 
> Thus, there is no way for two elements of the set
> to be the same, so each element is unique, so there are r elements.

> Next, we want to show that $rem\left( k_{1}*k,n \right) = k_{1}$, so
> that all elements in the first set are in the second set.
>
> Note that
> $\gcd\left( n,rem\left( k_{1}k,\ n \right) \right) = \gcd\left( n,k_{1}k - rn \right) = \gcd(n,k_{i}k)$.
> Recall that $\gcd(n,k) = 1$ by assumption and
> $\gcd\left( n,k_{i} \right) = 1$ since [[Relatively Prime]]. Thus,
> $\gcd\left( n,k_{i}k \right) = 1$. This means that it must be in the
> set $\{ k_{1}\ldots k_{r}\}$.
> Because the elements of
> $\left\{ rem\left( k_{1}*k,\ n \right)\ldots rem\left( k_{r}*k,n \right) \right\}$
> are in $\{ k_{1}\ldots k_{r}\}$, it is a subset, so the length is at
> most the length of $\{ k_{1}\ldots k_{r}\}$.
>
> We know that both sets have the same number of elements $r$, so the
> only way to have set 1 be a subset of set 2 is if they are actually
> the same set.

Final Proof:
$k_{1}*\ldots*k_{r} = rem\left( k*k_{1},n \right)*\ldots rem\left( k*k_{n},\ n \right)$
$\equiv k_{1}k*k_{2}k*\ldots*k_{r}k\ (mod\ n) \equiv (k_{1}*\ldots*k_{r})*k^{r}\ (mod\ n)$

Since each element $k_{1}\ldots k_{r}$ is [[Relatively Prime]] with n, the
$\gcd\left( k_{1}\ldots k_{r},n \right) = 1$. We can apply Lemma 1, with
$a = 1,\ b = k^{r}$, so that
$a*\left( k_{1}\ldots k_{r} \right) \equiv \left( k_{1}\ldots k_{r} \right)*k^{r}\ (mod\ n) \rightarrow 1 \equiv k^{r}(mod\ n)$

Since $r$ is the number of elements which are [[Relatively Prime]] with $n$,
we prove that $k^{r = \varphi(n)} \equiv 1\ (mod\ n)$.

---
### Links:
A special case is [[Fermat's Little Theorem]].