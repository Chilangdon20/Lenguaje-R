---
title: "Untitled"
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Funcion `cut()` en R

Esta funcion nos rive para agrupar un vector de datos numericos y codificar sus valores con clases a las que pertenecen.

Sintaxis:

`cut(x,breaks=...,labels=..,right=..)`

 * `x` :
 
 Al vector numerico de nuestra variable cuantitaiva.
 
 * `breaks`` = 
 
 Puede ser un vector numerico formado por los **extremos de los intervalos en los que queremos agrupar nuestros datos** y que habremos calculado previamente.
 
 *`labels` = 
 
 Es un vector  con las  **etiquetas de los intervalos **.Su valor por defecto es utilizar la etiqueta de los mismos intervalos.
 
 *`right` = 
 
 Es un parametro igualado a FALSE hace que los **intervalos que consideremos sean cerrados por la izquierda y abiertos por la derecha** , cabe mencionar que este no es su valor por defecto $[n,k)$ .
 
 *` include.lowest` = 
 
 Igualado a TRUE combinando con right = Flase , hace que el ultimo intervalo sea cerrado.
 
## Ejemplo:

```{r}
iris_df = iris
petalos = iris$Petal.Length
#Es necesario incluir el valor de breaks , de lo contrario no funcionara la funcion
#cut(petalos, breaks = 5,right = FALSE)
iris_df$division3 = cut(petalos,breaks = ceiling(sqrt(length(petalos))),right = FALSE)
#cut(petalos,breaks = c(1,2,3,4,5,6,7),right = FALSE)
iris_df$division2 = cut(petalos,breaks = 5,right = FALSE,labels=FALSE)
iris_df$division = cut(petalos,breaks = 5,right = FALSE,
    labels = c("Pequeñas","Normales","Grandes","XL","G"))
iris_df
```

 
 Podemos agregar una nueva columna de datos con la informacion clasificada por tamaño.
 
 