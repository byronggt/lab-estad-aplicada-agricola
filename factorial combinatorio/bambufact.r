# Dr. Byron González
# Práctica 9

if(!require(AgroR)){install.packages("AgroR")}
if(!require(readxl)){install.packages("readxl")}
if(!require(agricolae)){install.packages("agricolae")}

bambu<-read_excel("data/alturabambu.xlsx")
head(bambu)

with(bambu,FAT2DBC(espacio,edad_rizoma,rep,altura,mcomp = "sk"))

bambu$espacio <- factor(bambu$espacio)
bambu$edad_rizoma <- factor(bambu$edad_rizoma)
bambu$rep <- factor(bambu$rep)

modelo_anova <- aov(altura ~ espacio * edad_rizoma + rep, data = bambu)
summary(modelo_anova)

tukey_interaccion <- HSD.test(
	modelo_anova,
	c("espacio", "edad_rizoma"),
	group = TRUE,
	console = TRUE
)
tukey_interaccion$groups
