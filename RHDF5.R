# Instala el paquete RDHF5 atravez del Bioconductor 
# esta direccion cargara la funcion bioCLite
# cargara los paquetes base de bio 
#source("https://bioconductor.org/biocLite.R")
# Usamo el comando para cargar el paquete RHDF5
#biocLite("rhdf5")
#instalamos la libreria 
library(rhdf5)
#creamos archivos hdf5 como ejemplos para trabajar 
created <- h5createFile("example.h5")
created
# creamos grupos dentro del archivo
created <- h5createGroup("example.h5","foo")
created <- h5createGroup("example.h5","baa")
created <- h5createGroup("example.h5","foo/foobaa")
#vemos como estan 
h5ls("example.h5")
# escribamos en los grupos matrices dimencional A y multidimencional B
A<- matrix(1:10, nr = 5, nc = 2)
h5write(A, "example.h5", "foo/A")
B <- array(seq(0.1, 2.0, 0.1), dim=c(5,2,1))
#podemos darle atributos 
attr(B, "scale")<- "liter"
h5write(B, "example.h5", "foo/foobaa/B")
#vemos como estan 
h5ls("example.h5")
#escribimos un grupo de datos en el nivel superior 
#creamos un marco de  datos 
df<- data.frame(1L:5L, seq(0, 1, length.out= 5), c("ab", "cde", "fghi", "a", "s"),
               stringsAsFactors = FALSE )
h5write(df, "example.h5", "df")
h5ls("example.h5")
# leer los datos 
readA<- h5read("example.h5","foo/A")
readB<- h5read("example.h5","foo/foobaa/B")
readdf<- h5read("example.h5","df")
readA
#Se puede escribir en trozos vamos) a ingresar datos en A
h5write(c(12, 13, 14), "example.h5","foo/A", index = list(1:3, 1))

