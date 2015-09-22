#This function creates a special "matrix" object 
makeCacheMatrix <- function(
                            de, #The data elements
                            numberRows,# number of rows
                            numberCols,# number of columns
                            byrows=TRUE #Fill matrix by rows
                            ) 
{# stat of the function
  
  # Create the matrix using in-built R matrix function 
  mat <-matrix(de,numberRows, numberCols,byrows);
  
   
  #Cache the matrix in the parent environment using R << operator
  source("cacheSolve.R");
  #call the "cacheSolve" function to get the inverse of the matrix either by creating or getting the one that was created 
  InverseMatrix<<-cacheSolve(mat);
  # return the inverese matrix
  print(InverseMatrix);
}# End of the function

#Testing
#source("makeCacheMatrix.R");
#m<-makeCacheMatrix(c(2,4,3,1,5,7),3,2,FALSE);
#m<-makeCacheMatrix(c(2,4,3,1,5,7),3,2,TRUE);
#m<-makeCacheMatrix(c(2,4,3,1,5,7),3,2);
#m<-makeCacheMatrix(c(2,4,1,5),2,2);