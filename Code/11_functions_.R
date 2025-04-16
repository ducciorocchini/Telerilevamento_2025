# R code for generating new functions

somma <- function(x,y) {
  z=x+y
  return(z)
  }

differenza <- function(x,y) {
  z=x-y
  return(z)
  }

pannellone <- function(nrow,ncol) {
  par(mfrow=c(nrow,ncol))
  }

positivo <- function(x) {
  if(x>0) {
    print("Questo numero è positivo, non lo sai?")
    }
  else if(x<0) {
    print("Questo numero è negativo, studia!")
    }
  else {
    print("Lo zero non è né positivo, né negativo, da sempre!")
    }
  }

flipint <- function(x) {
  x = flip(x)
  plot(x)
  }

