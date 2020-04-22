# Sistemas compatibles determinados.

Dado el siguiente sistema de ecuaciones lineales, calculemos su solucion:

$x1 + x2 +2x3 = 9$

$2x+4x2-3x3=1$

$3x+6x2 -3x3=0$

Lo pasamos a su forma matricial:


```R
A = rbind(c(1,1,2),c(2,4,-3),c(3,6,-5))   #Recordemos que rowbind es para escribir por filas
b = c(9,1,0)
Ab = cbind(A,b)
```

Comprobamos que el rango de A es igual al de Ab para ver si el sistema es compatible


```R
qr(A)$rank==qr(Ab)$rank
```


TRUE


En efecto , ahora comprobamos si es igual al numero de incognitas , para ver si es compatible determinado:


```R
qr(A)$rank==3
```


TRUE


Ahora por el teo de **Rouch-Frob** resolvemos:


```R
solve(A,b)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>0.999999999999987</li><li>2.00000000000001</li><li>3</li></ol>



Por lo tanto la solucionde nuestro sistema es:

 $X1=1$
 
 $X2 = 2$
 
 $X3 = 3$

Si queremos comprobar nuestra solucion solo tenemos que sustituir los valores en el sistema:


```R
sol = c(1,2,3)
A%*%sol
```


<table>
<caption>A matrix: 3 × 1 of type dbl</caption>
<tbody>
	<tr><td>9</td></tr>
	<tr><td>1</td></tr>
	<tr><td>0</td></tr>
</tbody>
</table>




```R

```
