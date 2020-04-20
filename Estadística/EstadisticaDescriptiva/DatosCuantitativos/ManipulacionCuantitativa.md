---
title: "ManipulacionCuantitativa"
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Manipulacion Cuantitativa


## ``Summary()``:

Esta funcion nos devuelve un resumen estadistica con los valores minimos y maximos del vector, sus 3 cuartiles y su media.

```{r}
cangrejo = read.table("../Documents/r-basic-master/data/datacrab.txt",header=TRUE)
cangrejo = cangrejo[-1]
summary(cangrejo)
```

Si nos interesa comprarar numericamente los pesos y las anchuras de los congrejos con 2 colores con los que tienen 5 colores , utilizaremos :
```{r}
summary(subset(cangrejo, color == 2,c("weight","width")))
summary(subset(cangrejo, color == 5,c("weight","width")))


```

# Funcion by .

Se utiliza pra aplicar una determinada funcion a algunas columnas de un df segmentandolas segun los niveles de un factor.

```{r}
#Resumen estadistico por especie
by(iris[,c(1,3)],iris$Species, FUN = summary)
```

# Funcion aggregate

Es equivalente a la funcion by, solo que lso resultados se muestran de forma diferente.

```{r}
a = aggregate(cbind(Sepal.Length,Petal.Length)~Species, data=iris,FUN = summary)

```
 
 Para evitar errores en nuestros ejercicios es necesario eliminar los valores NA o no tomarlos enc uenta , para hacer esto tenemos el parametro `na.rm=TRUE` en el argumetno de nuestra funcion.
 
 
