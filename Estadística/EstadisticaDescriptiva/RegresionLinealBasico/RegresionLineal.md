---
title: "Untitled"
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Introduccion minima a a la Regresion Lineal.

Carga de datos.

```{r}
data = read.table("/Users/familiavs/Documents/r-basic-master/data/bodyfat.txt",header=TRUE)
head(data,4)
```

Separamos las variables con las que trabajaremos.

```{r}
data2 = data[,c(2,4)]
names(data2) = c("Grasa","Peso")
str(data2)
```
 Comprobamos que los datos esten corectamente extraidos.
```{r}
head(data2,5)
```
 
Ahora haremos la representacion grafica de as variables que extraimos, esta nos permite darnos una idea de los datos que tenemos.
```{r}
old.par <- par(no.readonly = TRUE)
 
par(bg = "white")
par(col.axis = "darkturquoise")
par(col.lab = "black")
par(font.axis = 4)
par(font.lab = 4)

 
plot(data2)
 
u <- par("usr")
 
rect(u[1], u[3], u[2], u[4], col = "gray4",
     border = "dimgray", lwd = 10)
abline(regresion,col="red")
points(data2, col = c("#99ff99","blue"), pch = 19)
```

# Calculo de Recta de regresion.

Es muy importante que para calcular la **recta de regresion**  tomando en cuenta los puntos $(x_i,y_i)i=1,2,3...n$ y si $(x_i)i=1...n$ es un vector e $(y_i)i=12,..n$ otro, entonces la rect de regresion se calcula mediante ``lm(y~x,data=dataframe)``.

## OBSERVACION:

Hay que tomar en cuenta que primero va el valor de las variables dependientes & despues las variables independientes.

```{r}
regresion <-lm(Peso~Grasa,data=data2)
summary(regresion)
```
Esto significa que la recta de regresion para nuestro conjunto de datos es:

$y = 2.151x+137.738$

Ahora podemos hacer uso de esta recta en nuestro grafico usando la funcion ``abline``

```{r}
old.par <- par(no.readonly = TRUE)
 
par(bg = "gray81")
par(col.axis = "darkturquoise")
par(col.lab = "black")
par(font.axis = 4)
par(font.lab = 4)

 
plot(data2)
 
u <- par("usr")
 
rect(u[1], u[3], u[2], u[4], col = "aliceblue",
     border = "darkgoldenrod1", lwd = 10)
abline(regresion,col="deeppink")
points(data2, col = c("#99ff99","blue"), pch = 19)
```

## Coeficiente de Determinacion.

Hay que tener en cuenta que en la practica anterior solamente fue descriptivo , es decir solo hemos mostrado que estos datos son consistentes en una funcion lineal , pero no hemos deomstrado que la variable depeendiente sea una funcion aproximadamente lineal de la variable dependiente, para esto necesitamos una demostracion matematica.

Hay que entender que el **coef de determinacion**,$R^2$ nos es util para evaluar numeriacmente si la relacion lineal es significativa o no,por el momento y debido a qu eaun no tenemos conocimientos avanzados solo necesitamos saber que este coeficiente se encuentra en el intervalo $[0,1]$, si $R^2$ es mayor a 0.9 cibsuderamos que nuestro ajuste es bueno, en caso contrario no.


La funcion **summary** aplicada a **lm** nos muestra los contenidos de dicho objeto , entre ellos se encuentra **Multiple R-squared** que nos indica el coef de determinacion $R^2$, en este caso aplicaremos la funcion ``summary(lm(...)$r.squared)``.

```{r}
summary(regresion)$r.squared
```

Podemos concluir que nuestro modelo de regresion no ajustaria bien a los datos debido a que el coef de determinacion esta muy por debajo del 0.9.

## Transformaciones logaritmicas.

Tomando en cuenta que no siempre tendremos dependencias lineales , i.e aveces nos encontraremos con expresiones exponenciales, o potenciales para eso sirven las transformaciones logaritmicas mediante un cambio de escala.

Es habitual encontrarnos graficos con sus ejes en escala lieal , pero aveces es conveniente dibujar alguno de los ejes en escala logaritmica, de modo que la misma distancia entre marcas significa el cociente entre sus valores, traducido podemos decir que un **eje en escala logaritmica representa el logarimo de sus valores en escala lineal**

Un grafico esta en escala **semilogaritmica** cuando su eje de abcisas esta en escala **lineal** y el de ordenadas en escala **logaritmica**

Un grafico esta en escala **doble logaritmica** cuando ambos ejes estan en escala logaritmica.

Si al representar unos puntos en escala semilogaritmica, observaremos aue siguen una recta , por lo tanto sigue una ley aproximadamente **exponencial**.

Si al representar unos puntos en escala doble logaritmica observamos que siguen aproximadamente una recta , esto querra decir que los valores siguen una ley aproximadamente **potencial**


