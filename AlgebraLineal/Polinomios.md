---
title: "Untitled"
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Polinomios 

Asi definimos un polinomio en R

```{r}

p = polynomial(coef = c(1,2,3,4,5))
q = polynomial(coef = c(1,2,1))                     
```

Comprobamos si los polinomios son iguales :
```{r}
p==q
```

Calculo de grado de un polinomio:

```{r}
gradoP = length(p)-1
gradoQ = length(q)-1

```

Suma y Producto de polinomios:

```{r}
#Suma
p+q
#Multiplicacion
p*q
```

Division de polinomios:
```{r}
cociente = p/q
resto = p%%q
cociente
resto

```

Evaluar polinomios
```{r}
predict(p,1)
predict(p.0)
```

Raices de un polinomio
```{r}
polyroot(c(1,2,1))
polyroot(c(-4,0,2))
```

