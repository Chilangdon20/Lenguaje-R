---
title: "Untitled"
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Medidas De Posicion

Ejemplo:

Consideremos un expermiento en el que lanzamos 50 veces un dado de 4 caras y obtenemos los siguientes resultados:

```{r}
set.seed(2020)
frieze = sample(1:4, 50 , replace = TRUE)
set.seed(NULL)
length(frieze)
```

Ordenamos los datos
```{r}
frieze = sort(frieze)
frieze
```

Construimos un dataframe con los resultados y las distintas tablas de datos:

```{r}
df.frieze = data.frame(Puntuacion = 1:4,
                       Fr.Abs = as.vector(table(frieze)),
                       Fr.Rel = as.vector(round(prop.table(table(frieze)),2)),
                       Fr.Acu = as.vector(cumsum(table(frieze))),
                       Fr.Racu = as.vector(round(cumsum(prop.table(table(frieze))),2)))
df.frieze
```

Una forma de localizar los cuantiles es fijandonos en la lista ordenada de puntuaciones, el cuantil $Q0.3$ seria el primer elemento de dicha lsta que fuera mayor o igual que como minimo, el 30%de los datos.
```{r}
frieze[15]
```

# Ejemplo -02

```{r}
dado2= sample(1:6,15,replace=T)
quantile(dado2,0.2)
quantile(dado2,0.9)
```

