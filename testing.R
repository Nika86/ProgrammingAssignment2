source('cachematrix.R')

m <- matrix(runif(9, -1, 1), 3, 3)
mObject <- makeCacheMatrix(m)

if (any(m != mObject$get())) {
    message("get method failed")
}

i <- cacheSolve(mObject)

eps <- 0.000001
if (any(abs(i %*% m - diag(3)) >= eps)) {
    message("matrix inversion incorrect")
}

m2 <- matrix(runif(16, -1, 1), 4, 4)
mObject$set(m2)

if (any(m2 != mObject$get())) {
    message("set method failed")
}

if (!is.null(mObject$getinverse())) {
    message("cache not cleared after matrix modification")
}