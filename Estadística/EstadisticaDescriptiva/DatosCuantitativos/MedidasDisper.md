---
title: "Medidas De Dispercion"
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```



# Medidas De Dispersion

```{r}
dado = sample(1:6,25,replace = T)
table(dado)
```

## Valores min & max

```{r}
min(dado)
max(dado)
```

## Rango & Rango Intercuantilico.

```{r}
diff(range(dado))
IQR(dado)
```

## Varianza Muestral

```{r}
var(dado)
```

## Desviacion tipica muestral

```{r}
sd(dado)
```

## Varianza
```{r}
n = length(dado)
var(dado)*(n-1)/n
```

## Desviacion Tipica
```{r}
sd(dado)*sqrt((n-1)/n)
```

