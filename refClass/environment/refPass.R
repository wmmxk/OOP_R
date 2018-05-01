# a class constructor is just a function which return a pointer to the environment.
# We do this by using the environment function to get this pointer to the current environment inside the constructor function.
# The local varialbes are equivalent to fields of your objects

MyClass <- function(x){
    x <- x-1
    get_x <- function() x
    print(environment())
    structure(class="MyClass", environment())
}
# ...that are truly classy
MyObject <- MyClass(3)
MyObject$x
