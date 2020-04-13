#Sintaxis de una variable: name_variable = valor
peras = 4
doble = function(x){2*x}
doble(peras)
cuadrado = function(x){x^2}
cuadrado(peras)
name = "Fernando"
name
#Funcion de operaciones basicas
sum <- function(x,y){
  x+y
  }
rest <- function(x,y){
  x-y
  }
mult <- function(x){
  x*x
  }
div <- function(x){
  x/x
}
operaciones = function(x,y){
  print("suma")
  print(paste(sprintf("%i + %i = ",x,y),x+y))
  print("resta")
  print(paste(sprintf("%i - %i = ",x,y),x-y))
  print("mult")
  print(paste(sprintf("%i * %i = ",x,y),x*y))
}
operaciones(60,2)

