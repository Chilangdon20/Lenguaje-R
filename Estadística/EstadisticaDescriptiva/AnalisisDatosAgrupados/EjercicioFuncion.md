---
title: "Uso de funciones "
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## EJEMPLO 

```{r}
hist(cw, breaks = L, right = FALSE, main = "Histograma de las anchuras de los cangrejos",col="red")
```

Nos adentramos a la estructura interna de nuestro histograma:

```{r}
hist(cw,breaks = L,right = FALSE,plot = FALSE)
```

Usamos las funciones que definimos anteriormente:

```{r}
histAbs(cw,L)
```

```{r}
histAbsCum(cw,L)
```

Añadimos la funcion rug para observar donde estan ubicados los datos dentro de la clase:

```{r}
histAbs(cw,L)
rug(cw)
```

Ahora calcularemos la densidad de nuestro dataset y la representaremos con nuestra funcion
```{r}
str(density(cw))
```

```{r}
histRel(cw,L)
```

Agregamos una campana para poder compara nuestros graaficos:
```{r}
histRel(cw,L)
curve(dnorm(x,mean(cw), sd(cw)), col="cyan4", lty=4,lwd=2,
            add=TRUE)
legend("topright", lwd=c(2,2), lty = c(1,4), col = c("purple","cyan4"),
       legend=("densidad aprox","densidad normalº"))
```

Pr ultimo dibujamos el histograma relativo acumulado:

```{r}
histRelCum(cw,L)
```

