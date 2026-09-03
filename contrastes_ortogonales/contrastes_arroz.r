# Dr. Byron González
# http://byrong.cc
# Práctica sobre Contrastes Ortogonales

if(!require(readxl)){install.packages("readxl")}
if(!require(dplyr)){install.packages("dplyr")}
if(!require(car)){install.packages("car")}
if(!require(multcomp)){install.packages("multcomp")}

arrozc<-read_excel("data/arrozcontrast.xlsx")
head(arrozc)

# Convertir a factores
arrozc$rep <- as.factor(arrozc$rep)
arrozc$trat <- as.factor(arrozc$trat)

modelo <- aov(prod_arroz ~ trat, data = arrozc)
summary(modelo)

# Crear matriz de contrastes
contrastes <- matrix(c(
  2, 2,  2, -3, -3,    # C1
  1, 1, -2, 0, 0,     # C2
  1, -1, 0, 0, 0,     # C3
  0, 0,  0, 1, -1     # C4
  ), nrow = 4, byrow = TRUE)

# Asignar nombres
rownames(contrastes) <- c("Nitratos vs Urea y Sulfato", "Nitrato Ca y Na vs Nitrato de amonio", 
                          "Nitrato Ca vs Nitrato Na", "Urea vs Sulfato")

# Asignar contrastes a la variable
contrasts(arrozc$trat) <- contras <- t(contrastes)

modelo_contrastes <- aov(prod_arroz ~ trat, data = arrozc)
summary(modelo_contrastes, split = list(trat = list(
  "Nitratos vs Urea y Sulfato" = 1,
  "Nitrato Ca y Na vs Nitrato de amonio" = 2,
  "Nitrato Ca vs Nitrato Na" = 3,
  "Urea vs Sulfato" = 4
)))

# Calcular los valores de los contrastes
colnames(contrastes) <- levels(arrozc$trat)

# Aplicar contrastes con glht()
res_contrastes <- glht(modelo, linfct = mcp(trat = contrastes))

# Mostrar resumen con valores estimados de los contrastes (con signo)
summary(res_contrastes)
