# Dr. Byron González
# Práctica DCA

if(!require(AgroR)){install.packages("AgroR")}
if(!require(readxl)){install.packages("readxl")}
if(!require(agricolae)){install.packages("agricolae")}

raiz<-read_excel("data/lraiz.xlsx")
head(raiz)
with(raiz,DIC(concentracion,longraiz,mcomp = "tukey"))
medias <- aggregate(longraiz ~ concentracion, data = raiz, mean)
medias_ordenadas <- medias[order(medias$longraiz, decreasing = TRUE), ]
medias_ordenadas

modelo <- aov(longraiz ~ concentracion, data = raiz)
summary(modelo)

tukey_agricolae <- HSD.test(modelo, "concentracion", group = TRUE, console = TRUE)
tukey_agricolae$groups
plot(tukey_agricolae, main = "Prueba de Tukey - Longitud de raíz")

