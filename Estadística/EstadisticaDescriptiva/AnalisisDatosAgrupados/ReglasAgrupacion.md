---
title: "Reglas de Agrupacion"
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Reglas de Agrupacion.

Ejemplo:
 
Consideremos un conjunto de datos `datacrab` para nuestro estudio,trabarajermos unicamente con la variable ``width``, para esto llevarremos a cabo los 4 pasos que son:

  1- Calculo de intervalos.
  2- Determinacion de amplitud.
  3- Calculo de extremos.
  4- Marcas de clase.
  
```{r}
crabs = read.table("../data/datacrab.txt", header = TRUE)
str(crabs)
```

Ahora definimos una nueva variable que contendra la anchura de los cangrejos ya que es la columna numerica con decimales:
```{r}
cA = crabs$width
 
```

Calculamos el numero de clases segun las diferentes reglas vistas:

```{r}
                           # Regla de la raiz cuadrada
n = length(cA)
n1 = ceiling(sqrt(n))      # Recordemos que ceiling es la parte entera superior 
n1                         # Nos muestra la cantidad de intervalos que deberiamos tomar.
```

Regla de sturges``nclass.Sturges()``:

```{r}
n2 = ceiling(1+log(n,2))
n2
```
Regla de Scott`nclass.Scott()`:
```{r}
As = 3.5*sd(cA)*n^(-1/3)     #Amplitud teorica para calcular el numero de clases
n3 = ceiling(diff(range(cA))/As)
n3
```
Regla de Freedman-Diaconis`nclass.FD()`:

```{r}
Afd = 2*(quantile(cA,0.75, names =FALSE)-quantile(cA,0.25,names =FALSE))*n^(-1/3) #Names = false elimina el porcentaje del cuantil
n4 = ceiling(diff(range(cA))/Afd)
n4
```

Una ves realizado lo anterior debemos de elegir la amplitud de los intervalos.

```{r}
A = diff(range(cA)/10)
A
```

Como los dato estan expresados en mm con una precision de una cifra decimal, debemos redondear por exceso a una cifra decimal el resultado obtenido :

```{r}
At = 1.3
```

Como 3er paso nos toca calcular los extremos $L1...,L11$ de los intervalos .

  Calculo del primer extremo:
```{r}
L1 = min(cA)-1/2*0.1
L = L1 + At*(0:10)
L
```

4to paso marcas de clase
```{r}
x1 = (L[1]+L[2])/2
X = x1 + At*(0:9)
X
```




  