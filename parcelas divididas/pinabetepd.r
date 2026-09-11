# Dr. Byron González
# Práctica 10

if(!require(AgroR)){install.packages("AgroR")}
if(!require(readxl)){install.packages("readxl")}

pinabete<-read_excel("data/pdpinabete.xlsx")
head(pinabete)

with(pinabete, PSUBDBC(edad, fecha_siembra, rep, altura, ylab="altura", mcomp = "sk"))

# Transformar la variable altura

if(!require(car)){install.packages("car")}
summary(powerTransform(pinabete$altura))
pinabete$alturat<-(pinabete$altura^3.3833-1/3.3833)
head(pinabete)
hist(pinabete$altura)
hist(pinabete$alturat)

# Anova con la variable altura transformada

with(pinabete, PSUBDBC(edad, fecha_siembra, rep, alturat, ylab="altura", mcomp = "sk"))

## Anova con modelos mixtos


# Opción completa de modelos mixtos

# 1. Cargar librerías necesarias
if(!require(nlme)){install.packages("nlme")}
if(!require(emmeans)){install.packages("emmeans")}
if(!require(multcompView)){install.packages("multcompView")}
library(multcomp)
library(emmeans)
library(nlme)


# 2. Definir el modelo con varianzas heterogéneas
# Usamos weights = varIdent para permitir una varianza distinta por cada nivel de 'edad'
# La estructura random = ~1 | rep/edad define el diseño de parcelas divididas
modelo_final <- lme(altura ~ edad * fecha_siembra, 
                    random = ~1 | rep/edad, 
                    weights = varIdent(form = ~ 1 | edad), 
                    data = pinabete,
                    method = "REML")

# Verificación de residuos
plot(modelo_final)
anova(modelo_final)


# 3. Anova del modelo para confirmar significancia
anova(modelo_final)

# 4. Prueba de comparación de medias (Post-hoc)
# Aunque la interacción no sea significativa, es posible obtener las comparaciones
# de los efectos principales o de la interacción misma:

# Opción A: Comparación de medias para la interacción (componente solicitado)
comp_interaccion <- emmeans(modelo_final, pairwise ~ edad | fecha_siembra, adjust = "tukey")
print(comp_interaccion$contrasts)

# Opción B: Obtener letras de significancia (Compact Letter Display)
# Esto facilita la interpretación en cuadros o gráficas
letras_interaccion <- cld(emmeans(modelo_final, ~ edad * fecha_siembra), Letters = letters)
print(letras_interaccion)

# Gráfico de Residuos vs Predichos
plot(modelo_final, resid(., type = "pearson") ~ fitted(.),
     abline = 0, main = "Residuos Normalizados vs. Ajustados",
     xlab = "Valores Ajustados (Altura)", ylab = "Residuos de Pearson")

# Gráfico de Normalidad (QQ-Plot)
qqnorm(resid(modelo_final, type = "pearson"))
qqline(resid(modelo_final, type = "pearson"))

