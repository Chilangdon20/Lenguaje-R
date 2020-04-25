---
title: "Untitled"
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Ejercicio- Datos Agrupados.

```{r}
crabs = read.table("../data/datacrab.txt", header = TRUE)
cw = crabs$width
cw
```

Calcularemos los esadisticos de la variable con los datos agrupados, para rematar calcularemos algunos estadisticos basicos:

```{r}
Tabla = TablaFrec(cw,10,1.3,0.1)
Tabla
```

```{r}
Lcc = c(20.95,22.25,23.55,24.85,26.15,27.45,28.75,30.05,31.35,32.64,33.95)
TablaFrecL(cw,Lcc,FALSE)
```

Calculo de variable total de observaciones en el df:
```{r}
TOT = Tabla$FrAcAbs[10]
TOT
```

Calculo de la ancuhra media de los cangrejos:

```{r}
anchuraMedia = round(sum(Tabla$FrAbs*Tabla$mc)/TOT,3)
anchuraMedia
```

Claculo de varianza :

```{r}
anchuraVar = round(sum(Tabla$FrAbs*Tabla$mc^2)/TOT-anchuraMedia^2,3)
anchuraVar
```
Calculo desviacion Tipica:
```{r}
anchuraSt = round(sqrt(anchuraVar),3)
anchuraSt
```

Calculo de intervalo Modal:

```{r}
IModal = Tabla$intervalos[which(Tabla$FrAbs == max(Tabla$FrAcAbs))]
IModal
```

Tambien podemos calcular el intervalo critico para la mediana.

```{r}
ICritico = Tabla$intervalos[which(Tabla$FrAcRel >= 0.5)]
ICritico[1]
```

Calculo de estimacion de la mediana:

```{r}
n = TOT
Lccc = Lcc[4]
LcPos = Lcc[5]
Ac = Lcc[5]-Lcc[4]
NcAnt = Tabla$FrAcAbs[3]
nc = Tabla$FrAbs[4]
M = Lcc+Ac*((n/2)-NcAnt)/nc
M
median(cw)
```

Aproximacion de cuantiles imlpementando una funcion :

```{r}
AproxCuantile = function(Lcrit,Acrit,n,p,NcritAnt,ncrit){
  round(Lcrit*Acrit*(p*n-NcritAnt)/ncrit,3)
}
AproxCuantile(Lcc,Ac,n,0.25,NcAnt,nc)
AproxCuantile(Lccc,Ac,n,0.75,NcAnt,nc)
```

Calculo de cuantiles de datos reales:

```{r}
quantile(cw,0.25)
```

```{r}
quantile(cw,0.75)
```

