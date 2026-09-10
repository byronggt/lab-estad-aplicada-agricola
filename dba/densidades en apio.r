# Dr. Byron González
# http://byrong.cc
# Diseño en bloques completos al azar

if(!require(AgroR)){install.packages("AgroR")}
if(!require(readxl)){install.packages("readxl")}
if(!require(agricolae)){install.packages("agricolae")}

apio<-read_excel("data/apiodens.xlsx")

head(apio)
win.graph(11,11)
with(apio,DBC(densidad,bloque,rend,mcomp = "sk"))

apio$densidad <- factor(apio$densidad)
apio$bloque <- factor(apio$bloque)

modelo_dba <- aov(rend ~ densidad + bloque, data = apio)
summary(modelo_dba)

tukey_densidad <- HSD.test(modelo_dba, "densidad", group = TRUE, console = TRUE)
literales_densidad <- tukey_densidad$groups
literales_densidad[order(literales_densidad$rend, decreasing = TRUE), , drop = FALSE]
plot(tukey_densidad, main = "Prueba de Tukey - Rendimiento por densidad")

