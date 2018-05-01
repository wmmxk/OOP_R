#<<- is most useful in conjuction with closures to maintain state. 

# The function function return a function, working in the same way as function in C

# Closure allow use to have two levels of parameters. One level of parameters (the parent) controls how the function works. The other level does the work.


power <-function(exponent) {

  function(x) x ^ exponent
}

square <- power(2)

square(2)

cube <-power(3)
cube(2) 
