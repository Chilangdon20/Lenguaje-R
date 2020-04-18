---
title: "Ejercicio de transfoirmacion de datos"
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Transformacion de datos Cuantitativos a datos Ordinales.
 Para este ejercicios vamos a considerar el dataframe datacrab y arreglaremos los datos.
 
```{r}
cangrejo = read.table("../data/datacrab.txt",header=TRUE)
cangrejo = cangrejo[,-1] #Para ignorara la primer columna
str(cangrejo)
```
 
 Podemos observar que la medida del cangrejo es mas numerica que ordinal , para verificar esto haremos lo siguiente:
```{r}
table(cangrejo$width)
```
 
 Podemos confirmar nuestra hipotesis por lo que necesitamos convertir del tipo de dato numerico a ordinal que agrupe las entradas de la variable original en niveles,para eso utilizaremos la funcnion cut , ya que esta dividira el vector numerico en intervalos de extremos los puntos que especificaremos en el argumento breaks.
 
```{r}
interv = cut(cangrejo$width,breaks = c(21,25,29,33,Inf), right = FALSE,labels = c("21-25","25-29","29-33","33-..."))
cangrejo$width.rank = ordered(interv)

```
 
 Si nos interesa estudiar a distribucion del ancho de los cangrejos segun el numero de colores,podemos calcular las tablas  bidimesiones de frecuencias relativas y relativas acomuladas.
 
```{r}
Table = table(cangrejo[,c(1,6)])
Table
```

Calculo de frecuecias relativas

```{r}
FrRel = round(prop.table(Table,margin = 1),3)
FrRel
```
Calculo de frecuencia relativa acumulada
```{r}
FrRAc = round(apply(prop.table(Table,margin =1),MARGIN = 1,FUN = cumsum),3)
t(FrRAc)
```

Graficamos las frecuencias relativas atraves de un diagrama de barras.

```{r}
blue = c("cyan","cyan4","cyan1","cyan3")
barplot(t(FrRel),beside = TRUE,legend = TRUE, ylim = c(0,1), col = blue,
        main="Diagrama de frecuencia relativa",args.legend = list(x = "topright", cex=0.55))
```

Diagrama de frecuencias relativas acumuladas

```{r}
barplot(FrRAc,beside = TRUE,legend = TRUE, ylim = c(0,1), col = blue,
        main="Diagrama de frecuencia relativa",args.legend = list(x = "topright", cex=0.55))
```

