---
title: "Untitled"
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Diagrama de Caja o Bigotes.

```{r}
datos = read.table("/Users/familiavs/Documents/r-basic-master/data/bodyfat.txt",header = TRUE)
boxplot(datos[,7:9], names = c("Busto","Abdomen","Cadera"),col = c("yellow","lightblue","pink"))
```
 
```{r}
str(boxplot(circumference~Tree, data = Orange, ylab = "Circunferencia del tronco",xlab = "Arbol",
        main = "Boxplot de las naranjas en funcion del tipo de arbol", col = c("orange","yellow","green","orange3","yellow2"),notch = T))


```
 
 