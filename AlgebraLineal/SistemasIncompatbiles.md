# Sistemas Incompatbiles

Dado el siguiente sistema de ecuaciones lineales:

$ x + y - z = 2$

$ x -y +z = 1$

$3x + y - z = 5 $


```R
A = matrix(c(1,1,-1,1,-1,1,3,1,-1), byrow = TRUE, nrow = 3, ncol=3)
b = c(2,1,5)
Ab = cbind(A,b)
```

Comprobamos los rangos de las matriz de coef y de Ab obtenemos:



```R
c(R(A),R(Ab))
```


```R
all.equal(R(A),R(Ab))
```

Sin embargo cabe mencionar que aunque los rangos sean iguales , el numero de incognitas es 3 porlotanto por el teo de rouche concluimos que se trata de un sistema compatible indeterminado.


```R
echelon(Ab)
```

En este caso nos esta indicando que la variable x3 es libre. i.e puede tomar cualquier valor en R

En caso de no verlo tan claro la funcion `Solve()`lo muestra:


```R
Solve(A,b, fractions = TRUE)
```


```R

```
