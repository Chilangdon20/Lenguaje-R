Accidentes.data <- data.frame(
  Accidentes_Automovil = c("vuelta incorrecta","alta velocidad","acercarse demasiado","violaciones al derecho del paso","manejar a la izquierda del centro","rebase inadecuado","otros"),
  
  Porcentaje = c(3.6,28.1,8.1,30.1,3.3,3.2,23.6),
  
  stringsAsFactors = FALSE
  
)

Accidentes.data

attach(Accidentes.data)
names(Accidentes.data)

library(qcc)

#variable etiquetada
Tipo <- Porcentaje
names(Tipo) <- Accidentes_Automovil
Tipo


pareto.chart(Tipo,col=rainbow(length(Tipo)),main="Pareto De Accidentes De Auto")

Tabla <- pareto.chart(Tipo)


write.csv(Tabla,"Tabla_Frecuencias.csv")

datos <- data.frame(
  
  Num_subgrupo = seq(1,25,1),
  
  fecha = c("12/26","12/26","12/26","12/26","12/26","12/27","12/27",
            "12/27","12/27","12/27","12/28","12/28","12/28","12/28",
            "12/28","12/29","12/29","12/29","12/29","12/29","12/30",
            "12/30","12/30","12/30","12/30"),
  
  x1 = c(35,46,34,69,38,42,44,33,48,47,38,37,40,38,50,33,41,38,35,56,38,
         39,42,43,39),
  x2 = c(40,37,40,64,34,41,41,41,44,43,41,37,38,39,42,35,42,44,41,55,40,42,
         39,36,38),
  
  x3 = c(32,36,34,68,44,43,41,38,47,36,39,41,47,45,43,29,29,28,37,45,45,35,39
         ,35,43),
  x4 = c(37,41,36,59,40,34,46,36,45,42,38,37,35,42,45,39,34,58,38,48,37,40,
         36,38,44),
  
  rango = c(0.08,0.10,0.06,0.10,0.10,0.09,0.05,0.08,0.04,0.11,0.03,0.04,0.12,0.07,0.08,0.10,
            0.12,0.30,0.06,0.11,0.08,0.07,0.06,0.08,0.06),
  
  stringsAsFactors = FALSE
  
)


library(qicharts)


datos$x.bar <- rowMeans(datos[,3:6])


qic(datos$x.bar,chart="i",main="Profundidad de chavetero",xlab="numero de subgrupo",
    ylab="Promedio")

qic(datos$rango,chart="i",main="Profundidad de chavetero",xlab="numero de subgrupo",
    ylab="Rango")


dev.off()

x11()
matrix(c(1:2), nrow=1, byrow=FALSE)
layout(matrix(c(1:2), nrow=1, byrow=FALSE))

layout.show(2)

cause.and.effect(cause=list(Estancamiento=c("Dificultad de materias","Flojera","Crisis de autoestima"),
                            Falta_de_conocimientos=c("Bajos conocimientos previos","Falta de interés","Baja retencion de informacion"),
                            Examenes_extraordinarios=c("Mal aprendizaje en cursos ordinarios","Enseñanza ineficiente","Falta razonamiento"),
                            Distancia_de_Traslado=c("Inseguridad","Tiempo de recorrido","Falta de automovil propio.")),
                            effect="Deserción de la licenciatura Matemáticas Aplicadas y Computación ")
