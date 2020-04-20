---
title: "Untitled"
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Tipos de medias en Matematicas.

Calculo de Medias del vector x

```{r}
x = sample(1:20,8,replace = T)
n = length(x)
```

## Media Aritmetica.

$$\bar{x} = \frac{1}{n}\sum_{i=1}^n x_i$$

```{r}
mean(x)#Es equivalente a la funcion mean
```

## Media Aritmetica Ponderada.

$${\displaystyle \bar{x}=\frac{\sum_{i=1}^{k}\left(w_{i}*x_{i}\right)}{n}}$$

```{r}
w = c(1,1,1,6,1,7,1,1)
sum(w*x)/sum(w)
```

#Media Geometrica

$$MG = \sqrt[n]{(x_{1})(x_{2}) \cdots (x_{n})}$$

```{r}
prod(x)^(1/n)
```

# Media Ponderada

$$\bar{x}_N = \frac{n}{\sum_{i=1}^n\frac{1}{x_i}}$$

```{r}
n/sum(1/x)
```

