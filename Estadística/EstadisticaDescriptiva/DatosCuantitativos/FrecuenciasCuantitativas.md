---
title: "Frecuecnias de Datos Cuantitativos."
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Frecuencias en Datos Cuantitativos.

En los datos Cuantitativos al momento de calcular las frecuencias es necesario observar que no se tienen en cuenta todos los niveles posibles, si no unicamente los observados.

## Ejemplo -01

Se han pedido las edades de 25 clientes de una tienda de automoviles.Las respuetas obtenidas son la siguientes:

```{r}
edades = sample(15:85,25,replace=TRUE)
edades
```

Recordar que solamentre nos interesan las rrefuencias de las edades observadas, i.e solamente nos interesa.
```{r}
table(edades)
```

Calculamos el resto de frecuencias

```{r}
#Frecuencias Relativas.
round(prop.table(table(edades)),3)
```

```{r}
#Frecuencias Acumuladas
cumsum(table(edades))
```

```{r}
#FrecRelAcu
round(cumsum(prop.table(table(edades))),2)
```

