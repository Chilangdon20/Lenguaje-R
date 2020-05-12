---
title: "Untitled"
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```


## Distribucion de Bernoulli

Si $X$ es variable aleatoria que mide el "número de éxitos" y se realiza un único experimento con dos posibles resultados (éxito, que toma valor 1, o fracaso, que toma valor 0), diremos que $X$ se distribuye como una Bernoulli con parámetro $p$

$$X\sim \text{Be}(p)$$

donde $p$ es la probabilidad de éxito y $q = 1-p$ es la probabilidad de fracaso.

- El **dominio** de $X$ será $D_X = \{0,1\}$
- La **función de probabilidad** vendrá dada por $$f(k) = p^k(1-p)^{1-k} =  \left\{
\begin{array}{rl}
     p & \text{si } k=1 
  \\ 1-p & \text{si } k=0
  \\ 0 & \text{en cualquier otro caso}
\end{array}
\right.$$

- La **función de distribución** vendrá dada por $$F(x) = \left\{
\begin{array}{rl}
     0 & \text{si } x<0 
  \\ 1-p & \text{si } 0\le x<1
  \\ 1 & \text{si } x\ge 1
\end{array}
\right.$$
- **Esperanza** $E(X) = p$
- **Varianza** $Var(X) = pq$


El codigo de la distribucion de Bernoulli:

En R tenemos las funciones del paquete **Rlab:**

  * dbern(x,prob) -> Funcion de densidad/x es el valor de dominio & prob = es la probabillidad de exito
  
  
  * pbenr(1,prob) -> Funcion de distribucion/q es el valor de dominio & prob = oBTENER LA FUNCION DE DISTRIBUCION
  
  
  
  * qbern(p,prob) -> q= Cuantil/prob = valor de dicho cuantil.
  
  
  
  * rbern(n,prob) -> Generar valores aleatorios.
  
Donde prob es la probabilidad de exio.

Sea $X = Be(p=0.7)$, la distribucion que modela la probabilidad de obtener una cara usando una moneda no etica.
```{r}
dbern(0,prob=0.7)
dbern(1,prob=0.7)
pbern(0,prob = 0.7)
pbern(1,prob = 0.7)
qbern(0.5,prob=0.7)
rbern(100,prob=0.7) -> data
hist(data,col=c("red","green4"))
```

## En Python:

```{python}
from scipy.stats import bernoulli
import matplotlib.pyplot as plt
p = 0.7
mean,var,skew = bernoulli.stats(p, moments= 'mvs')
python.reticulate=False
print("Media %s",mean)
print("Varianza %s",var)
print("Sesgo %f",skew)


```

