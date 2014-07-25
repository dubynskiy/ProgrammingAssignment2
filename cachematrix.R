## Below are two functions that are used to create a special object 
## that stores a matrix and caches its inverse.

## This function creates a special "matrix" object that can cache it's inverse.
makeCacheMatrix = function(x = matrix()) {
    m = NULL
    
    # set the value of the matrix
    set = function(y) {
    x <<- y
    m <<- NULL
    }
    
    # get the value of the matrix
    get = function() x
    
    # set the value of the inverse
    setInverse = function(solve) m <<- solve
    
    # get the value of the inverse
    getInverse = function() m
    
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)

}


## The following function calculates the inverse of the matrix 'x' created with 
## the 'makeCacheMatrix' function. It first checks to see if the inverse has 
## already been calculated. If so, it gets the inverse from the cache and 
## skips the computation. Otherwise, it calculates the inverse of 'x' and sets 
## the value of inverse of 'x' in the cache via the setInverse function.
cacheSolve = function(x, ...) {
        # return a matrix that is the inverse of 'x'
    m = x$getInverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data = x$get()
    m = solve(data, ...)
    x$setInverse(m)
    m  
}
