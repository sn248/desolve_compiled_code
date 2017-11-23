# solve the gprotein system
library(deSolve)
library(ggplot2)
library(microbenchmark)

source('parameters_gprotein.R')
p   <- parameters()

source('IC_gprotein.R')
IC  <- Initial_conditions()

TIME = seq(from = 0, to = 600)

#### To use the R version of 
source('odes_gprotein.R')
sim.data.df  <- as.data.frame(vode(IC,TIME,ODE_gprotein,p,
                                    mf = 22, rtol=1e-3,atol=1e-6,maxord = 5,
                                    verbose = F))

Rcpp::sourceCpp("odes_gprotein.cpp")
sim.data.df <- as.data.frame(vode(IC,TIME,odes_gprotein,p,
                                  mf = 22, rtol = 1e-3, atol = 1e-6, maxord = 5,
                                  verbose = F))

#### compare with the matlab result by plotting ####
# print(ggplot(data = sim.data.df, aes(x = time, y = G))
#       + geom_line(size = 1))


