# Dr. Byron González
# http://byrong.cc


if(!require(readxl)){install.packages("readxl")}
if(!require(dplyr)){install.packages("dplyr")}
if(!require(DescTools)){install.packages("DescTools")}
if(!require(samplingbook)){install.packages("samplingbook")}

#===============Muestreo simple aleatorio=======================================
data<-read_excel("data/alturapblanco.xlsx")
set.seed(123)
head(data)
colnames(data)

# Tomar 30 datos iniciales para calcular el tamaño de muestra
muestra <- sample(1:nrow(data), size = 30, replace=FALSE)
muestra
data_msa <- data[muestra, ]
print(data_msa, n=30)

# Calcular el valor de "e" 
precision=qnorm(0.025, lower.tail = F)*(sd(data_msa$alturapblanco)/sqrt(30));precision

# Calcular el tamaño de muestra para un e y sd
# Aquí se ha seleccionado un e= 4
n_muestra <- sample.size.mean(e = 4, sd(data_msa$alturapblanco), N = Inf, level = 0.95)
n_muestra

# Completar la muestra considerando los 30 iniciales
data_restante <- data[-muestra, ] # A la tabla original se resta 30
muestra_complemento <- sample(1:nrow(data_restante),size=(n_muestra$n-30), replace=FALSE)
muestra_definitiva<-rbind(data_restante[muestra_complemento, ], data_msa)
print(muestra_definitiva, n=61)

#Calcular el intervalo de confianza para la media
ic_mean<- MeanCI(x=muestra_definitiva$alturapblanco, trim = 0, conf.level = 0.95, na.rm = FALSE);ic_mean
