---
layout: subpage
title: Technical Appendix 
math: true
---

This is the technical appendix for the [Power Analysis with Mediation App](http://marlab.org/power_mediation/). The appendix will be updated as functionality is added to the App.

# Determining power with varying sample sizes. 

This approach is implemented with the ""Set N, Find Power"" option in the App. For additional details on this approach see Schoemann, Miller, Pornprasermanit, & Wu (2014). The steps for a power analysis with varying sample size are: 1) run many replications of a simulation with different sample sizes across replications, 2) record the sample size and significance of parameters (0 not significant, 1 significant) for each replication, 3) for a given parameter, fit a logistic regression predicting the parameter’s significance from sample size, 4) compute the predicted probability of success at a given sample size, this value is an estimate of power at that sample size.

![](https://github.com/schoam4/schoam4.github.io/raw/master/public/predprob.gif)

#  Evaluating assumptions of Monte Carlo Confidence Intervals

Testing indirect effects with Monte Carlo Confidence Intervals (CIs) requires assuming that the sampling distributions of the individual regression coefficients are normal* (but not the sampling distribution of the indirect effect). However, testing indirect effects with bootstrap CIs does not assume normality of individual regression coefficients or the  indirect effect. A series of small Monte Carlo simulations were conducted to compare estimates of power to detect the indirect effect between Monte Carlo CIs and bootstrap CIs under different distributions for all three variables in the mediation model.

All Monte Carlo simulations used a simple, three variable mediation model with a single indirect effect. The power to detect the indirect effect was the primary quantity of interest. Power was assessed for samples sizes between 10 and 300, population correlations and standard deviations are listed below, all variables had means of zero. At each sample size, Monte Carlo powere analyses were repeated 1000 times testing the indirect effect with both Monte Carlo CIs and bootstrap CIs, each Monte Carlo power analysis used 1000 replications. For Monte Carlo CIs 50000 random draws from the distribution of a and b were used to compute distributions of indirect effects. For bootstrap CIs, 1000 bootstrap draws were used for each replication.

|     |  X  |  M  | Y   |
| --- | --- | --- | --- |
| X   | 1   |     |     |
| M   | .340 | 1  |     |
| Y   | .064 | .417 |  1 |
| SD | 1.43 | 0.72 | 1.25 |

## 

*Hypothesis tests concerning single regression coefficients make similar assumptions when using Wald statistics for hypothesis testing. This assumption is most likely to be violated when the assumptions of a regression model are violated, specifically when the errors in the model are not normally distributed. An important point is that the assumptions of regression concern the distribution of errors in the model, not the distribution of the predictors or the distribution of the outcome variable (though with non-normal outcome variables, errors are often non-normal as well).