# Dr. Byron González
# Práctica 9

if(!require(AgroR)){install.packages("AgroR")}
if(!require(readxl)){install.packages("readxl")}

bambu<-read_excel("alturabambu.xlsx")
head(bambu)

with(bambu,FAT2DBC(espacio,edad_rizoma,rep,altura,mcomp = "sk"))
