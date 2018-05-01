x <- seq(1,10,1)
myx <-  x

# In S3 there is no formal definition of a class. 
class(myx) <- "myvector"
class(myx)

# re-define the generic method "print"  for our class
print.myvector <- function(x,...) {
  cat("This is a vector class I defined: \n")
  cat(paste(x[1:5]), "...\n")
}

x
myx
