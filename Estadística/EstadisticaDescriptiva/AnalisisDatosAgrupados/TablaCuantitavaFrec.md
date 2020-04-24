---
title: "Untitled"
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Agrupando datos con R `hist()`

Genera un histograma de frecuecnias ,cuyo componente count es el vector de frecuencias absolutas de las clases.Por lo tanto para calcular estas frecuecnias podemos usar la sintaxis:

          `hist(x,breaks = ...,right= FALSE,plot=False)$count` 
          

Cabe mencionar que conviene igualar el parametro `breaks` al vector de extremos del intervalo debido a que cut e hist hacen uso de diferentes metodos para agrupar los datos cuando se especifica solamente el numero k de clases.

`mids` contiene las marcas de clase.

## Automatizacion de tablas de frecuencias.

En caso de que nosotros vayamos a tomar todas las clases de la misma amplitud.Sus parametros son:

  * El vector de datos cuantitativos.
  
  * El numero de clases.
  
  * Su amplitud.
  
  * La precision de los datos(P=1 -> Unidades, p=0.1 -> decimas)
  
Por otra parte si conocemos los extremos de las clases sus parametros son:

  * $x$ -> Vector de datos cuantitativos.
  
  * $L$ -> Vector de extremos de clases.
  
  * Un valor logico `TRUE` -> Si queremos que el intervalo sea cerrado O `FALSE`-> Intervalo abierto.
  
  
## Tabla - 01.

```{r}
#En caso de que nosotros vayamos a tomar todas las clases de la misma amplitud.

#TablaFrecuencias
                                     
 TablaFrec = function(x,k,A,p){              # x=Datos,k=No de divisiones,A/amplitudeclases,p=Presicion
   L = min(x)-p/2+A*(0:k)                    # Extremo de intervalos
   x_cut = cut(x,breaks = L,right = FALSE)   # Dividir los datos en intervalos [x,x)
   intervalos = levels(x_cut)                # Extraer los niveles de cut
   mc = (L[1]+L[2])/2+A*(0:(k-1))             # PuntoMedio
   FrAbs = as.vector(table(x_cut))           # Conversion a vector la tabla de frecuencias de x_cut
   FrRel = round(FrAbs/length(x),4)           # Redondeamos para no alargar el No de digitos.
   FrAcAbs = cumsum(FrAbs) 
   FrAcRel = cumsum(FrRel)
   tabla = data.frame(intervalos,mc,FrAbs,FrRel,FrAcAbs,FrAcRel)  # Creacion de la tabla de los intervalos creados.
   tabla
 }
```

En este caso usaremos el df Iris para probar nuestras tablas:

```{r}

TablaFrec(petalos, k = 8,A = 1,p=0.1)

```


## Tabla - 02.

```{r}
# Si conocemos los extremos de las clases.

TablaFrecL = function(x,L,V){         # En este caso ya conocemos los extremos "L" y la variable V por si queremos abrir o cerrar intervalos
  x_cut = cut(x,breaks = L,right=FALSE,include.lowest = V)
  intervalos = levels(x_cut)
  mc = (L[1:(length(L)-1)]+L[2:length(L)])/2
  FrAbs = as.table(table(x_cut))
  FrRel = round(FrAbs/length(x),4)
  FrAcAbs = cumsum(FrAbs) 
  FrAcRel = cumsum(FrRel)
  tabla = data.frame(intervalos,mc,FrAbs,FrAcAbs,FrRel,FrAcRel)
  tabla
}
```

Ejemplo:
```{r}
TablaFrecL(petalos, L = 1:8 , V = FALSE)
```


```{r}
crab = read.table("/Users/familiavs/Documents/r-basic-master/data/datacrab.txt")
cw = crab$V4
TablaFrecL(cw,L,FALSE)
```

