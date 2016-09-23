---
layout: page
title: Power Analysis with Mediation Models
---

The app is available on [github](https://github.com/schoam4/mc_power_med), to download the code and run the app locally use [this link](https://github.com/schoam4/mc_power_med/archive/master.zip). The (slower) web app can be found [here] (https://schoemanna.shinyapps.io/mc_power_med/).

To run the app automatically on your local machine use the following code in R (or RStudio):

```R
library(shiny)

# Easiest way is to use runGitHub from the shiny package
runGitHub("mc_power_med", "schoam4")
```

For presentations on the app see the [Supplemental Materials](http://marlab.org/Supplemental_Materials/) page. Slides can be found [here](https://github.com/schoam4/Talks/raw/master/IMPS_2016/IMPS_power.pdf).

The shiny, shinyBS, and MASS packages must be installed to use the app (shinyBS and MASS are loaded automatically by the app).
