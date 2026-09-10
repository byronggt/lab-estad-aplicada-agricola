# Dr. Byron González
# Práctica 8

if(!require(AgroR)){install.packages("AgroR")}
if(!require(AgroR)){install.packages("AgroR")}
if(!require(readxl)){install.packages("readxl")}

pino<-read_excel("alturapino.xlsx")

head(pino)

# Análisis del cuadrado latino
with(pino,DQL(trat,pendiente,esolar,altura,mcomp = "tukey"))

# Tukey para tratamientos, filas (pendiente) y columnas (esolar)
pino$trat <- factor(pino$trat)
pino$pendiente <- factor(pino$pendiente)
pino$esolar <- factor(pino$esolar)

modelo_dcl <- aov(altura ~ trat + pendiente + esolar, data = pino)
summary(modelo_dcl)

tukey_trat <- TukeyHSD(modelo_dcl, "trat")
tukey_pendiente <- TukeyHSD(modelo_dcl, "pendiente")
tukey_esolar <- TukeyHSD(modelo_dcl, "esolar")

tukey_trat
tukey_pendiente
tukey_esolar
