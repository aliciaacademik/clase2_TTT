options(digits = 3) # reportar 3 cifras significativas
library(tidyverse)
library(titanic)
library(ggplot2)
library(dplyr)

titanic <- titanic_train %>%
  select(Survived, Pclass, Sex, Age, SibSp, Parch, Fare) %>%
  mutate(Survived = factor(Survived),
         Pclass = factor(Pclass),
         Sex = factor(Sex))
titanic
head(titanic)

names(titanic_train)
class(titanic_train$Survived)
class(titanic_train$Pclass)
class(titanic_train$Sex)
class(titanic_train$SibSp)
class(titanic_train$Parch)
class(titanic_train$Fare)

str(titanic_train)

ggplot(titanic_train, aes(Age, fill = Sex)) +
  geom_density(color = "green", size = 1, bw = 0.9, position = "stack")

ggplot(titanic_train, aes(Sex, Age, color = Sex)) +
  geom_boxplot()

params <- titanic_train|>
  filter(!is.na(Age))|>
  summarize(mean = mean(Age), sd = sd(Age))
params                                    

ggplot(titanic_train, aes(Age, ))+
  geom_qq()+
  geom_abline()

titanic <- na.omit(titanic_train)
titanic
titanic_edad <- na.omit(titanic_train$Age)
titanic_edad

edad_titanic <- na.omit(titanic_train$Age)

# Crear el gráfico QQ usando ggplot2 y geom_qq()
ggplot(data.frame(Edad = edad_titanic), aes(sample = Edad)) +
  geom_qq() +
  geom_qq_line() +
  ggtitle("QQ Plot de la Edad de Pasajeros del Titanic")


titanic_df <- titanic_train %>%
  filter(!is.na(Age))

# Crear el gráfico QQ con geom_qq() y agregar línea de identidad
ggplot(titanic_df, aes(sample = Age)) +
  geom_qq(lineend = "se", linecolor = "blue", shape = 1) +  # Puedes ajustar parámetros aquí
  geom_qq_line(color = "red") +  # Línea de referencia
  geom_abline(intercept = 0, slope = 1, linetype = "dashed", color = "gray") + 
  ggtitle("QQ Plot de Edad de Pasajeros del Titanic")

ggplot(titanic_train, aes(Sex, Survived)) +
  geom_bar(stat = "identity", position = "dodge", color = "black")+
  theme_classic()

library(dplyr)

# Filtrar solo a los sobrevivientes
sobrevivientes <- titanic_train %>%
  filter(Survived == 1)

# Contar cuántos son hombres
hombres <- sobrevivientes %>%
  filter(Sex == "male") %>%
  nrow()
# Contar cuántos hombres sobrevivieron
hombres_surv <- hombres %>%
  filter(Survived == 1) %>%
  nrow()

# Contar cuántas son mujeres
mujeres <- sobrevivientes %>%
  filter(Sex == "female") %>%
  nrow()

# ¿La mayoría fueron hombres?
if(hombres > mujeres) {
  print("La mayoría de los sobrevivientes fueron hombres.")
} else {
  print("La mayoría de los sobrevivientes fueron mujeres.")
}

# Contar cuántos hombres no sobrevivieron
hombres_no_surv <- hombres %>%
  filter(Survived == 0) %>%
  nrow()

# ¿La mayoría de los hombres sobrevivió?
if(hombres_surv > hombres_no_surv) {
  print("La mayoría de los hombres sobrevivieron.")
} else {
  print("La mayoría de los hombres no sobrevivieron.")
}

data("titanic_train", package = "titanic")
sobrevivientes <- titanic_train %>% filter(Survived == 1)
head(sobrevivientes)


total_pasajeros <- nrow(titanic_train)
sobrevivientes <- sum(titanic_train$Survived == 1)

# Crear un data frame con los conteos
df <- data.frame(
  Categoria = c("Total", "Sobrevivieron"),
  Cantidad = c(total_pasajeros, sobrevivientes)
)

# Dibujar la gráfica de barras
ggplot(df, aes(x = Categoria, y = Cantidad, fill = Categoria)) +
  geom_bar(stat = "identity") +
  ggtitle("Número de pasajeros y sobrevivientes") +
  ylab("Cantidad") +
  theme_minimal()

ggplot(titanic_train, aes(Age, color = Survived))+
  geom_density()

ggplot(titanic_train, aes(Survived, ))+
  geom_histogram()

ggplot(titanic_train, aes(Survived, Age))+
  geom_boxplot()

# grafico con barras de muerte y sobreviviencia por edad ####
ggplot(titanic, aes(x = Age, fill = factor(Survived))) +
  geom_histogram(position = "identity", binwidth = 5, color = "black") +
  scale_y_continuous(name = "Conteo") +  # Eje y en conteo
  scale_fill_manual(values = c("red", "blue"),
                    labels = c("No sobrevivió", "Sobrevivió"),
                    name = "Estado") +
  ggtitle("Distribución de Edad por Supervivencia")


ggplot(titanic_train, aes(Survived, Age))+
  geom_point()

