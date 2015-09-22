cacheSolve<- function(
  matx #Matrix 
  ) 
{# stat of the function
  # Inverse of Matrix using ginv MASS package
  #library(MASS);
  
  #check is the inverselist is present in the parent environment
  if(!exists("inverselist")){
    #Since inverselist is not present in the parent environment create the list and store it for future use
    
    
    # Inverse of Matrix using ginv MASS package
    #IMatrix<-ginv(matx);
    
    
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
      
      # Inverse of Matrix using ginv MASS package
      #IMatrix<-ginv(matx);
      
      # Inverse of Matrix using solve since the assumption is the rows = columns
      IMatrix<-solve(matx);
      inverselist<<-append(inverselist,list(list(matx,IMatrix)));
    }
    # return the inverese matrix
    IMatrix;  
  }
  
  
  
}# End of the function