---
title: "Untitled"
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# EJEMPLO

Se lanza 30 veces un dado de 6 caras y anotamos los resultados obtenidos en cada lanzamiento.En este caso :

  * $n$ = 25.
  
  *Los distintos valores observados son:
  
      * X1 = 1, X2 =2,X3 = 3, X4 = 4, X5 = 5, X6 = 6
      
Nos interesa calcular las frecuencias de nuestro experimento, ademas las organizaremos en un data frame para poder observarlas de forma clara y sencilla.

```{r}
set.seed(2020)
dado = sample(1:6,25,replace = T)
set.seed(NULL)

```

Tablas de frecuencias:

```{r}
#Frecuecnias Absolutas
table(dado)
```

```{r}
#Frecuencias relativas

round(prop.table(table(dado)),2)
```

```{r}
#Frecuencias abs acu
cumsum(table(dado))
```
```{r}
#Frecuencias rel acu
round(cumsum(prop.table(table(dado))),2)
```

Creamos el dataset
```{r}
dados.df = data.frame(Observacioness = 1:6,
                      Frec.Abs = as.vector(table(dado)),
                      Frec.Rel = as.vector(round(prop.table(table(dado)),2)),
                      Frec.Acu = as.vector(cumsum(table(dado))),
                      Frec.Racum = as.vector(round(cumsum(prop.table(table(dado))),2)))
dados.df
                     
```

