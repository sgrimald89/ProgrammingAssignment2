## Creates a matrix that can cache its inverse. Calculates its inverse and stores it in the cache. If the inverse has already been calculated, retrieves the inverse from the cach instead.


## Creates a matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        m<-NULL
        set<- function(y){
                x<<-y
                m<<-NULL
        }
        get<-function() x
        setsolve<-function(solve) m <<-solve
        getsolve<- function() m
        list( set=set, get=get, setsolve=setsolve, getsolve=getsolve)
}


## Computes the inverse of the matrix returned by makeCacheMatix, if the inverse has already been calcuated, then cacheSolve retrieves the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m<-x$getsolve()
        if(!is.null(m)){
                message("getting cached data")
                return(m)
        }
        data<-x$get()
        m<-solve(data)
        x$setsolve(m)
        m
}