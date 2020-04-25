---
title: "Histogramas"
output: github_document
---

## Representacion de Histogramas .

En R implementamos los histogramas con la funcion `hist()`, su sintaxis es:

"hist(x,breaks,freq,right",)"

* `x` Es el vector de datos.

* `breaks` Es el vector con los extremos de los intervalos o el numero $k$ d eintervalos.

* `freq=True` Produce el histograma de frecuencias absolutas si los intervalos son de la misma amplitud .

* `freq=FALSE` Produce el histograma de frecuencias Relativas.

* `right` funciona igual que la funcion cut que ya hemos visto anteriormente.

* `include-lowest = TRUE`  funciona igual que la funcion cut que ya hemos visto anteriormente.

* `hist` titula por defecto nuestro histograma como "Histogram of" seguido del nombre de nuestro vecto de datos.

* `mids` Contiene los puntos medios de los intervalos (Marcas de clase)

* `counts`Contiene el vector de frecuencias absolutas de los intervalos $"n_1,...,n_k"$

* `density` Contien el vector de densidades de los intervalos, estas se corresponden con las alturas de las barras del histograma de frecuencias relativas.

Ahora implementaremos una funcion para calcula histogramas de frecuencias absolutas mucho mas completos:

```{r}
HistTot = function(x,L){
  h = hist(x,breaks = L,right = FALSE,freq = FALSE,
           xaxt = "n",yaxt="n" ,col= "lightblue",
           main = "Histograma de frecuencias absolutas",
           xlab = "Intervalos & marcas de clase", ylab = "Frecuencias Absolutas")
  axis(1,at=L)
  text(h$mids, h$density/2, labels = h$counts, col = "pink")
}
#xaxt y yaxt -> Especifican que por ahora la funcion no dibuje el eje de las abscisas y ordenadas
```

* `axis(i,at=..)` Dibuja el eje correspondiente al valor de i con marcas en los lugares indicados por el vector definido mediante `at.` Si = 1 ,el de abcisas si i=2, el de ordenadas.

Podemos crear un histograma de frecuencias absolutas acumuladas:

```{r}
HistFreAc = function(x,L){
  h = hist(x,breaks = L,right = FALSE,freq = FALSE)
  h$density = cumsum(h$density)
  plot(h, freq = FALSE,xaxt="n",yaxt="n", col = "green",
       main = "Histograma de frecuencias\nabsolutas acumuladas",xlab="intervalos",
       ylab = "Frec Absolutas Acumuladas")
  axis(1,at=L)
  text(h$mids, h$density/2, labels = cumsum(h$counts), col = "purple")
}
```

