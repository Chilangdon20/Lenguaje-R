Analisis de datos Ordinales por Factor
================

## Funcion `cumsum()`

Para que nosotros podamos calcular frecuencias acumuladas en una tabla
bidimensional , hay que aplicar la funcion `cumsum()` mediante la
funcion `apply()`, la sintaxis seria:

`apply(NameTable,MARGIN=...,FUN = cumsum)`

Donde **MARGIN** es la dimensaino en la que queremos acumular dichas
frecuencias, recordemos que con el numero **1** - **FILAS** & numero
**2** - **COLUMNAS**-

Ejemplo: Queremos saber la opinion de los usuarios acerca de la nueva
funcion en facebook del COVID-19,para esto tenemos una nuestra de
**80000** personas.Clasificamos estos resultados en : \* Excelente \*
Bueno \* Agradable \* Conforme \* Inconforme

Supongamos que estas personas proveien de 4 paises
diferentes,MX,EUA,CA,ESP, de manera que:

  - 20000 participantes son de Mexico.
  - 20000 participantes son de Estados Unidos.
  - 15000 participantes son de Canada.
  - 25000 participantes son de España.

Dicho esto nos interesa estudiar la distribucion de las longuitudes
segun la
zona.

``` r
Answers = sample(c("Excelente","Bueno","Agradable","Conforme","Inconforme"), size = 80000,replace = T)
Paises = rep(c("MX","ESP","EUA","CAN"),c(20000,20000,15000,25000))
Total = data.frame(Paises,Answers)
str(Total)
```

    ## 'data.frame':    80000 obs. of  2 variables:
    ##  $ Paises : Factor w/ 4 levels "CAN","ESP","EUA",..: 4 4 4 4 4 4 4 4 4 4 ...
    ##  $ Answers: Factor w/ 5 levels "Agradable","Bueno",..: 3 1 1 2 3 5 5 1 1 1 ...

``` r
head(Total)
```

    ##   Paises    Answers
    ## 1     MX   Conforme
    ## 2     MX  Agradable
    ## 3     MX  Agradable
    ## 4     MX      Bueno
    ## 5     MX   Conforme
    ## 6     MX Inconforme

Realizado lo anterior calculamos las tablas de frecuencias absolutas
acumuladas de las longuitudes por paises.

``` r
t(apply(table(Total),MARGIN =1,FUN = cumsum))
```

    ##       Answers
    ## Paises Agradable Bueno Conforme Excelente Inconforme
    ##    CAN      4920  9949    14922     19965      25000
    ##    ESP      3970  7969    12058     16091      20000
    ##    EUA      3012  6014     8969     12018      15000
    ##    MX       4053  8005    11964     16014      20000

Ahora calculamos la tabla de frecuencia relativa acomulada por la
longuitud de pais

``` r
t(apply(prop.table(table(Total),margin =1),MARGIN =1,FUN = cumsum))
```

    ##       Answers
    ## Paises Agradable     Bueno  Conforme Excelente Inconforme
    ##    CAN   0.19680 0.3979600 0.5968800   0.79860          1
    ##    ESP   0.19850 0.3984500 0.6029000   0.80455          1
    ##    EUA   0.20080 0.4009333 0.5979333   0.80120          1
    ##    MX    0.20265 0.4002500 0.5982000   0.80070          1

Por ultimo vamos a realizar el diagrama de
Barras.

``` r
Grafico = apply(prop.table(table(Total),margin =1),MARGIN =1,FUN = cumsum)

barplot(Grafico,beside = TRUE,legend = TRUE, main= "Diagrama de frecuencias relativas acomuladas  por paises",
        args.legend = list(x="topleft",cex=0.55),col=c("red","blue","gold","pink","purple"))
```

![](Ultimo.md_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->
