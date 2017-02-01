---
layout: subpage
title: Technical Appendix 
---

This is the technical appendix for the [Power Analysis with Mediation App](http://marlab.org/power_mediation/). The appendix will be updated as functionality is added to the App.

1. Determining power with varying sample sizes. 

This approach is implemented with the ""Set N, Find Power"" option in the App. For additional details on this approach see Schoemann, Miller, Pornprasermanit, & Wu (2014). The steps for a power analysis with varying sample size are: 1) run many replications of a simulation with different sample sizes across replications, 2) record the sample size and significance of parameters (0 not significant, 1 significant) for each replication, 3) for a given parameter, fit a logistic regression predicting the parameter’s significance from sample size, 4) compute the predicted probability of success at a given sample size, this value is an estimate of power at that sample size.

$$p = \frac{e^{B_0 + B_1N}}{1+e^{B_0 + B_1N}}$$
