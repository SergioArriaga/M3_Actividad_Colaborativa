#Establecer espacio de trabajo
setwd("C:/Pr�ctica en R/Actividad colaborativa/scripts")
#Comprobamos
getwd()
#Limpiamos objetos de nuestro entorno de trabajo
rm(list=ls())
#Creamos carpeta datos que contendr� dataseet original
if (!file.exists("../datos")){
  
  dir.create("../datos")
}
#Descargamos dataseet en la carpeta datos, ser� el original y sobre el que no haremos modificaciones
fileURL <- "http://www.tenerifedata.com/dataset/8f1efe35-483c-41fd-9087-1faf20b2bf4a/resource/8e6ecc86-cc85-4746-8bdd-8e2aa85b5b1e/download/hosteleriayrestauracion.csv"
download.file(fileURL,destfile="../datos/HosteleriaTenerife.csv",method="auto")
list.files("../datos")
fechaDescarga<- date()#guardamos la fecha de descarga en la variable date
fechaDescarga
#Librerias
library(knitr)
#Leemos fichero
con <- file(fileURL,"r")
restTenerife <- read.csv2(con, sep = ",",  header = TRUE )
close(con)
View(restTenerife)#visualizamos tabla de datos
kable(head(restTenerife[,1:5])) 
#dimensiones dataset
dim(restTenerife) #total filas y columnas
names(restTenerife)#visualizamos variables filas
#Eliminamos columnas que no aportan informaci�n alguna
#clase
#ref
#fot
#tar
#act
restTenerife <-restTenerife[ , -c(1,7,13,14,15)]
View(restTenerife)#visualizamos tabla de datos
#Visualizamos si hay problemas con la �
length(grep("ñ",restTenerife$nombre))
length(grep("ñ",restTenerife$dir))
length(grep("ñ",restTenerife$email))
#Visualizamos si hay problemas con las tildes en las vocales
#tilde en a
length(grep("á",restTenerife$nombre))
length(grep("á",restTenerife$dir))
length(grep("á",restTenerife$email))
#tilde en e
length(grep("é",restTenerife$nombre))
length(grep("é",restTenerife$dir))
length(grep("é",restTenerife$email))
#tilde en o
length(grep("ó",restTenerife$nombre))
length(grep("ó",restTenerife$dir))
length(grep("ó",restTenerife$email))
#tilde en u
length(grep("ú",restTenerife$nombre))
length(grep("ú",restTenerife$dir))
length(grep("ú",restTenerife$email))
#tilde en i
length(grep("�",restTenerife$nombre))
length(grep("�",restTenerife$dir))
length(grep("�",restTenerife$email))
#Corregimos
#restTenerife$nombre <- replace(restTenerife$nombre,restTenerife$nombre=="ñ", "�")

###Corregimos �
if (length(grep("ñ",restTenerife$nombre)) >=1){
  restTenerife$nombre<-gsub("ñ", "�",restTenerife$nombre)
}
if (length(grep("ñ",restTenerife$dir))>=1){
  restTenerife$dir<-gsub("ñ", "�",restTenerife$dir)
}

if (length(grep("ñ",restTenerife$email))>=1){
  restTenerife$email<-gsub("ñ", "�",restTenerife$email)
}

## Corregimos tilde en a

if (length(grep("á",restTenerife$nombre))>=1){
  restTenerife$nombre<-gsub("á", "�",restTenerife$nombre)
}
if (length(grep("á",restTenerife$dir))>=1){
  restTenerife$dir<-gsub("á", "�",restTenerife$dir)
}
if (length(grep("á",restTenerife$email))>=1){
  restTenerife$dir<-gsub("á", "�",restTenerife$email)
}

## Corregimos tilde en e
if (length(grep("é",restTenerife$nombre ))>=1){
  restTenerife$nombre<-gsub("é", "�",restTenerife$nombre)
}

if (length(grep("é",restTenerife$dir))>=1){
  restTenerife$dir<-gsub("é", "�",restTenerife$dir)
}

if (length(grep("é",restTenerife$email))>=1){
  restTenerife$email<-gsub("é", "�",restTenerife$email)
}
## Corregimos tilde en o
if (length(grep("ó",restTenerife$nombre ))>=1){
  restTenerife$nombre<-gsub("ó", "�",restTenerife$nombre)
}

