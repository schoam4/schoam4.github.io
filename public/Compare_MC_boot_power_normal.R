###################################################################
## Simulation Code to compare power analysis for mediation models##
## Code compares power estimates based on bootstrap CIs and      ##
## Monte Carlo CIs across a range of sample sizes                ##
###################################################################


## WARNING: The simulation below is EXTREMELY computationally intensive
## it will likely take several days to complete.

#Vector of sample sizes of interest
N <- seq(10, 300, 10)


#Function to run a simulation for a single sample size
#Function will run 1000 Monte Carlo power analyses for a mediation model
#for both bootstrap CIs and Monte Carlo CIs. Each Monte Carlo power analysis
#will use 1000 replications.
simfunc <- function(N){

## Generate data from population covariance matrix
## Use example from Hayes (2013) study on econmic stress by Pollack et al. (2012)
  
## X = estress (economic stress)
## M = affect (depressed affect)
## Y = withdraw (withdrawl intentions)
  
popCor <- matrix(c(1, 0.340, 0.064, 0.340, 1, 0.417, 0.064, 0.417, 1), nrow = 3, byrow = TRUE)
popSD <- diag(c(1.42361, 0.72372, 1.24687))
popCov <- popSD%*%popCor%*%popSD


rep = 1000
bootRep = 1000
MCrep = 20000

## Generate data

library(MASS)


#Number of power analyses to run
metaRep <- 1000

#Store results here
MCtime <- rep(NA, metaRep)
MCpow <- rep(NA, metaRep)
MCpowSE <- rep(NA, metaRep)
boottime <- rep(NA, metaRep)
bootpow <- rep(NA, metaRep)
bootpowSE <- rep(NA, metaRep)

#Loop over number of power analyses
for(i in 1:metaRep){
  
#function to generate 1 data set
genMed <- function(seed = 1234, pCov = popCov, pMeans = c(0,0,0), Ns = N){
   require(MASS)
   mvrnorm(Ns, mu = pMeans, Sigma = pCov)
  
}

##Generate R data sets using apply

dats <- lapply(sample(1:50000, rep), genMed)


##Analyze results with MC conf int

powMC <- function(dat, mcmcReps = MCrep, conf = 95){

  # Run regressions
  m1 <- lm(dat[,2] ~ dat[,1])
  m2 <- lm(dat[,3] ~ dat[,2] + dat[,1])

  # Simulate draws of a, b from multivariate normal distribution
  a <- rnorm(mcmcReps, coef(m1)[2], sqrt(vcov(m1)[2,2]))
  b <- rnorm(mcmcReps, coef(m2)[2], sqrt(vcov(m2)[2,2]))
  ab <- a*b
  
  # Calculate confidence intervals
  low <- (1 - (conf / 100)) / 2
  upp <- ((1 - conf / 100) / 2) + (conf / 100)
  LL <- quantile(ab, low)
  UL <- quantile(ab, upp)
  
  # Is rep significant?
  LL*UL >= 0
  
}

MCtime[i] <- system.time(pow <- lapply(dats, powMC))
MCpow[i] <- sum(unlist(pow)) / rep
MCpowSE[i] <- sqrt((MCpow*(1-MCpow))/rep)

## Use lavaan for bootstrap power
powboot <- function(dat, nBoot = bootRep, conf = 95){
  
  require(lavaan)
  
  # Run mediation
  dat <- data.frame(dat)
  
  mod <- 'X2 ~ a*X1
          X3 ~ X1 + b*X2
          ab := a*b
         '
  fit <- sem(mod, dat, boot= nBoot)
  
  ci <-  parameterestimates(fit)[7,]
  
  # Is rep significant?
  ci[9]*ci[10] >= 0
  
}

boottime[i] <- system.time(pow <- lapply(dats, powboot))
bootpow[i] <- sum(unlist(pow)) / rep
bootpowSE[i] <- sqrt((bootpow*(1-bootpow))/rep)

}
#Return data frame of results for asample size
return(cbind(MCtime,MCpow, MCpowSE, boottime, bootpow, bootpowSE))
}

# Run simulation across sample sizes
# NOTE: examples on http://marlab.org/technical_appendix/ were run using
# parallel processing with parLapply
res <- lapply(N, simfunc)

### Examine results

#Compute average values for each sample size
res2 <- lapply(res, colMeans)

#Put average values in one data frame with names
#Add sample sizes in too
res3 <- do.call(rbind.data.frame, res2)
names(res3) <- names(res2[[1]])
res3 <- cbind(res3, N)

#estimate correlation between power for Monte Carlo CI and Bootstrap CI
cor(res3$MCpow, res3$bootpow)

## Plot power for normal
plot(res3$N, res3$MCpow, type = "l", lwd = 2, ylab = "Power", xlab = "N")
lines(res3$N, res3$bootpow, col = "red", lwd = 2)
legend(x=180, y =.5, legend = c("Monte Carlo CI", "Bootstrap CI"), col = c("black", "red"), lwd = 2)


