---
title: "Calificaciones"
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Ejercicio de notas de carreras.


*  Carga el conjunto de datos de la carpeta data llamado grades.txt en R y responde a las    s    siguientes preguntas.

```{r}
data = read.table("/Users/familiavs/Documents/r-basic-master/data/grades.txt")

table(data)
```
   


* Calcula la media, la mediana y la moda redondeada a dos cifras decimales de las notas          numéricas de los exámenes tanto de forma conjunta como por estudio universitario. ¿En qué      grupo observamos la nota más alta? ¿Qué grupo está por encima de la media de estudiantes?

```{r}


informatica<-subset(data, data$estudio=="Informatica")

aggregate(data$nota~data$estudio, FUN = var)


industrial<-subset(data, data$estudio=="Industrial")



mates<-subset(data, data$estudio=="Mates")



telematica<-subset(data, data$estudio=="Telematica")
```



*  Dibuja en un único gráfico los cuatro diagramas de caja, uno para cada grupo. Añade así       mismo la nota media, pon nombre, título y color al gráfico para documentar el gráfico          correctamente.

```{r}
boxplot(data$nota~data$estudio, data = df, col = c("lightblue","lightgreen","lightpink","lightyellow"),
        main = "Diagrama de caja por Carrera")




```


*  ¿Observas algunos valores atípicos en el boxplot anterior? ¿A qué grupo pertence?

*  Indica a partir del boxplot anterior en qué grupo observamos más variedad de notas.

*  En base a todo lo anterior, ¿puedes afirmar de forma estadística que el examen de carrera ha ido mejor en algún estudio que en los demás?