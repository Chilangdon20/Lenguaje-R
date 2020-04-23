---
title: "Untitled"
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Ejercicio


Carga de datos

```{r}
data = InsectSprays
str(data)
```

```{r}
by(data$count, data$spray, FUN = summary)
```

```{r}
aggregate(count~spray, data = data,FUN = sd)
```
```{r}
boxplot(count~spray,data = data,col="lightgreen",xlab= "tipo de spray",ylab="Insectos muertos")
```

