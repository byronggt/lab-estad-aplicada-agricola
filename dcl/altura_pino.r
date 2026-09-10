# Dr. Byron González
# Práctica 8

if(!require(AgroR)){install.packages("AgroR")}
if(!require(AgroR)){install.packages("AgroR")}
if(!require(readxl)){install.packages("readxl")}

pino<-read_excel("alturapino.xlsx")

head(pino)
with(pino,DQL(trat,pendiente,esolar,altura,mcomp = "tukey"))
