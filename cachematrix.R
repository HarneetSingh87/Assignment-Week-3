## Put comments here that give an overall description of what your
## functions do


## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}



## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        
## Return a matrix that is the inverse of 'x'
}



##For the purpose of using Solve fucntion download the lpsolve library
## donwload matrixcalc library for the purpose of using is.singular.matrix function
## to test whether matrix is having determinent 0 or not
install.packages('lpSolve')
install.packages('matrixcalc')
library('matrixcalc')
library('lpSolve')


## below function is used to create the set of fucntions
## Also used to cache the values.
makeCacheMatrix<- function(x = Matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinver <- function(solve) m <<- solve
        getinver <- function() m
        list(set = set, get = get,
             setinver = setinver,
             getinver = getinver)
}

## The below fucntion is used to check if the cache value is existing or not
## if cache is existing then we can use the same and else we will check whether
## our matrix is singular or not and accordingly we will call our solve function 
## to get the matrix inversion.

cacheSolve<- function(x, ...) {
        m <- x$getinver()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
	 test<- is.singular.matrix(data)		
       if (!test)
	{
	       m <- solve(data, ...)
             x$setinver(m)
             m
	}
	else
	{
		message("Please change your matrix")
	}
}

##Below are the two cases to test the inversion possiblity

mtx<-makeCacheMatrix(matrix(1:9,3,3))
mtx$getinver()
cacheSolve(mtx)
mtx<-makeCacheMatrix(matrix(1:4,2,2))
mtx$getinver()
cacheSolve(mtx)