

## Caching the inverse of a matrix
## Write a pair of functions that cache the inverse of a matrix


## Function "makeCacheMatrix" creates a special "matrix" object that can cache 
## its inverse
    
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}
    

## Function "cacheSolve" computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above using the solve function

cacheSolve <- function(x, ...) {
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data)
    x$setinverse(m)
    m
}




## Check to make sure new functions are working
##Create a matrix
m1 <- matrix(c(1/2, -1/4, -1, 3/4), nrow = 2, ncol = 2)
m1


##Create new object using the functions I built
myMatrix_object <- makeCacheMatrix(m1)
cacheSolve(myMatrix_object)

##Check that it retrieves again
cacheSolve(myMatrix_object)

