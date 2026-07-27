# Dr. Byron González
# Práctica DCA

if(!require(AgroR)){install.packages("AgroR")}
if(!require(readxl)){install.packages("readxl")}

raiz<-read_excel("lraiz.xlsx")
head(raiz)
with(raiz,DIC(concentracion,longraiz,mcomp = "tukey"))
medias <- aggregate(longraiz ~ concentracion, data = raiz, mean)
medias_ordenadas <- medias[order(medias$longraiz, decreasing = TRUE), ]
medias_ordenadas