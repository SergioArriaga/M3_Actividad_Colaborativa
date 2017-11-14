# M3_Actividad_Colaborativa
A continuación se explican los pasos seguidos para hacer más práctico la explotación de este fichero de datos que contiene todos los restaurantes de la isla de Tenerife 
http://datos.gob.es/es/catalogo/l03380011-hosteleria-y-restauracion


Enlace descarga dataset: http://www.tenerifedata.com/dataset/8f1efe35-483c-41fd-9087-1faf20b2bf4a/resource/8e6ecc86-cc85-4746-8bdd-8e2aa85b5b1e/download/hosteleriayrestauracion.csv
```[R]
# Establecer espacio de trabajo
setwd("C:/Práctica en R/Actividad colaborativa/scripts")
# Comprobamos
getwd()
#Limpiamos objetos de nuestro entorno de trabajo
rm(list=ls())
# Creamos carpeta datos que contendrá dataseet original
if (!file.exists("../datos")){
  
  dir.create("../datos")
}
# Descargamos dataseet en la carpeta datos, será el original y sobre el que no haremos modificaciones
fileURL <- "http://www.tenerifedata.com/dataset/8f1efe35-483c-41fd-9087-1faf20b2bf4a/resource/8e6ecc86-cc85-4746-8bdd-8e2aa85b5b1e/download/hosteleriayrestauracion.csv"
download.file(fileURL,destfile="../datos/HosteleriaTenerife.csv",method="auto")
list.files("../datos")
fechaDescarga<- date()#guardamos la fecha de descarga en la variable date
fechaDescarga
# Librerias
library(knitr)
# Leemos fichero
con <- file(fileURL,"r")
restTenerife <- read.csv2(con, sep = ",",  header = TRUE )
close(con)
View(restTenerife)#visualizamos tabla de datos
kable(head(restTenerife[,1:5])) 
# dimensiones dataset
dim(restTenerife) #total filas y columnas
names(restTenerife)#visualizamos variables filas
# Eliminamos columnas que no aportan información alguna
# clase,ref,fot,tar,act
restTenerife <-restTenerife[ , -c(1,7,13,14,15)]
View(restTenerife)#visualizamos tabla de datos
# Visualizamos si hay problemas con la Ñ
length(grep("Ã±",restTenerife$nombre))
length(grep("Ã±",restTenerife$dir))
length(grep("Ã±",restTenerife$email))
# Visualizamos si hay problemas con las tildes en las vocales
# tilde en a
length(grep("Ã¡",restTenerife$nombre))
length(grep("Ã¡",restTenerife$dir))
length(grep("Ã¡",restTenerife$email))
# tilde en e
length(grep("Ã©",restTenerife$nombre))
length(grep("Ã©",restTenerife$dir))
length(grep("Ã©",restTenerife$email))
# tilde en o
length(grep("Ã³",restTenerife$nombre))
length(grep("Ã³",restTenerife$dir))
length(grep("Ã³",restTenerife$email))
# tilde en u
length(grep("Ãº",restTenerife$nombre))
length(grep("Ãº",restTenerife$dir))
length(grep("Ãº",restTenerife$email))
# tilde en i
length(grep("Ã",restTenerife$nombre))
length(grep("Ã",restTenerife$dir))
length(grep("Ã",restTenerife$email))
# Corregimos
# restTenerife$nombre <- replace(restTenerife$nombre,restTenerife$nombre=="Ã±", "ñ")

### Corregimos Ñ
if (length(grep("Ã±",restTenerife$nombre)) >=1){
  restTenerife$nombre<-gsub("Ã±", "ñ",restTenerife$nombre)
}
if (length(grep("Ã±",restTenerife$dir))>=1){
  restTenerife$dir<-gsub("Ã±", "ñ",restTenerife$dir)
}

if (length(grep("Ã±",restTenerife$email))>=1){
  restTenerife$email<-gsub("Ã±", "ñ",restTenerife$email)
}

## Corregimos tilde en a

if (length(grep("Ã¡",restTenerife$nombre))>=1){
  restTenerife$nombre<-gsub("Ã¡", "á",restTenerife$nombre)
}
if (length(grep("Ã¡",restTenerife$dir))>=1){
  restTenerife$dir<-gsub("Ã¡", "á",restTenerife$dir)
}
if (length(grep("Ã¡",restTenerife$email))>=1){
  restTenerife$dir<-gsub("Ã¡", "á",restTenerife$email)
}

## Corregimos tilde en e
if (length(grep("Ã©",restTenerife$nombre ))>=1){
  restTenerife$nombre<-gsub("Ã©", "é",restTenerife$nombre)
}

if (length(grep("Ã©",restTenerife$dir))>=1){
  restTenerife$dir<-gsub("Ã©", "é",restTenerife$dir)
}

if (length(grep("Ã©",restTenerife$email))>=1){
  restTenerife$email<-gsub("Ã©", "é",restTenerife$email)
}
## Corregimos tilde en o
if (length(grep("Ã³",restTenerife$nombre ))>=1){
  restTenerife$nombre<-gsub("Ã³", "ó",restTenerife$nombre)
}

if (length(grep("Ã³",restTenerife$dir))>=1){
  restTenerife$dir<-gsub("Ã³", "ó",restTenerife$dir)
}

if (length(grep("Ã³",restTenerife$email))>=1){
  restTenerife$email<-gsub("Ã³", "ó",restTenerife$email)
}

## Corregimos tilde en u
if (length(grep("Ãº",restTenerife$nombre))>=1){
  restTenerife$nombre<-gsub("Ãº", "ú",restTenerife$nombre)
}

if (length(grep("Ãº",restTenerife$dir))>=1){
  restTenerife$dir<-gsub("Ãº", "ú",restTenerife$dir)
}

if (length(grep("Ãº",restTenerife$email))>=1){
  restTenerife$email<-gsub("Ãº", "ú",restTenerife$email)
}
## Corregimos tilde en i
if (length(grep("Ã",restTenerife$nombre ))>=1){
  restTenerife$nombre<-gsub("Ã", "í",restTenerife$nombre)
}

if (length(grep("Ã",restTenerife$dir))>=1){
  restTenerife$dir<-gsub("Ã", "í",restTenerife$dir)
}

if (length(grep("Ã",restTenerife$email))>=1){
  restTenerife$email<-gsub("Ã", "í",restTenerife$email)
}
# Comprobamos
View(restTenerife)#visualizamos tabla de datos
length(grep("Ã±",restTenerife$nombre))
length(grep("Ã±",restTenerife$dir))
length(grep("Ã±",restTenerife$email))
# tilde en a
length(grep("Ã¡",restTenerife$nombre))
length(grep("Ã¡",restTenerife$dir))
length(grep("Ã¡",restTenerife$email))
# tilde en e
length(grep("Ã©",restTenerife$nombre))
length(grep("Ã©",restTenerife$dir))
length(grep("Ã©",restTenerife$email))
# tilde en o
length(grep("Ã³",restTenerife$nombre))
length(grep("Ã³",restTenerife$dir))
length(grep("Ã³",restTenerife$email))
# tilde en u
length(grep("Ãº",restTenerife$nombre))
length(grep("Ãº",restTenerife$dir))
length(grep("Ãº",restTenerife$email))
# tilde en i
length(grep("Ã",restTenerife$nombre))
length(grep("Ã",restTenerife$dir))
length(grep("Ã",restTenerife$email))

# Eliminamos los valores '0' de la columna fax pues se trata de un error
restTenerife$fax<-gsub("0", NA,restTenerife$fax)
# Renombramos columna lng a long de longitud por claridad
names(restTenerife)[11] ="long"
# Renombramos columna tf a telefono fijo (ya que nuestra intención es dividir entre fijo/móvil)
names(restTenerife)[9] ="telefono_fijo"
# añadimos nueva columna movil
restTenerife$movil=restTenerife$telefono_fijo
View(restTenerife)
# Eliminar numeración movil de la columna telefono_fijo
restTenerife$telefono_fijo<-gsub('[6]', NA ,restTenerife$telefono_fijo)
# Eliminar numeración fija de la columna movil
restTenerife$movil<-gsub('[9]', NA ,restTenerife$movil)
# Ponemos la columna movil justo despues de la columna telefono_fijo
restTenerife = restTenerife[ , c(1,2,3,4,5,6,7,8,9,13,10,11,12)]
# Para simplificar columnas unificamos la columna sigla(calle, avenida,carretera,plaza) y dir 
# elimando la columna sigla
pruebas<-restTenerife[ ,3:4]#Creamos dataframe temporal con estas dos variables
pruebas<-apply(pruebas,1, paste,collapse=" ")#Sobre dataframe pruebas concatenamos los datos separandolos con espacio
restTenerife$dir<-pruebas#Asignamos valores ya concatenados a la variable dir
restTenerife <-restTenerife[ , -c(3)]#Eliminamos columna sigla

```


# Guardamos el archivo csv de los datos procesados
```
[R]
outputFileName <- paste0("../datos/HosteleriaTenerife_tidy ",format(Sys.time(),"%Y-%m-%d_%H-%M-%S"),".csv")
outputFileName
#Guardamos tabla en formato CSV sin indices por filas y valores NA sean celdas en blanco
write.csv2(as.data.frame(restTenerife), outputFileName, row.names = FALSE, na="")
```


