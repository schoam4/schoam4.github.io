---
title: "Probability and Sampling"
author: "Alexander M. Schoemann"
date: "September 29-30, 2015"

---

# Probability

For any sampling distribution there are a series of functions in R.

For the normal distribution the functions end in norm

```{r}
dnorm(.5)
pnorm(.5)
qnorm(.5)

rnorm(3)
```

d is for density, p is for percentile, q is for quantile (value of the sampling distribution for a given percentile), and r is for random numbers

The norm functions default to the standard normal distribution (but you can also specify the mean and standard deviation of the distribution)

The gestation example from class two ways:
```{r}

mu <- 280.6
sigma <- 9.7
x <- 294

z <- (294-280.6)/9.7

pnorm(z)

pnorm(x, mean = mu, sd = sigma)

```

pnorm gives you a percentile, to get the percentage of the distribution above a value just use 1 - pnorm

```{r}
1 - pnorm(z)

1 - pnorm(x, mean = mu, sd = sigma)

```

# Sampling

There isn't a ton we can do with R for sampling (well we could do a lot with sampling distributions), so we'll have to find something else to do...

## M & M's!

- M&M's have a precise distribution of colors (and it differs across different kinds of M&M's)
- We will be working with milk chocolate M&M's (aka classic M&M's)
- Colors are produced as follows:
    - 24% cyan blue
    - 20% orange
    - 16% green
    - 14% bright yellow
    - 13% red
    - 13% brown
    
    
```{r, echo = FALSE}
barplot(c(24, 20, 16, 14, 13, 13), names.arg = c("blue", "orange", "green", "yellow", "red", "brown"), col = c("blue", "orange", "green", "yellow", "red", "brown4"), ylab = "Percentage")
```

Based on this:
- What is the probability of selecting a red one? 
- A brown one? 
- A red one or a brown one?
- A red one and then a yellow one? 

Let's see how well each bag matches the data (count out the number of each color from your bag). Then combine results with your neighbor and see how things change. Finally, we'll combine results across the entire lab

## Rock paper scissors

- Let's pair up an play some Rock, Paper, Scissors.

- Play 20 rounds. Record who wins each round (call one person "Player A" and another "Player B"), be sure to also record ties.

Now let's determine the sampling space and some probabilities! For this exercise assume each trial is independent.

- What is the probability of Player A showing rock and player B showing scissors?
- What is the probability that Player A will win?
- What is the probability that Player B will win?
- What is the probability of a tie?

How do your results mach up to this?



