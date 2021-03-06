## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
        inverse <- NULL
        #Set function saves the original matrix x
        set <- function(y) {
              x <<- y
              inverse <<- NULL
        }
        #Gets the saved function x
        get <- function() x
        #Sets the inverse matrix
        setinverse <- function(solve) inverse <<- solve
        #Gets the inverse matrix
        getinverse <- function() inverse
        list(set = set, get = get,
             setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
##his function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse <- x$getinverse()
        if(!is.null(inverse)) {
              message("getting cached inversed matrix")
              return(inverse)
        }
        message("Inverse matrix not found on cache... Getting the inversed matrix now for you!")
        data <- x$get()
        inverse <- solve(data, ...)
        x$setinverse(inverse)
        message("All done, and cached!")
        inverse
}