names(titanic_train)


resultados <- titanic_train %>%
  group_by(Age) %>%
  summarise(
    total_personas = n(),
    muertes = sum(Survived == 0)
  ) %>%
  mutate(proporcion_muerte = muertes / total_personas)

# Encontrar el grupo con la proporción más alta
grupo_max_muerte <- resultados %>%
  filter(proporcion_muerte == max(proporcion_muerte))

print(grupo_max_muerte)


#hacer bosplot de tarifa agrupada por sobrevivencia, transformando a log2 las tarrifas y agregando puntos de datos con jitter
titanic <- titanic_train %>% filter(!is.na(Fare), !is.na(Survived))

# Crear el gráfico
ggplot(titanic, aes(x = factor(Survived), y = log2(Fare))) +
  geom_boxplot() +
  geom_jitter(width = 0.2, aes(color = factor(Survived))) +
  scale_x_discrete(labels = c("No sobrevivió", "Sobrevivió")) +
  xlab("Supervivencia") +
  ylab("log2(Tarifa)") +
  ggtitle("Boxplot de Tarifa por Estado de Supervivencia con Puntos Jitter")


ggplot(titanic, aes(x = factor(Survived), y = Fare)) +
  geom_boxplot() +
  geom_jitter(width = 0.2, aes(color = factor(Survived))) +
  scale_x_discrete(labels = c("No sobrevivió", "Sobrevivió")) +
  xlab("Supervivencia") +
  ylab("log2(Tarifa)") +
  ggtitle("Boxplot de Tarifa por Estado de Supervivencia con Puntos Jitter")


#clase de pasajero por supervivencia
ggplot(titanic, aes(x = Pclass, fill = factor(Survived))) +
  geom_bar() +
  scale_fill_manual(values = c("red", "green"), labels = c("No", "Sí")) +
  labs(title = "Clase de pasajero rellenado por supervivencia",
       fill = "Sobrevivió")

names(titanic_train)

#proporción clase por supervivencia
ggplot(titanic, aes(x = Pclass, fill = factor(Survived))) +
  geom_bar(position = position_fill()) +
  scale_fill_manual(values = c("red", "green"), labels = c("No", "Sí")) +
  labs(title = "Proporciones en clase de pasajero por supervivencia",
       fill = "Sobrevivió")

ggplot(titanic, aes(x = factor(Survived), fill = Pclass)) +
  geom_bar(position = position_fill()) +
  labs(title = "Supervivencia rellenado por clase de pasajero",
       x = "Sobrevivió",
       fill = "Clase")

#crear una cuadrícula de graficos de densidad para edad rellenados por supervivencia con recuento en eje y divididos por sexo y clase de pasajero
ggplot(titanic, aes(x = Age, fill = factor(Survived))) +
  geom_density(alpha = 0.5, aes(y = ..count..)) + # densidad con recuento en y
  facet_grid(Sex ~ Pclass) +                      # dividir por sexo y clase
  scale_fill_manual(values = c("red", "blue"), labels = c("No Sobrevivió", "Sobrevivió"), name = "Supervivencia") +
  labs(title = "Densidad de Edad por Supervivencia, Sexo y Clase") +
  theme_minimal()

titanic_train 
n_mujeres <- titanic_train %>% filter(Sex == "female") %>% nrow()

# Contar cuántos hombres
n_hombres <- titanic_train %>% filter(Sex == "male") %>% nrow()

# Mostrar resultados
cat("Mujeres:", n_mujeres, "\nHombres:", n_hombres)

select(fare)
titanic_train|> pull(Fare) |> max()

ggplot(titanic, aes(x = Age, fill = factor(Survived))) +
  geom_density(alpha = 0.5, aes(y = ..count..)) + # densidad con recuento en y
  facet_grid(~Sex) +                      # dividir por sexo y clase
  scale_fill_manual(values = c("red", "blue"), labels = c("No Sobrevivió", "Sobrevivió"), name = "Supervivencia") +
  labs(title = "Densidad de Edad por Supervivencia, Sexo y Clase") +
  theme_minimal()

ggplot(titanic, aes(x = Age, fill = factor(Survived))) +
  geom_density(alpha = 0.5, aes(y = ..count..)) + # densidad con recuento en y
  facet_grid(~Pclass) +                      # dividir por sexo y clase
  scale_fill_manual(values = c("red", "blue"), labels = c("No Sobrevivió", "Sobrevivió"), name = "Supervivencia") +
  labs(title = "Densidad de Edad por Supervivencia, Sexo y Clase") +
  theme_minimal()

ggplot(titanic, aes(x = Age, fill = factor(Survived))) +
  geom_density(alpha = 0.5, aes(y = ..count..)) + # densidad con recuento en y
  facet_grid(~Pclass) +                      # dividir por sexo y clase
  scale_fill_manual(values = c("red", "blue"), labels = c("No Sobrevivió", "Sobrevivió"), name = "Supervivencia") +
  labs(title = "Densidad de Edad por Supervivencia, Sexo y Clase") +
  theme_minimal()