---
title: "EJERCICIO"
output: github_document
autor: "Fernando.V.S"
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## EJERCICIO TABLA FRECUENCIAS.

Se han recogido las notas de el examen de admision de la UNAM de 80,000 participantes y deseamos obtener la mayor cantidad de informacion util posible

```{r}
calif= sample(1:10,80000,replace = TRUE)

table(calif)
```

Agrupamos las califiaciones en los siguientes intervalos:

 $[0,5),[5,7),[7,9),[9,10)$
 
Es evidente que estos intervalos no tienen la misma amplitud debido a la circunstancia de calificacion.

```{r}
L = c(0,5,7,9,10)    #Definimos el vector de extremos.

calif1 = cut(calif, breaks = L, right = FALSE, include.lowest = TRUE) #Definimos el resultado de la codificacionn en los intervalos usando como etiquetas los propios intervalos "L"
table(calif1)
```

Ahora definimos las marcas de clase.

```{r}
MdC = (L[1:length(L)-1]+L[2:length(L)])/2  
calif2 = cut(calif,breaks = L,labels = MdC,right = FALSE, include.lowest = TRUE)
table(calif2)
```
Definimos el resultado de la codificacion en intervalos utilizando como etiquetas la posicion ordenada del intervalo(1,2,3,4)

```{r}
calif3 = cut(calif,breaks = L,labels = FALSE,right = FALSE,include.lowest = TRUE)
table(calif3)
```

Tambien podriamos dar ottra condicion como el resuktado de la cidifacion de intervalos utilizando como etiquetas Rechazado,Seleccionado.

```{r}
s = c("MuyBajo","Bajo","Aprobado","Excelente")
calif4 = cut(calif,breaks = L , labels = s,right = FALSE,include.lowest = TRUE)
table(calif4)
```

CALCULO DE TABLA FRECUENCIAS:

```{r}
TablaFrec(calif, k = 7,A = 1,p=0.1)

```

O tambien usando la funcion `hist`

```{r}
califHist = hist(calif,breaks = L,right = FALSE,include.lowest = TRUE,plot=FALSE )
FAbs = califHist$count
FRel = prop.table(FAbs)
FAbsCum = cumsum(FAbs)
FRelCum = cumsum(FRel)
intervalos = c("[0,7)","[7,10)")
calificacion = c("rechazado","seleccionado")
marcas = califHist$mids
tabla.Fr = data.frame(intervalos,calificacion,marcas,FAbs,FAbsCum,FRel,FRelCum)
tabla.Fr
```

