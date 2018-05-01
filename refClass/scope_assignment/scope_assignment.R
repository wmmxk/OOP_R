# The ability to mange variables at two levels also makses it possible to modify variables in the environment of its parent from the enclosure. The key to managing variables at different levels is the double arrow assignment operator <<-. 

# This is the foundation for refClass



# example: Maintain a counter that records how many times a function has been called. Each time new_counter is run, it creates an environment, initializes the encounter i in this environment, and then creates a new function.

counter <- function(exponent) {
   i <-0

function(x) {
   i <<- i +1
   cat("called ",i, "times\n")
   x^exponent
}
}

square <- counter(2)
square(2)
square(3)
