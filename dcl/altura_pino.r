# Dr. Byron González
# Práctica 8

if(!require(AgroR)){install.packages("AgroR")}
if(!require(readxl)){install.packages("readxl")}
if(!require(agricolae)){install.packages("agricolae")}

pino<-read_excel("data/alturapino.xlsx")

head(pino)

# Análisis del cuadrado latino
with(pino,DQL(trat,pendiente,esolar,altura,mcomp = "tukey"))

# Tukey para tratamientos, filas (pendiente) y columnas (esolar)
pino$trat <- factor(pino$trat)
pino$pendiente <- factor(pino$pendiente)
pino$esolar <- factor(pino$esolar)

modelo_dcl <- aov(altura ~ trat + pendiente + esolar, data = pino)
summary(modelo_dcl)

tukey_trat <- TukeyHSD(modelo_dcl, "trat"); tukey_trat
tukey_pendiente <- TukeyHSD(modelo_dcl, "pendiente"); tukey_pendiente
tukey_esolar <- TukeyHSD(modelo_dcl, "esolar"); tukey_esolar

literales_tukey <- function(modelo, factor_comparar) {
	resultado <- HSD.test(modelo, factor_comparar, group = TRUE, console = TRUE)
	grupos <- resultado$groups
	grupos[order(grupos[[1]], decreasing = TRUE), , drop = FALSE]
}

literales_trat <- literales_tukey(modelo_dcl, "trat")
literales_pendiente <- literales_tukey(modelo_dcl, "pendiente")
literales_esolar <- literales_tukey(modelo_dcl, "esolar")




