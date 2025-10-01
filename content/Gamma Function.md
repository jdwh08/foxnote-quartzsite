---
aliases: 
tags:
  - math
  - stats
edited: 2025-09-24T17:05
created: 2024-03-19T22:06
---
# Definition:
A generalization of the [[Factorial]] to decimals and [[Complex Numbers]].

$$\Gamma(x) = \int_{0}^{\infty} t^{x-1}e^{-t} dt\text{ if } x > 0$$
where $n! = \Gamma(n+1)$

---
# Notes:

### Derivation
Note that $n! = n \times (n-1) \times ... = n \times (n-1)!$

We need some function $G(x)$ which...
1. Smoothly interpolates through the factorials.
2. is [[Continuous Function]]
3. is [[Differentiable Function]]

Let's write it in terms of $G$: $G(n) = n \times G(n-1)$, and $G(0)=1$.
- Note this is [[Recursion]]!
- Remember the power rule for [[Derivative]]: $d/dx(x^{n}) \rightarrow n x^{n-1}$, which works for continuous.
	- Currently only one side has derivative; we need a way to solve mismatch.
- Remember the product rule for [[Derivative]]: $d/dx (x^n v) = nx^{n-1}v + x^n \times d/dx(v)$
	- This now allows us to have derivatives on both sides!
- To make this easier we can have $v = d/dx(v)$ if we set $v=e^{-x}$
	- $d/dx(x^n e^{-x}) = nx^{n-1}e^{-x} - x^n e^{-x}$
- Set $g_n(x) = x^ne^{-x}$ to get $g_n(x) = n g_{n-1}(x) - d/dx(g_n(x))$
- $\int_{a}^{b} g_n(x) dx = n \int_a^b g_{n-1}(x) dx- \int_a^b d/dx(g_n(x)) dx$. 
	- There's this extra last bit which should be zero.
- To make the last bit zero, we set $g_n(x)|_a^b=0$, 
	- $0^n e^{-0}=0$ 
	- $\infty^n e^{-\infty}$ so $\underset{x \rightarrow \infty}{\lim} x^n / e^x = 0$
	- Thus, $b=\infty$ and $a=0$
	- Eh also the integral converges.
- Set $G(n) = \int_{0}^{\infty} g_n(x) dx= \int_{0}^{\infty} x^n e^{-x} dx$ so $G(n) = n \times G(n-1)$.
- We can also see that $G(0) = e^{-x} |_0^{\infty} = -0-(-1)=1$

Thus, we can see that $G(n) = \int_{0}^{\infty} x^n e^{-x} dx$ is a smooth approximation of the factorials!
To make this line up with $\Gamma(x)$, 
- we convert $n\rightarrow x$ (continuous) 
- set $x \rightarrow t$ (new var to replace $x$)
- offset $x$ by $-1$ so that it is defined only on positive values.

$$\Gamma(x) = \int_0^{\infty} t^{x-1} e^{-t} dt$$
Note that once we're here it's very easy to prove this works by doing [[Integration by Parts]]. 

---
# Examples:
Examples

----
# Source:
[Zundamon's Theorem](https://www.youtube.com/watch?v=UuqwDQfg0GE) :3 for the derivation