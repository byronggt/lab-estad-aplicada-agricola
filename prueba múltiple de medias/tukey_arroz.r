# Dr. Byron González
# Prueba múltiple de medias bajo el criterio de Tukey para arroz

if(!require(AgroR)){install.packages("AgroR")}
if(!require(readxl)){install.packages("readxl")}
if(!require(agricolae)){install.packages("agricolae")}


arroz<-read_excel("data/arroznitrog.xlsx")
head(arroz)

with(arroz,DIC(trat,prod_arroz,mcomp = "tukey"))
media<-mean(arroz$prod_arroz); media
desvest<-sqrt(26.3395); desvest
cv=(desvest/media)*100;cv

mod<-aov(prod_arroz~trat,data=arroz)
summary(mod)
tukey_agricolae <- HSD.test(mod, "trat", group = TRUE, console = TRUE)
plot(tukey_agricolae, main = "Prueba de Tukey - Producción de Arroz")

==