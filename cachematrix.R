
## makeCacheMatrix function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        inv  <- NULL
        set <- function(y) {
                x <<- y
                inv  <<- NULL
        }
        get <- function() x
        setInverse  <- function(solve) inv  <<- solve(x)
        getInverse  <- function() inv 
        list(set = set, get = get,
             setInverse = setInverse   ,
             getInverse = getInverse)
}


## cacheSolve function computes the inverse of the special "matrix" returned by makeCacheMatrix

cacheSolve <- function(x, ...) {
        inv  <- x$getInverse()
        if(!is.null(inv )) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv  <- solve(data, ...)
        x$setInverse(inv )
        inv 
}
