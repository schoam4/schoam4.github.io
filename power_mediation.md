---
layout: page
title: Power Analysis with Mediation Models
---

To cite the app use:

> Schoemann, A. M., Boulton, A. J., & Short, S. D. (in press). Determining power and sample size for simple and complex mediation models. *Social Psychological and Personality Science*.

The app is available on [github](https://github.com/schoam4/mc_power_med), to download the code and run the app locally use [this link](https://github.com/schoam4/mc_power_med/archive/master.zip). The (slower) web app can be found [here](https://schoemanna.shinyapps.io/mc_power_med/). 

To run the app automatically on your local machine use the following code in R (or RStudio):

```R
library(shiny)

# Easiest way is to use runGitHub from the shiny package
runGitHub("mc_power_med", "schoam4")
```

For presentations on the app see the [Supplemental Materials](http://marlab.org/Supplemental_Materials/) page. Slides can be found [here](https://github.com/schoam4/Talks/raw/master/IMPS_2016/IMPS_power.pdf).

A (unproofed) copy of the manuscript detailing the app can be found [here](https://github.com/schoam4/Talks/raw/master/MC_vs_Bootstrap_power_code/Schoemann_Boulton_Short_inpress.pdf).

The shiny and MASS packages must be installed to use the app (MASS is loaded automatically by the app).

For technical details please consult the [Technical Appendix](http://marlab.org/technical_appendix/).
