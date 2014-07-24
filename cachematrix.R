# create a matrix object with cachable inverse
makeCacheMatrix <- function(matrix = matrix()) {
    inverse <- NULL
    
    set <- function(y) {
        matrix <<- y
        inverse <<- NULL
    }
    
    get <- function() matrix
    
    setinverse <- function(computedInverse) inverse <<- computedInverse
    
    getinverse <- function() inverse
    
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}

# check for cached inverse and return it if available
# otherwise calculate it, cache and return
cacheSolve <- function(matrixObject, ...) {
    inverse <- matrixObject$getinverse()
    
    if(!is.null(inverse)) {
        message("getting cached data")
        return(inverse)
    }
    
    matrix <- matrixObject$get()
    inverse <- solve(matrix, ...)
    matrixObject$setinverse(inverse)
    inverse
}