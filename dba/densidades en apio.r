# Dr. Byron González
# http://byrong.cc
# Diseño en bloques completos al azar

if(!require(AgroR)){install.packages("AgroR")}
if(!require(readxl)){install.packages("readxl")}

apio<-read_excel("data/apiodens.xlsx")

head(apio)
win.graph(11,11)
with(apio,DBC(densidad,bloque,rend,mcomp = "sk"))
