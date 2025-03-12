---
title: "Risk Neutral Pricing and Martingales"
categories:
  - Blog
tags:
  - Finance
  - Notes
  - Shreve
use_math: true
---
The relationship betweek risk neutral pricing and discounted wealth processes in the binomial asset pricing model.

**Theorem** 
<br>
Consider the binomial asset pricing model with 

$$ 0 < d < 1+r <  u$$

Let the risk neutral probabilities be 

$$ \tilde{p} = \frac{1+r-d}{u-d} \textrm{ and } \tilde{q} = \frac{u-(1+r)}{u-d} $$


Then, under the risk neutral measure, the discounted stock price process (as well as any wealth process) will be a martingale.


**Proof**

The discounted stock process is given by 

$$X_n = \frac{S_{n}}{(1+r)^{n}} $$

$$X_n$$ denotes the price of the stock at time $$n$$ discounted by the interest rate factor for $$n$$ time steps. This is an adapted process. The value of the random variable $$X_n$$ is fully determined by the first $$n$$ coin tosses. For this to be a martingale  we must have

$$ \tilde{\mathbb{E}}_n[X_{n+1}] = X_n$$

Note that $$ X_{n+1} $$ is equal to $$X_n\frac{S_{n+1}}{(1+r)}$$. Thus the expectation on the left becomes  $$ X_n*\tilde{\mathbb{E}}_n[\frac{T_{n+1}}{1+r}]$$.  $$\ T_{n+1}$$ can take two values $u$ and $d$ depending only on the $$n+1^{st}$$ coin toss. So the expectation of $$T_{n+1}$$ under  under neutral probability turns out to be $$1+r$$. Plugging in this value, we can verify the theorem.

Note that both the stock and thebond grows at rate $1+r$ per period under the risk neutral measure. Thus any combination of hese two assets would also grow at rate $1+r$.  More specifically,
let us consider an adapted portfolio process, i.e. the investor decide to keep $$\Delta_n$$ shares at at time $$n$$ where $\Delta_n$ is dictated by the tosses upto $$n$$.  If $$X_0$$ is the initial weath, then the recursive wealth equation can be written as

$$X_{n+1} = \Delta_n S_n + (1+r)(X_n- \Delta_n S_n)$$

One can show that this wealth process is also a martingale under risk neutral measure.
