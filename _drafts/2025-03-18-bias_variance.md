---
title: "Bias Variance Decomposition"
categories:
  - Blog
tags:
  - ISLP
  - Notes
  - ML
use_math: true
---


The **Bias–Variance Decomposition** is a fundamental concept in machine learning, used to understand how different sources of error affect a model's predictive performance. It provides insights into the **trade-off between model complexity and generalization ability**.

---

##  **1. The error in model predictions**

Let:
-  $$f(x)$$  be the **true function** (the ground truth).  
- $$ \hat{f}(x) $$ be the **model's prediction**.  
- $$ \bar{f}(x) $$ be the **average prediction** over multiple training sets (i.e., the expectation of the model output).  
- $$ \epsilon $$ represent **irreducible noise** in the data, which we assume to have:
$$
\mathbb{E}[\epsilon] = 0 \quad \text{and} \quad \text{Var}(\epsilon) = \sigma^2.
$$

The target variable is modeled as:
$$
y = f(x) + \epsilon.
$$

The goal is to minimize the **expected squared error**:
$$
\mathbb{E}[(y - \hat{f}(x))^2].
$$ 

The expectation could be taken at a point or over the entire range of possibilities. The context makes it clear which expectation are we talking about.


---

## ✏️ **2. Expanding the Squared Error Term**

 We are interested in the following quantity
 
$$
\mathbb{E}[(y - \hat{f}(x))^2]
$$

We can subtitute for $$y$$ and expand to get the following

$$
 \mathbb{E}[(f(x) - \hat{f}(x))^2 + 2(f(x) - \hat{f}(x))\epsilon + \epsilon^2]
$$

By  **linearity of expectation** this becomes

$$
 \mathbb{E}[(f(x) - \hat{f}(x))^2] + 2\mathbb{E}[(f(x) - \hat{f}(x))\epsilon] + \mathbb{E}[\epsilon^2]
$$

Since $$ \epsilon $$ is **independent** of the model parameters, the cross term vanishes. Note that the independence is an assumption.

$$
\mathbb{E}[(f(x) - \hat{f}(x))\epsilon] = 0.
$$

Thus, we have:


$$
\mathbb{E}[(y - \hat{f}(x))^2] = \mathbb{E}[(f(x) - \hat{f}(x))^2] + \sigma^2.$$

The first term in the sum is called the **reducible error** or the **model error** and the second term is called the **irreducible error**. We will try to understand the first term more carefully.



---

## 🔍 **3. Decomposing the Model Error**

We now decompose the model error $$
\mathbb{E}[(\hat{f}(x) - f(x))^2]
$$ into **bias** and **variance** terms:

Add and subtract the mean prediction $$ \bar{f}(x) $$ inside the square to get

$$
 \mathbb{E}[(\hat{f}(x) - \bar{f}(x) + \bar{f}(x) - f(x))^2].
$$

Expanding  the square, we get
$$
 \mathbb{E}[(\hat{f}(x) - \bar{f}(x))^2] + \mathbb{E}[(\bar{f}(x) - f(x))^2] + 2\mathbb{E}[(\hat{f}(x) - \bar{f}(x))(\bar{f}(x) - f(x))]$$

 The first term on the lhs is called the **variance** and the second term is called the **bias**. The third term, we will show, vanishes.


---


## **4. Why Does the Cross Term Vanish?**

The cross term $$\mathbb{E}[(\hat{f}(x) - \bar{f}(x))(\bar{f}(x) - f(x))]$$ is dependent on three terms namely $$ f(x), \hat{f}(x),\textrm{ and } \bar{f}(x) $$. The expectation is over all possible data sets.  Clearly $$ f(x)$$ is an absolutely constant. $$\hat{f}(x)$$ is a random variable whose mean is $$\bar{f}(x)$$. Thus the expression simplies to $$(\bar{f}(x) - f(x))\mathbb{E}[(\hat{f}(x) - \bar{f}(x))]$$ and this evaluates to 0.




---

##  **5. The Final Bias–Variance Decomposition**

The squared error becomes:
$$
\mathbb{E}[(y - \hat{f}(x))^2] = \text{Variance} + \text{Bias}^2 + \text{Irreducible Error}.
$$

Where:
- **Variance**:
$$
\mathbb{E}[(\hat{f}(x) - \bar{f}(x))^2].
$$

- **Bias**:
$$
(\bar{f}(x) - f(x))^2.
$$

- **Irreducible Error**:
$$
\sigma^2.
$$

Thus, the full decomposition is:
$$
\mathbb{E}[(y - \hat{f}(x))^2] = \text{Bias}^2 + \text{Variance} + \sigma^2.
$$

---

##  **6. Key Insights**

- **Bias** measures the **systematic error** of the model.  
- **Variance** measures the **sensitivity** of the model to the training data.  
- **Irreducible error** is due to the inherent noise in the data.  
- The **cross term vanishes** due to the **law of iterated expectations**, not independence.

---

##  **7. Conclusion**

The bias–variance decomposition is a powerful framework for understanding how different sources of error affect model performance. The vanishing of the cross term, while unintuitive at first, is a direct consequence of the **law of iterated expectations**. This decomposition is essential for:
- Diagnosing **overfitting** and **underfitting**.  
- Balancing model complexity.  
- Improving generalization performance.

