source("linmodEst.R")

data(cats, package = "MASS")
linmodEst(cbind(1,cats$Bwt), cats$Hwt)
