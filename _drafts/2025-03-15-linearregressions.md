---
title: "Linear Regression"
categories:
  - Blog
tags:
  - ISLP
  - Notes
  - ML
use_math: true
---


## Expectation and Variance of OLS Estimators

In a standard linear regression model:

\[ Y = X\beta + \epsilon \]

where:
- \( Y \) is an \( n \times 1 \) vector of observed responses.
- \( X \) is an \( n \times p \) matrix of predictor variables (with full column rank).
- \( \beta \) is a \( p \times 1 \) vector of unknown regression coefficients.
- \( \epsilon \) is an \( n \times 1 \) vector of random errors, assumed to satisfy \( E[\epsilon] = 0 \) and \( \text{Var}(\epsilon) = \sigma^2 I_n \).

The ordinary least squares (OLS) estimator for \( \beta \) is:

\[ \hat{\beta} = (X^T X)^{-1} X^T Y \]

### Expectation of \( \hat{\beta} \)

Taking the expectation:

\[ E[\hat{\beta}] = E[(X^T X)^{-1} X^T Y] \]

Since \( Y = X\beta + \epsilon \), we substitute:

\[ E[\hat{\beta}] = E[(X^T X)^{-1} X^T (X\beta + \epsilon)] \]

\[ = (X^T X)^{-1} X^T X \beta + (X^T X)^{-1} X^T E[\epsilon] \]

Since \( E[\epsilon] = 0 \), we get:

\[ E[\hat{\beta}] = \beta \]

Thus, \( \hat{\beta} \) is an **unbiased estimator** of \( \beta \).

### Variance of \( \hat{\beta} \)

\[ \text{Var}(\hat{\beta}) = \text{Var}((X^T X)^{-1} X^T Y) \]

Using \( Y = X\beta + \epsilon \):

\[ \text{Var}(\hat{\beta}) = \text{Var}((X^T X)^{-1} X^T (X\beta + \epsilon)) \]

\[ = (X^T X)^{-1} X^T \text{Var}(\epsilon) X (X^T X)^{-1} \]

Since \( \text{Var}(\epsilon) = \sigma^2 I_n \), this simplifies to:

\[ \text{Var}(\hat{\beta}) = \sigma^2 (X^T X)^{-1} \]

Thus, the variance-covariance matrix of the estimated coefficients is:

\[ \text{Cov}(\hat{\beta}) = \sigma^2 (X^T X)^{-1} \]

where \( \sigma^2 \) is usually estimated using:

\[ \hat{\sigma}^2 = \frac{\|Y - X\hat{\beta}\|^2}{n - p} \]

for an unbiased estimate of the error variance.

These results provide the foundation for constructing confidence intervals and hypothesis tests for the regression coefficients.