if (length(grep("ó",restTenerife$dir))>=1){
  restTenerife$dir<-gsub("ó", "�",restTenerife$dir)
}

if (length(grep("ó",restTenerife$email))>=1){
  restTenerife$email<-gsub("ó", "�",restTenerife$email)
}

##Corregimos tilde en u
if (length(grep("ú",restTenerife$nombre))>=1){
  restTenerife$nombre<-gsub("ú", "�",restTenerife$nombre)
}

if (length(grep("ú",restTenerife$dir))>=1){
  restTenerife$dir<-gsub("ú", "�",restTenerife$dir)
}

if (length(grep("ú",restTenerife$email))>=1){
  restTenerife$email<-gsub("ú", "�",restTenerife$email)
}
##Corregimos tilde en i
if (length(grep("�",restTenerife$nombre ))>=1){
  restTenerife$nombre<-gsub("�", "�",restTenerife$nombre)
}

if (length(grep("�",restTenerife$dir))>=1){
  restTenerife$dir<-gsub("�", "�",restTenerife$dir)
}

if (length(grep("�",restTenerife$email))>=1){
  restTenerife$email<-gsub("�", "�",restTenerife$email)
}

#Eliminamos los valores '0' de la columna fax pues se trata de un error
#Comprobamos
View(restTenerife)#visualizamos tabla de datos
length(grep("ñ",restTenerife$nombre))
length(grep("ñ",restTenerife$dir))
length(grep("ñ",restTenerife$email))
#tilde en a
length(grep("á",restTenerife$nombre))
length(grep("á",restTenerife$dir))
length(grep("á",restTenerife$email))
#tilde en e
length(grep("é",restTenerife$nombre))
length(grep("é",restTenerife$dir))
length(grep("é",restTenerife$email))
#tilde en o
length(grep("ó",restTenerife$nombre))
length(grep("ó",restTenerife$dir))
length(grep("ó",restTenerife$email))
#tilde en u
length(grep("ú",restTenerife$nombre))
length(grep("ú",restTenerife$dir))
length(grep("ú",restTenerife$email))
#tilde en i
length(grep("�",restTenerife$nombre))
length(grep("�",restTenerife$dir))
length(grep("�",restTenerife$email))

#Eliminamos los valores '0' de la columna fax pues se trata de un error
restTenerife$fax<-gsub("0", NA,restTenerife$fax)
#Renombramos columna lng a long de longitud por claridad
names(restTenerife)[11] ="long"
#Renombramos columna tf a telefono fijo (ya que nuestra intenci�n es dividir entre fijo/m�vil)
names(restTenerife)[9] ="telefono_fijo"
#a�adimos nueva columna movil
restTenerife$movil=restTenerife$telefono_fijo
View(restTenerife)
#Eliminar numeraci�n movil de la columna telefono_fijo
restTenerife$telefono_fijo<-gsub('[6]', NA ,restTenerife$telefono_fijo)
#Eliminar numeraci�n fija de la columna movil
restTenerife$movil<-gsub('[9]', NA ,restTenerife$movil)
#Ponemos la columna movil justo despues de la columna telefono_fijo
restTenerife = restTenerife[ , c(1,2,3,4,5,6,7,8,9,13,10,11,12)]
#Para simplificar columnas unificamos la columna sigla(calle, avenida,carretera,plaza) y dir elimando la columna sigla
pruebas<-restTenerife[ ,3:4]#Creamos dataframe temporal con estas dos variables
pruebas<-apply(pruebas,1, paste,collapse=" ")#Sobre dataframe pruebas concatenamos los datos separandolos con espacio
restTenerife$dir<-pruebas#Asignamos valores ya concatenados a la variable dir
restTenerife <-restTenerife[ , -c(3)]#Eliminamos columna sigla




# Guardamos el archivo csv de los datos procesados
outputFileName <- paste0("../datos/HosteleriaTenerife_tidy ",format(Sys.time(),"%Y-%m-%d_%H-%M-%S"),".csv")
outputFileName
#Guardamos tabla en formato CSV sin indices por filas y valores NA sean celdas en blanco
write.csv2(as.data.frame(restTenerife), outputFileName, row.names = FALSE, na="")



