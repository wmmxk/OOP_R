linmodEst <- function(x,y) {
   
   qx <- qr(x) #compute QR-decomposition of x
   coef <- solve.qr(qx,y) # compute (x'x)^(-1)x'y
   df <- nrow(x) - ncol(x) # degree of freedom
   sigma2 <- sum((y - x%*%coef)^2)/df # standard deviation of residuals

   vcov <- sigma2 * chol2inv(qx$qr) # compute sigma^2 * (x'x)^(-1), which is covariance of the coefficients.
   colnames(vcov) <- rownames(vcov) <- colnames(x)

   list(coefficients = coef, # return this list
        vcov = vcov,
        sigma = sqrt(sigma2),
        df = df)

    
}
