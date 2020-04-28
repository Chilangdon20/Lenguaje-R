---
title: "Untitled"
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Densidades & Funciones de distribucion.

En loshistogramas vistos anteriormente es comun superponer una curva que estime la densidad de la distribucion de la variable cuantitativa definida por la caracteristica que se esta midiendo, la **densidad** de una variable es una curva cuya area comprendida etre el eje de las abcisas y la propia curva sobre un intervalo es igual a la fraccion de individuos de la poblacion que caen dentro de ese interval.

**CAMPANA DE GAUSS**

Esta se corresponde con una variable que siga una distribucion normal, la forma de la campana depende de 2 parametros: La media y la desviacion tipica.

Con la fucnion **density** al aplicarla a un conjunto de datos produce una lista que incluye los vectores x e y que contiene la primera y segunda cordenada de los puntos.

Al aplicar plot o lines a este resultado segun sea el caso obtenedremos la grafica de la curva.

**FUNCION PARA EL CALCULO DE HIT DE FRECUENCIAS RELATIVAS**

```{r}
HistRel = function(x,L){
  h = hist(x,breaks = L,right = FALSE,plot=FALSE)
  t = round(1.1*max(max(density(x)[[2]]),h$density),2)
  plot(h,freq = FALSE, col = "Yellow",
       main = "Hist de Frec Relativas & curva de densidad",
       xaxt="n",ylim = c(0,t), xlab = "Intervalos", ylab = "Densidades")
  axis(1,at=L)
  text(h$mids,h$density/2,labels = round(h$counts/length(x),2), col = "blue")
  lines(density(x),col="purple", lwd=2)
}
```

Cabe mencionar que la funcion de distribucion nos permite que en cada punto nos da la fraccion de individuos de la poblacion que caen a la izquierda de este punto ie su frecuencia relativa acumulada.
 En general la funcion de distribucion de un valor $n$ se obtiene hallando la funcion de densidad que hay a la izquierda del valor.
 
## Fucnion para calcular la frecuencia relativa acummulada.

```{r}
hisRelCum = function(x,L){
    h = hist(x,breaks = L,right = FALSE,plot=FALSE)
    h$density = cumsum(h$counts)/lenght(x)
    plot(h,freq = FALSE, col = "Yellow",
       main = "Hist de Frec Acumuladas  & curva de distribucion estimada",
       xaxt="n",ylim = c(0,t), xlab = "Intervalos", ylab = "Densidades")
  axis(1,at=L)
  text(h$mids,h$density/2,labels = round(h$counts/length(x),2), col = "blue")
  dens.x = density(x)
  dens.x$y = cumsum(dens.x$y)*(dens.x$x[2]- dens.x$x[1])
  lines(dens.x,col="purple", lwd=2)
}
```

