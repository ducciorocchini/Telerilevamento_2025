mf <- function(x,y){
  par(mfrow=c(x,y))
  }

tfun <- function(x,y) {
  z=x+y
  return(z)
  }

numbering <- function(x){
if(x>0){
  print("Positive number")
  }
else if(x==0)
  {
  print("Hey, don't miss around. Zero is nor negative nor positive okkkkk?????")
  }
else if(x<0)
  {
  print("Negative number")
  }
}
