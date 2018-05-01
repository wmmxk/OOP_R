# a simple editor for matrix objects. 
# Method $edit() changes some range of values;
# Method $undo() undoes the last edit.

library("methods")

mEdit <- setRefClass("mEdit",
                      fields = list( data = "matrix",
                                     edits = "list" ))


# methods for that class

mEdit$methods(
     edit =  function(i,j,value){
           backup <- list(i,j,data[i,j])
           data[i,j] <<- value
           edits <<- c(edits, list(backup))
     })


mEdit$methods(
     undo = function() {
         prev <- edits
         if (length(prev)) prev <- prev[[length(prev)]]
         else stop("No more edits to undo")
         edit(prev[[1]],prev[[2]], prev[[3]])

         #trim the edits list
         length(edits) <<- length(edits) - 2
         invisible(prev)
     })

mEdit$methods(
     show =  function(){
         cat("Reference matrix editor object of class",
             classLabel(class(.self)),"\n")
         cat("Data: \n")
         methods::show(data)
         })


xMat <- matrix(1:12,4,3)
xx <- mEdit(data = xMat)
xx
xx$edit(2,2,0)
xx
xx$undo()
xx
