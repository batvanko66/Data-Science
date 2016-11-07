## The goal for this assignment is to understand and practice the super assignment <<- 
## which assignes value to a global variable which can be reffered to in another function to
## to save a computational time.
## There are two functions below. The first one creates a list of functions and creates
## the global variable which will be refered to in the second function. The second function calls
## the global variable to see if the value of the inversed matrix has already been computed
## and if so, uses it and saves computational time.
## At the end there is a test code used to test the two functions.

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
      s <- NULL
      set <- function(y) {
            x <<- y
            s <<- NULL
      }
      get <- function() x
      setinverse <- function(solve) s <<- solve
      getinverse <- function() s
      list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse)

}


##  This function computes the inverse of the special
# "matrix" returned by `makeCacheMatrix` above. If the inverse has
# already been calculated (and the matrix has not changed), then
# `cacheSolve` should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
      s <- x$getinverse()
      if(!is.null(s)) {
            message("getting cached data")
            return(s)
      }
      data <- x$get()
      s <- solve(data, ...)
      x$setinverse(s)
      s
}

# The below code is a test using the above functions
amatrix <- makeCacheMatrix(matrix(c(1, 2, 3, 4), nrow = 2, ncol = 2))
amatrix$get()
cacheSolve(amatrix)
amatrix$getinverse()
amatrix$set(matrix(c(0,5,99,66), nrow = 2, ncol = 2))
cacheSolve(amatrix)
amatrix$get()
amatrix$getinverse()
