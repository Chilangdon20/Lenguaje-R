Untitled
================

## Ejercicio:

Se desea saber la opinion de 500 personas que tomaron el curso de
**“DATA-MINING”** en la plataforma Udemy, con la pregunta ¿Estas
satisfecho con el curso? .A lo cual las personsa tenian que responder
con un 1,2,3,4,5 dada la escala ordinal.

``` r
#Colocamos una semilla aleatoria.
set.seed(2020)
usuarios = sample(1:5, 100, replace = TRUE)
#Frecuencia Absoluta
table(usuarios)
```

    ## usuarios
    ##  1  2  3  4  5 
    ## 17 22 12 25 24

``` r
#Frecuencia relativa
prop.table(table(usuarios))
```

    ## usuarios
    ##    1    2    3    4    5 
    ## 0.17 0.22 0.12 0.25 0.24

Funcion `cumsum()` para el calculo de frecuencias acomuladas.

``` r
fAbs = table(usuarios) #Frec Abs
fAbs
```

    ## usuarios
    ##  1  2  3  4  5 
    ## 17 22 12 25 24

``` r
cumsum(fAbs) # Frec Abs Acomulada
```

    ##   1   2   3   4   5 
    ##  17  39  51  76 100

``` r
cumsum(prop.table(fAbs))#Frecuencias Rel Acomuladas
```

    ##    1    2    3    4    5 
    ## 0.17 0.39 0.51 0.76 1.00

Creamos un diagrama de barras de las frecuencias
absolutas

``` r
barplot(fAbs,main = "Diagrama de frecuencias absolutas",col = c("orange","blue"))
```

![](EjerciciosOrd_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

Creamos un diagrama de las frecuencias absolutas
acomuladas

``` r
barplot(cumsum(fAbs),main = "Diagrama de frecuencias absolutas",col = c("gold","blue"))
```

![](EjerciciosOrd_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

Calculamos las frecuencias relativas acomuladas de diferente forma:

``` r
cumsum(table(fAbs)/length(fAbs))
```

    ##  12  17  22  24  25 
    ## 0.2 0.4 0.6 0.8 1.0
