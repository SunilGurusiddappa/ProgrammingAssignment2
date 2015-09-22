## Put comments here that give an overall description of what your
## functions do 
##
##makeCacheMatrix -- Takes matrix as the input and calls the cacheSolve to get the inverse of the matrix
##
##cacheSolve -- Takes matrix as the input looks for the presense of the inverse matrix in the parent environment, 
## if it is not present then it creates the inverse matrix 

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(mat = matrix()) 
{# stat of the function
  
  #call the "cacheSolve" function to get the inverse of the matrix either by creating or getting the one that was created 
  InverseMatrix<<-cacheSolve(mat);
  # return the inverese matrix
  print(InverseMatrix);
}# End of the function


#Testing
#source("cachematrix.R");
#m<-makeCacheMatrix(matrix(c(2,4,3,1,5,7,8,9,10),3,3,FALSE));
#m<-makeCacheMatrix(matrix(c(1,2,3,4),2,2,TRUE));

##  This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
##  If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(matx, ...) 
{# stat of the function
 ## Return a matrix that is the inverse of 'x'
 
 #check is the inverselist is present in the parent environment
  if(!exists("inverselist")){
    #Since inverselist is not present in the parent environment create the list and store it for future use
    # Inverse of Matrix using solve since the assumption is the rows = columns
    IMatrix<-solve(matx);
    inverselist <<-list(list(matx,IMatrix))
  }
  else{
    # if the matrix passed is not found create a inverse matrix and store in the parent environment inverselist
    bExist<-FALSE;
    # look at all the matrix in the parent inverse list to make sure we have a match or not
    for(i in 1:length(inverselist))
    {

      l<-inverselist[[i]];
      # ge the matrix stored in the parent inverse list
      tempmatx<-l[[1]];

      #print(tempmatx);
      # check the retrieved matrix and passed matrix are identical or not
      if(identical(matx,tempmatx))
      {
	bExist<-TRUE;
	# if the retrieved matrix and passed matrix are identical then pass the associated inverse matrix do not create one
	IMatrix<-l[[2]];
	print("found the inverse matrix we did not create new inverse matrix");
      }

    }
    if(!bExist)
    {
      # if the retrieved matrix and passed matrix are not identical then create inverse matrix and append to the parent inverselist for future use
      # Inverse of Matrix using solve since the assumption is the rows = columns
      IMatrix<-solve(matx);
      inverselist<<-append(inverselist,list(list(matx,IMatrix)));
    }
    # return the inverese matrix
    IMatrix;  
  }
}# End of the function