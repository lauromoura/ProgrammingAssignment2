## Cache inverse matrix calculation through scoping management

## Creates a cache wrapper for a matrix object x, allowing to save
## the inverse data in the inv variable

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        
    }
    get <- function() x
    setinv <- function(inverse) inv <<- inverse
    getinv <- function() inv
    list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## Receives a CacheMatrix object x created from the method above and,
## if already cached, returns its inverse. If not, calculates the inverse,
## stores it in x and returns it.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$getinv()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data)
    x$setinv(inv)
    inv
}
