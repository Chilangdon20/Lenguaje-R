---
title: "Medidas"
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Medidas de Tendencias Central

Ejemplo:
```{r}
edad = sample(1:60,25,replace = TRUE)
#Ordenamos los datos por su orden natural.
sort(edad)
```

Creamos la tabla de frecuencia absoluta.

```{r}
#Media
mean(edad)
#Mediana
median(edad)
#Moda
as.numeric(names(which(table(edad)==max(table(edad)))))
```

